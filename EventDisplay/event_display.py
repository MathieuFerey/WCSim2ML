import numpy as np
import matplotlib.pyplot as plt
import uproot as up
import tkinter as tk
import os

from matplotlib.backends.backend_tkagg import (FigureCanvasTkAgg, NavigationToolbar2Tk)

#os.environ["XDG_SESSION_TYPE"] = "xcb"

# Access events root file ==================================================================

experiment = 'WCTE' # 'SK' or 'HK' or 'WCTE'

path2events = '../Data/' + experiment + '/'
events_file = '10_mu-_uni200-1000MeV_GPS.root'

events_to_display = 8 # 'all' to display all events, or tuple (event_start, event_end) to display all events between the event_start'th to the event_end'th events, or int event_index to only display the event_index'th event



# Some useful detector dimensions (in cm) ======================================================================================

detector_geom = {'SK': {'height': 3620.0, 'cylinder_radius': 3368.15/2, 'PMT_radius': 25.4}, 'HK': {'height': 6575.1, 'cylinder_radius': 6480/2, 'PMT_radius': 25.4}, 'WCTE': {'height': 338.0, 'cylinder_radius': 369.6/2, 'PMT_radius': 4.0}}


# Useful plot functions =======================================================================================

def rescale_color(x) : # rescale colors with sigmoid to have better color range
  if len(x) > 1 :
    return 1 / (1 + np.exp(-(x-np.mean(x))/np.std(x))) # sigmoid
  return x


def compute_PMT_marker_size(PMT_radius, fig, ax) : # compute the size of PMT scatter markers in points^2 given the PMT radius in cm for a given figure and axes
    
    xlim = ax.get_xlim()
    ylim = ax.get_ylim()

    dpi = fig.get_dpi()
    fig_width, fig_height = fig.get_size_inches() * dpi
    x_points_per_data_unit = fig_width / (xlim[1] - xlim[0])
    y_points_per_data_unit = fig_height / (ylim[1] - ylim[0])

    avg_points_per_data_unit = (x_points_per_data_unit + y_points_per_data_unit) / 2

    sizes_in_points2 = (PMT_radius * avg_points_per_data_unit) ** 2

    return sizes_in_points2


# Deal with data =======================================================================================

def project2d(x, y, z, detector_geom, experiment) : # project 3D PMT positions of an event to 2D unfolded cylinder (very ugly please Erwan do not look at this... I think it's Thomas' code anyway)

  cylinder_radius = detector_geom[experiment]['cylinder_radius']
  zMax = detector_geom[experiment]['height']/2
  zMin = -detector_geom[experiment]['height']/2

  N = len(x)
  xproj = []
  yproj = []

  if experiment == 'WCTE' : # WCTE bottom and top cap no symmetrical! top PMTs are further away from the last row of cylinder PMTs than the bottom PMTs, and beware of spherical structure of mPMTs
    
    # values adjusted by hand so as to correctly identify the top and bottom PMTs, maybe get info from WCSim in PMT id or something
    eps_top = 60
    eps_bottom = 50

  else :
    eps_top = 0.01
    eps_bottom = 0.01

  for i in range(N) :

    if z[i] < zMax - eps_top and z[i] > zMin + eps_bottom : # cylinder
      
      azimuth = np.arctan2(y[i], x[i])
      
      if azimuth < 0:
        azimuth = 2 * np.pi + azimuth

      xproj.append(cylinder_radius * (azimuth - np.pi))
      yproj.append(z[i])

    elif z[i] > zMax - eps_top : # top cap
      
      xproj.append(- y[i])
      yproj.append(x[i] + zMax + cylinder_radius)
   
    else : # bottom cap
      
      xproj.append(- y[i])
      yproj.append(- x[i] + zMin - cylinder_radius)

  return np.array(xproj),np.array(yproj)



def events_index_bounds(events_to_display, n_events) : # get the bounds of the events to display

  if events_to_display == 'all' : # display all events
      event_start = 0
      event_end = n_events

  elif isinstance(events_to_display, tuple) : # display only a subrange of events

    if events_to_display[0] < 0 or events_to_display[1] > n_events or events_to_display[0] > events_to_display[1] :
      print('Error: events index out of bounds. Displaying first event instead.')
      event_start = 0
      event_end = 1
    
    event_start = events_to_display[0]
    event_end = events_to_display[1]
    
  elif isinstance(events_to_display, int) : # display only one event

    if events_to_display < 0 or events_to_display >= n_events :
      print('Error: event index out of bounds. Displaying first event instead.')
      event_start = 0
      event_end = 1

    event_start = events_to_display
    event_end = events_to_display + 1

  else :
    print('Error: events_to_display should be an integer, a tuple or "all". Displaying first event instead.')
    event_start = 0
    event_end = 1

  return event_start, event_end

    

def load_data(path2events, events_file, detector_geom, experiment, events_to_display='all') : # load data from root file and project it to 2D

    print('Loading data...')
    file = up.open(path2events + events_file)
    events_root = file['root_event'] # TTree of events variables {'hitx', 'hity', 'hitz', 'charge', 'time'}

    n_events = len(events_root['hitx'].array()) # number of events

    hitx = events_root['hitx'].array(library='np')
    hity = events_root['hity'].array(library='np')
    hitz = events_root['hitz'].array(library='np')
    charge = events_root['charge'].array(library='np')
    time = events_root['time'].array(library='np')

    event_start, event_end = events_index_bounds(events_to_display, n_events)

    events_dic = {'xproj': [], 'yproj': [], 'charge': [], 'time': []} # python dictionary to store data

    
    print('2D projection...')

    for event_index in range(event_start, event_end) :

      if experiment == 'WCTE' : # WCTE is rotated in WCSim to have beam on the z axis, rotate it back to have cylinder axis on z axis like SK and HK, then rotate a tiny bit around z axis so as not to cut a column of PMTs in half (but also rotate the top and bottom caps though...)
      
        if event_index == 0 : print('Rotating WCTE events...')

        thetax = np.pi/2
        Rx = np.array([[1, 0, 0], [0, np.cos(thetax), -np.sin(thetax)], [0, np.sin(thetax), np.cos(thetax)]])
        thetaz = 4.53
        Rz = np.array([[np.cos(thetaz), -np.sin(thetaz), 0], [np.sin(thetaz), np.cos(thetaz), 0], [0, 0, 1]])

        hitR = Rz@Rx@np.array([hitx[event_index], hity[event_index], hitz[event_index]])
        hitx[event_index], hity[event_index], hitz[event_index] = hitR[0], hitR[1], hitR[2]

      x2D, y2D = project2d(hitx[event_index], hity[event_index], hitz[event_index], detector_geom, experiment) 
      events_dic['xproj'].append(x2D)
      events_dic['yproj'].append(y2D)
      events_dic['charge'].append(charge[event_index])
      events_dic['time'].append(time[event_index])

    return events_dic, n_events


# Tkinter GUI =======================================================================================================================

def show_event_display(path2events, events_file, detector_geom, experiment, events_to_display='all'): #plot event display with tkinter animation

  PMT_radius = detector_geom[experiment]['PMT_radius']
  cylinder_radius = detector_geom[experiment]['cylinder_radius']
  zMax = detector_geom[experiment]['height']/2
  zMin = -detector_geom[experiment]['height']/2

  if experiment == 'WCTE' : # make WCTE subPMTs smaller than what they really are, otherwise their spherical disposition will appear cramped when projected
    PMT_radius -= 2

  events_dic, n_events = load_data(path2events, events_file, detector_geom, experiment, events_to_display = events_to_display)

  print('Opening display...')

  times = events_dic['time']

  def update_time_slider(event_index) : # update time slider according to event_slider

    event_index = int(event_index) - event_start
    time = times[event_index]
    time = np.sort(time)

    wt.config(from_=time[0], to=time[-1], resolution=(time[-1]-time[0])/100000)
    wt.set(times[event_index][-1])

  fig, ax = plt.subplots(figsize = (6,6))

  def plot(input): # plot command to be called by tkinter slider

    # set figure and axes
    ax.clear()
    fig.suptitle(experiment + ' Event Display')
    ax.set_xlim(-np.pi*cylinder_radius - 10, np.pi*cylinder_radius + 10)
    ax.set_ylim(zMin-2*cylinder_radius - 10, zMax+2*cylinder_radius + 10)
    ax.set_aspect('equal')
    ax.set_xlabel(r'$x$ (cm)')
    ax.set_ylabel(r'$z$ (cm)')

    # draw detector
    ax.add_patch(plt.Rectangle((-np.pi*cylinder_radius, zMin), 2*np.pi*cylinder_radius, 2*zMax,fill=False))
    ax.add_patch(plt.Circle((0, zMax+cylinder_radius), cylinder_radius, fill=False))
    ax.add_patch(plt.Circle((0, zMin-cylinder_radius), cylinder_radius, fill=False))

    # get event
    if input == 'event_slider':

      event_index = wE.get()
      wB.delete(0, tk.END)  # Clear any existing value
      wB.insert(0, event_index) 
      update_time_slider(event_index)
    
    elif input == 'entry_box':

      event_index = int(wB.get())
      wE.set(event_index)
      update_time_slider(event_index)

    elif input == 'time_slider':

      event_index = wE.get()

    else :
      event_index = event_start

    event_index -= event_start


    x2D, y2D, charge, time = events_dic['xproj'][event_index], events_dic['yproj'][event_index], events_dic['charge'][event_index], events_dic['time'][event_index]

    sorting_indices = np.argsort(time) # sort by time of trigger, so as to display them accordingly
    x2D, y2D, charge, time = x2D[sorting_indices], y2D[sorting_indices], charge[sorting_indices], time[sorting_indices]

    tmax = wt.get()

    x_before_t, y_before_t, charge_before_t = x2D[time < tmax], y2D[time < tmax], charge[time < tmax]
    ax.scatter(x_before_t, y_before_t, s=compute_PMT_marker_size(PMT_radius, fig, ax), c=rescale_color(charge_before_t), cmap='plasma')

    canvas.draw()

  # defining tkinter window ==========================
  root = tk.Tk()
  root.wm_title("Event Display")

  # embedding matplotlib figure in tkinter window ==============
  canvas = FigureCanvasTkAgg(fig, master=root)  # A tk.DrawingArea.
  canvas.draw()
  canvas.get_tk_widget().pack(side=tk.TOP, fill=tk.BOTH, expand=1)
  toolbar = NavigationToolbar2Tk(canvas, root)
  toolbar.update()

  event_start, event_end = events_index_bounds(events_to_display, n_events)

  # entry box =========================================================

  wB = tk.Entry(root)
  wB.pack()
  tk.Label(root, text='', width=2).pack()

  button = tk.Button(root, text='Display Event', command=lambda : plot('entry_box'))
  button.pack()


  # event slider =====================================================
  wE = tk.Scale(root, from_=event_start, to=event_end-1, orient=tk.HORIZONTAL, command=lambda _: plot('event_slider'))
  wE.pack()
  tk.Label(root, text = 'Slide events').pack()

  # time slider =======================================================
  wt = tk.Scale(root, orient=tk.HORIZONTAL, command=lambda _: plot('time_slider'))
  wt.pack()
  tk.Label(root, text = 'Time').pack()

  update_time_slider(event_start)


  def _quit():
      root.quit()
      root.destroy()

  root.protocol("WM_DELETE_WINDOW", _quit)    
  plot('0')
  root.mainloop()



# Main ===========================================================================================


show_event_display(path2events, events_file, detector_geom, experiment, events_to_display=events_to_display)
  
  



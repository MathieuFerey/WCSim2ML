# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.29

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /pbs/software/redhat-9-x86_64/cmake/3.29.2/bin/cmake

# The command to remove a file.
RM = /pbs/software/redhat-9-x86_64/cmake/3.29.2/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /pbs/home/m/mferey/WCSim/v1.12.8/WCSim

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /pbs/home/m/mferey/WCSim/v1.12.8/build

# Utility rule file for G__WCSimRoot.

# Include any custom commands dependencies for this target.
include src/CMakeFiles/G__WCSimRoot.dir/compiler_depend.make

# Include the progress variables for this target.
include src/CMakeFiles/G__WCSimRoot.dir/progress.make

src/CMakeFiles/G__WCSimRoot: src/G__WCSimRoot.cxx
src/CMakeFiles/G__WCSimRoot: src/libWCSimRoot_rdict.pcm
src/CMakeFiles/G__WCSimRoot: src/libWCSimRoot.rootmap

src/G__WCSimRoot.cxx: /pbs/home/m/mferey/WCSim/v1.12.8/WCSim/include/WCSimRootLinkDef.hh
src/G__WCSimRoot.cxx: /pbs/home/m/mferey/WCSim/v1.12.8/WCSim/include/jhfNtuple.h
src/G__WCSimRoot.cxx: /pbs/home/m/mferey/WCSim/v1.12.8/WCSim/include/WCSimRootEvent.hh
src/G__WCSimRoot.cxx: /pbs/home/m/mferey/WCSim/v1.12.8/WCSim/include/WCSimRootGeom.hh
src/G__WCSimRoot.cxx: /pbs/home/m/mferey/WCSim/v1.12.8/WCSim/include/WCSimPmtInfo.hh
src/G__WCSimRoot.cxx: /pbs/home/m/mferey/WCSim/v1.12.8/WCSim/include/WCSimEnumerations.hh
src/G__WCSimRoot.cxx: /pbs/home/m/mferey/WCSim/v1.12.8/WCSim/include/WCSimRootOptions.hh
src/G__WCSimRoot.cxx: /pbs/home/m/mferey/WCSim/v1.12.8/WCSim/include/WCSimRootTools.hh
src/G__WCSimRoot.cxx: /pbs/home/m/mferey/WCSim/v1.12.8/WCSim/include/TJNuBeamFlux.hh
src/G__WCSimRoot.cxx: /pbs/home/m/mferey/WCSim/v1.12.8/WCSim/include/TNRooTrackerVtx.hh
src/G__WCSimRoot.cxx: /pbs/home/m/mferey/WCSim/v1.12.8/WCSim/include/jhfNtuple.h
src/G__WCSimRoot.cxx: /pbs/home/m/mferey/WCSim/v1.12.8/WCSim/include/WCSimRootEvent.hh
src/G__WCSimRoot.cxx: /pbs/home/m/mferey/WCSim/v1.12.8/WCSim/include/WCSimRootGeom.hh
src/G__WCSimRoot.cxx: /pbs/home/m/mferey/WCSim/v1.12.8/WCSim/include/WCSimPmtInfo.hh
src/G__WCSimRoot.cxx: /pbs/home/m/mferey/WCSim/v1.12.8/WCSim/include/WCSimEnumerations.hh
src/G__WCSimRoot.cxx: /pbs/home/m/mferey/WCSim/v1.12.8/WCSim/include/WCSimRootOptions.hh
src/G__WCSimRoot.cxx: /pbs/home/m/mferey/WCSim/v1.12.8/WCSim/include/WCSimRootTools.hh
src/G__WCSimRoot.cxx: /pbs/home/m/mferey/WCSim/v1.12.8/WCSim/include/TJNuBeamFlux.hh
src/G__WCSimRoot.cxx: /pbs/home/m/mferey/WCSim/v1.12.8/WCSim/include/TNRooTrackerVtx.hh
src/G__WCSimRoot.cxx: /pbs/home/m/mferey/WCSim/v1.12.8/WCSim/include/WCSimRootLinkDef.hh
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/pbs/home/m/mferey/WCSim/v1.12.8/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating G__WCSimRoot.cxx, libWCSimRoot_rdict.pcm, libWCSimRoot.rootmap"
	cd /pbs/home/m/mferey/WCSim/v1.12.8/build/src && /pbs/software/redhat-9-x86_64/cmake/3.29.2/bin/cmake -E env LD_LIBRARY_PATH=/pbs/software/redhat-9-x86_64/root/6.30.06/lib:/pbs/software/redhat-9-x86_64/hepmc3/3.2.4/lib64:/pbs/software/redhat-9-x86_64/root/6.30.06/lib:/usr/lib64:/pbs/software/redhat-9-x86_64/python/3.9.1/lib:/pbs/software/redhat-9-x86_64/gcc/13.2.0/lib64:/pbs/software/redhat-9-x86_64/xrootd/5.6.9/lib64:/pbs/software/redhat-9-x86_64/geant4/10.04.p02/lib64:/pbs/software/redhat-9-x86_64/clhep/2.4.6.4/lib:/pbs/software/redhat-9-x86_64/xerces/3.2.1/lib64 /pbs/software/redhat-9-x86_64/root/6.30.06/bin/rootcling -v2 -f G__WCSimRoot.cxx -s /pbs/home/m/mferey/WCSim/v1.12.8/build/src/libWCSimRoot.so -rml libWCSimRoot.so -rmf /pbs/home/m/mferey/WCSim/v1.12.8/build/src/libWCSimRoot.rootmap -DUSE_CPP11 -DG4_STORE_TRAJECTORY -DG4UI_USE -DG4VIS_USE -DG4UI_USE_TCSH -DG4INTY_USE_XT -DG4VIS_USE_RAYTRACERX -DG4INTY_USE_QT -DG4UI_USE_QT -DG4VIS_USE_OPENGLQT -DG4UI_USE_XM -DG4VIS_USE_OPENGLXM -DG4VIS_USE_OPENGLX -DG4VIS_USE_OPENGL -compilerI/usr/include/c++/11 -compilerI/usr/include/c++/11/x86_64-redhat-linux -compilerI/usr/include/c++/11/backward -compilerI/usr/lib/gcc/x86_64-redhat-linux/11/include -compilerI/usr/local/include -compilerI/usr/include -compilerI/usr/lib/gcc/x86_64-redhat-linux/11/include -compilerI/usr/local/include -compilerI/usr/include -I/pbs/software/redhat-9-x86_64/hepmc3/3.2.4/include -I/pbs/software/redhat-9-x86_64/root/6.30.06/include/root -I/pbs/software/redhat-9-x86_64/geant4/10.04.p02/include/Geant4 -I/usr/include -I/pbs/home/m/mferey/WCSim/v1.12.8/WCSim/include -I/pbs/home/m/mferey/WCSim/v1.12.8/WCSim/src jhfNtuple.h WCSimRootEvent.hh WCSimRootGeom.hh WCSimPmtInfo.hh WCSimEnumerations.hh WCSimRootOptions.hh WCSimRootTools.hh TJNuBeamFlux.hh TNRooTrackerVtx.hh /pbs/home/m/mferey/WCSim/v1.12.8/WCSim/include/WCSimRootLinkDef.hh

src/libWCSimRoot_rdict.pcm: src/G__WCSimRoot.cxx
	@$(CMAKE_COMMAND) -E touch_nocreate src/libWCSimRoot_rdict.pcm

src/libWCSimRoot.rootmap: src/G__WCSimRoot.cxx
	@$(CMAKE_COMMAND) -E touch_nocreate src/libWCSimRoot.rootmap

G__WCSimRoot: src/CMakeFiles/G__WCSimRoot
G__WCSimRoot: src/G__WCSimRoot.cxx
G__WCSimRoot: src/libWCSimRoot.rootmap
G__WCSimRoot: src/libWCSimRoot_rdict.pcm
G__WCSimRoot: src/CMakeFiles/G__WCSimRoot.dir/build.make
.PHONY : G__WCSimRoot

# Rule to build all files generated by this target.
src/CMakeFiles/G__WCSimRoot.dir/build: G__WCSimRoot
.PHONY : src/CMakeFiles/G__WCSimRoot.dir/build

src/CMakeFiles/G__WCSimRoot.dir/clean:
	cd /pbs/home/m/mferey/WCSim/v1.12.8/build/src && $(CMAKE_COMMAND) -P CMakeFiles/G__WCSimRoot.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/G__WCSimRoot.dir/clean

src/CMakeFiles/G__WCSimRoot.dir/depend:
	cd /pbs/home/m/mferey/WCSim/v1.12.8/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /pbs/home/m/mferey/WCSim/v1.12.8/WCSim /pbs/home/m/mferey/WCSim/v1.12.8/WCSim/src /pbs/home/m/mferey/WCSim/v1.12.8/build /pbs/home/m/mferey/WCSim/v1.12.8/build/src /pbs/home/m/mferey/WCSim/v1.12.8/build/src/CMakeFiles/G__WCSimRoot.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : src/CMakeFiles/G__WCSimRoot.dir/depend

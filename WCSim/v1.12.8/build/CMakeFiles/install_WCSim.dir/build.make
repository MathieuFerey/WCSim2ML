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

# Utility rule file for install_WCSim.

# Include any custom commands dependencies for this target.
include CMakeFiles/install_WCSim.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/install_WCSim.dir/progress.make

CMakeFiles/install_WCSim:
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/pbs/home/m/mferey/WCSim/v1.12.8/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Installing WCSim"
	/pbs/software/redhat-9-x86_64/cmake/3.29.2/bin/cmake --build /pbs/home/m/mferey/WCSim/v1.12.8/build --target install

install_WCSim: CMakeFiles/install_WCSim
install_WCSim: CMakeFiles/install_WCSim.dir/build.make
.PHONY : install_WCSim

# Rule to build all files generated by this target.
CMakeFiles/install_WCSim.dir/build: install_WCSim
.PHONY : CMakeFiles/install_WCSim.dir/build

CMakeFiles/install_WCSim.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/install_WCSim.dir/cmake_clean.cmake
.PHONY : CMakeFiles/install_WCSim.dir/clean

CMakeFiles/install_WCSim.dir/depend:
	cd /pbs/home/m/mferey/WCSim/v1.12.8/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /pbs/home/m/mferey/WCSim/v1.12.8/WCSim /pbs/home/m/mferey/WCSim/v1.12.8/WCSim /pbs/home/m/mferey/WCSim/v1.12.8/build /pbs/home/m/mferey/WCSim/v1.12.8/build /pbs/home/m/mferey/WCSim/v1.12.8/build/CMakeFiles/install_WCSim.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/install_WCSim.dir/depend


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

# Produce verbose output by default.
VERBOSE = 1

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /root/hunter-game/hunter-game

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /root/hunter-game/hunter-game/build/Desktop_Qt_6_7_1-Debug

# Utility rule file for apphunter-game_autogen.

# Include any custom commands dependencies for this target.
include CMakeFiles/apphunter-game_autogen.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/apphunter-game_autogen.dir/progress.make

CMakeFiles/apphunter-game_autogen: apphunter-game_autogen/timestamp

apphunter-game_autogen/timestamp: /opt/Qt/6.7.1/gcc_64/./libexec/moc
apphunter-game_autogen/timestamp: CMakeFiles/apphunter-game_autogen.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/root/hunter-game/hunter-game/build/Desktop_Qt_6_7_1-Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Automatic MOC and UIC for target apphunter-game"
	/usr/bin/cmake -E cmake_autogen /root/hunter-game/hunter-game/build/Desktop_Qt_6_7_1-Debug/CMakeFiles/apphunter-game_autogen.dir/AutogenInfo.json Debug
	/usr/bin/cmake -E touch /root/hunter-game/hunter-game/build/Desktop_Qt_6_7_1-Debug/apphunter-game_autogen/timestamp

apphunter-game_autogen: CMakeFiles/apphunter-game_autogen
apphunter-game_autogen: apphunter-game_autogen/timestamp
apphunter-game_autogen: CMakeFiles/apphunter-game_autogen.dir/build.make
.PHONY : apphunter-game_autogen

# Rule to build all files generated by this target.
CMakeFiles/apphunter-game_autogen.dir/build: apphunter-game_autogen
.PHONY : CMakeFiles/apphunter-game_autogen.dir/build

CMakeFiles/apphunter-game_autogen.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/apphunter-game_autogen.dir/cmake_clean.cmake
.PHONY : CMakeFiles/apphunter-game_autogen.dir/clean

CMakeFiles/apphunter-game_autogen.dir/depend:
	cd /root/hunter-game/hunter-game/build/Desktop_Qt_6_7_1-Debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/hunter-game/hunter-game /root/hunter-game/hunter-game /root/hunter-game/hunter-game/build/Desktop_Qt_6_7_1-Debug /root/hunter-game/hunter-game/build/Desktop_Qt_6_7_1-Debug /root/hunter-game/hunter-game/build/Desktop_Qt_6_7_1-Debug/CMakeFiles/apphunter-game_autogen.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/apphunter-game_autogen.dir/depend


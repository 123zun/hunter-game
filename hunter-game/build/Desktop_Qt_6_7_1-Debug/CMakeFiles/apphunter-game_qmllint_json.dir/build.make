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
CMAKE_SOURCE_DIR = /root/hunter-game

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /root/hunter-game/build/Desktop_Qt_6_7_1-Debug

# Utility rule file for apphunter-game_qmllint_json.

# Include any custom commands dependencies for this target.
include CMakeFiles/apphunter-game_qmllint_json.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/apphunter-game_qmllint_json.dir/progress.make

CMakeFiles/apphunter-game_qmllint_json: /opt/Qt/6.7.1/gcc_64/bin/qmllint
CMakeFiles/apphunter-game_qmllint_json: /root/hunter-game/Main.qml
CMakeFiles/apphunter-game_qmllint_json: /root/hunter-game/MenuScreen.qml
CMakeFiles/apphunter-game_qmllint_json: /root/hunter-game/GameButton.qml
CMakeFiles/apphunter-game_qmllint_json: /root/hunter-game/GameScreen.qml
CMakeFiles/apphunter-game_qmllint_json: .rcc/qmllint/apphunter-game_json.rsp
	cd /root/hunter-game && /opt/Qt/6.7.1/gcc_64/bin/qmllint @/root/hunter-game/build/Desktop_Qt_6_7_1-Debug/.rcc/qmllint/apphunter-game_json.rsp

apphunter-game_qmllint_json: CMakeFiles/apphunter-game_qmllint_json
apphunter-game_qmllint_json: CMakeFiles/apphunter-game_qmllint_json.dir/build.make
.PHONY : apphunter-game_qmllint_json

# Rule to build all files generated by this target.
CMakeFiles/apphunter-game_qmllint_json.dir/build: apphunter-game_qmllint_json
.PHONY : CMakeFiles/apphunter-game_qmllint_json.dir/build

CMakeFiles/apphunter-game_qmllint_json.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/apphunter-game_qmllint_json.dir/cmake_clean.cmake
.PHONY : CMakeFiles/apphunter-game_qmllint_json.dir/clean

CMakeFiles/apphunter-game_qmllint_json.dir/depend:
	cd /root/hunter-game/build/Desktop_Qt_6_7_1-Debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/hunter-game /root/hunter-game /root/hunter-game/build/Desktop_Qt_6_7_1-Debug /root/hunter-game/build/Desktop_Qt_6_7_1-Debug /root/hunter-game/build/Desktop_Qt_6_7_1-Debug/CMakeFiles/apphunter-game_qmllint_json.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/apphunter-game_qmllint_json.dir/depend


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

# Utility rule file for apphunter-game_qmllint.

# Include any custom commands dependencies for this target.
include CMakeFiles/apphunter-game_qmllint.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/apphunter-game_qmllint.dir/progress.make

CMakeFiles/apphunter-game_qmllint: /opt/Qt/6.7.1/gcc_64/bin/qmllint
CMakeFiles/apphunter-game_qmllint: /root/hunter-game/hunter-game/Main.qml
CMakeFiles/apphunter-game_qmllint: /root/hunter-game/hunter-game/Player.qml
CMakeFiles/apphunter-game_qmllint: /root/hunter-game/hunter-game/GameLogic.js
CMakeFiles/apphunter-game_qmllint: /root/hunter-game/hunter-game/MenuScreen.qml
CMakeFiles/apphunter-game_qmllint: /root/hunter-game/hunter-game/GameButton.qml
CMakeFiles/apphunter-game_qmllint: /root/hunter-game/hunter-game/Choosegame.qml
CMakeFiles/apphunter-game_qmllint: /root/hunter-game/hunter-game/GameScreen.qml
CMakeFiles/apphunter-game_qmllint: /root/hunter-game/hunter-game/Gamescreen2.qml
CMakeFiles/apphunter-game_qmllint: /root/hunter-game/hunter-game/GameOver.qml
CMakeFiles/apphunter-game_qmllint: /root/hunter-game/hunter-game/GameOver2.qml
CMakeFiles/apphunter-game_qmllint: /root/hunter-game/hunter-game/Gamesuccess2.qml
CMakeFiles/apphunter-game_qmllint: /root/hunter-game/hunter-game/Ghost.qml
CMakeFiles/apphunter-game_qmllint: /root/hunter-game/hunter-game/Gamesuccess.qml
CMakeFiles/apphunter-game_qmllint: .rcc/qmllint/apphunter-game.rsp
	cd /root/hunter-game/hunter-game && /opt/Qt/6.7.1/gcc_64/bin/qmllint @/root/hunter-game/hunter-game/build/Desktop_Qt_6_7_1-Debug/.rcc/qmllint/apphunter-game.rsp

apphunter-game_qmllint: CMakeFiles/apphunter-game_qmllint
apphunter-game_qmllint: CMakeFiles/apphunter-game_qmllint.dir/build.make
.PHONY : apphunter-game_qmllint

# Rule to build all files generated by this target.
CMakeFiles/apphunter-game_qmllint.dir/build: apphunter-game_qmllint
.PHONY : CMakeFiles/apphunter-game_qmllint.dir/build

CMakeFiles/apphunter-game_qmllint.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/apphunter-game_qmllint.dir/cmake_clean.cmake
.PHONY : CMakeFiles/apphunter-game_qmllint.dir/clean

CMakeFiles/apphunter-game_qmllint.dir/depend:
	cd /root/hunter-game/hunter-game/build/Desktop_Qt_6_7_1-Debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/hunter-game/hunter-game /root/hunter-game/hunter-game /root/hunter-game/hunter-game/build/Desktop_Qt_6_7_1-Debug /root/hunter-game/hunter-game/build/Desktop_Qt_6_7_1-Debug /root/hunter-game/hunter-game/build/Desktop_Qt_6_7_1-Debug/CMakeFiles/apphunter-game_qmllint.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/apphunter-game_qmllint.dir/depend


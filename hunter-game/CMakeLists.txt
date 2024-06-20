cmake_minimum_required(VERSION 3.29)

project(
  hunter-game
  VERSION 0.1
  LANGUAGES CXX)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(apphunter-game main.cpp)

qt_add_qml_module(
  apphunter-game
  URI
  hunter-game
  VERSION
  1.0
  QML_FILES
  Main.qml
  SOURCES
  RESOURCES
  images/coin.png
  images/yellow_button01.png
  images/blue_button01.png
  images/cc_background.png
  images/flower-closed.png
  images/flower-opened.png
  images/tube.png
  QML_FILES
  MenuScreen.qml
  QML_FILES
  GameButton.qml
  QML_FILES
  QML_FILES
  GameScreen.qml
  QML_FILES
  Player.qml
  QML_FILES
  GameLogic.js
  QML_FILES
  warpPipe.qml
  QML_FILES Brick.qml)

target_compile_features(apphunter-game PRIVATE cxx_std_20)

set_target_properties(
  apphunter-game
  PROPERTIES AUTORCC TRUE
             MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
             MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
             MACOSX_BUNDLE_SHORT_VERSION_STRING
             ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
             MACOSX_BUNDLE TRUE
             WIN32_EXECUTABLE TRUE)

target_link_libraries(apphunter-game PRIVATE Qt6::Quick)

include(GNUInstallDirs)
install(
  TARGETS apphunter-game
  BUNDLE DESTINATION .
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})

# qt_add_executable(hunter-game)  //Creates and finalizes an application target
# of a platform-specific type. This command performs the following tasks: 1.
# Create a CMake target of the appropriate type for the target platform. 2. Link
# the target to the Qt::Core library. 3. Handle finalization of the CMake
# target.

# qt_standard_project_setup()     #set(CMAKE_AUTOUIC ON)  set(CMAKE_AUTOMOC ON)

# @if %{HasTranslation} find_package(Qt6 REQUIRED COMPONENTS Core Quick
# LinguistTools) @else find_package(Qt6 REQUIRED COMPONENTS Core Quick) @endif

# target_sources(apphunter-game PRIVATE main.cpp qml.qrc @if %{HasTranslation}
# %{TsFileName} @endif
#
# PUBLIC
#
# )

# qt_import_qml_plugins(hunter-game)

# cmake_minimum_required(VERSION 3.16)
#
# project(hunter-game VERSION 0.1 LANGUAGES CXX)
#
# @if !true set(CMAKE_AUTOMOC ON) @endif set(CMAKE_CXX_STANDARD_REQUIRED ON)
#
# find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)
#
# @if true @if false qt_standard_project_setup(REQUIRES 6.5) @else
# qt_standard_project_setup() @endif @endif
#
# qt_add_executable(apphunter-game main.cpp )
#
# qt_add_qml_module(apphunter-game URI hunter-game VERSION 1.0 QML_FILES
# Main.qml )
#
# # Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1. #
# If you are developing for iOS or macOS you should consider setting an #
# explicit, fixed bundle identifier manually though.
# set_target_properties(apphunter-game PROPERTIES # MACOSX_BUNDLE_GUI_IDENTIFIER
# com.example.apphunter-game MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
# MACOSX_BUNDLE_SHORT_VERSION_STRING
# ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR} MACOSX_BUNDLE TRUE
# WIN32_EXECUTABLE TRUE )
#
# target_link_libraries(apphunter-game PRIVATE Qt6::Quick )
#
# include(GNUInstallDirs) install(TARGETS apphunter-game BUNDLE DESTINATION .
# LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} RUNTIME DESTINATION
# ${CMAKE_INSTALL_BINDIR} )

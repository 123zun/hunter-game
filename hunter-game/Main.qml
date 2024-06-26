import QtQuick
import QtQuick.Window
import QtQuick.Controls
ApplicationWindow {
    visible: true
    width: 1920
    height: 1080
    color: "black"
    title: qsTr("hunter game")

    Loader {
        id: screenLoader
        anchors.fill: parent
        source: "MenuScreen.qml"
        focus: true
    }
}

import QtQuick
import QtQuick.Controls
import QtMultimedia
import QtQuick.Window

Item{
    id: menuScreen
    anchors.fill: parent
    Column {
        anchors.centerIn: parent
        spacing: 10

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "MENU"
            color: "white"
            font.bold: true
            font.pixelSize: 50
        }

        GameButton {
            id: gameButton
            text: "New game"
            onClicked: {
                screenLoader.source = "Choosegame.qml"
            }
        }

        GameButton {
            id: exitButton
            text: "Exit"
            onClicked: {
                Qt.quit()
            }
        }
    }
}

import QtQuick
import QtQuick.Controls

Item{
    id: menuScreen
    anchors.fill: parent

    // Display
    Column {
        anchors.centerIn: parent
        spacing: 10

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "MENU"
            color: "white"
            font.bold: true
            font.pixelSize: 40
        }

        GameButton {
            id: gameButton
            text: "New game"
            onClicked: {
                screenLoader.source = "Difficulty.qml"
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

import QtQuick
import QtQuick.Controls

Item{
    id: menuScreen
    anchors.fill: parent

    Item{
     id:font
    }


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
            text: "Start"
            onClicked: {
                screenLoader.source = "GameScreen.qml"
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

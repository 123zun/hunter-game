import QtQuick
import QtQuick.Controls
import QtMultimedia

Item {
    id: gamechoose
    anchors.fill: parent

    Column {
        spacing: 10
        anchors.centerIn: parent


        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "选择关卡"
            color: "black"
            font.bold: true
            font.pixelSize: 50
        }
        GameButton {
            id: gameButton
            text: "第一关"
            onClicked: {
                screenLoader.source = "GameScreen.qml"
            }
        }
        GameButton {
            id: gameButton2
            text: "第二关"
            enabled:true
            onClicked: {
                screenLoader.source = "Gamescreen2.qml"
            }
        }
        GameButton {
            id: backButton
            text: "返回"
            onClicked: {
                screenLoader.source = "MenuScreen.qml"
            }
        }
    }
}

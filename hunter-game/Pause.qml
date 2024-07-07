import QtQuick

Rectangle {
    id: pausePanel
    width: board.width
    height: board.height
    color: "transparent"
    visible: false
    anchors.centerIn: parent

    Column {
        anchors.centerIn: parent

        Text {
            text: "游戏暂停"
            font.bold: true
            font.pixelSize: 48
        }

        GameButton {
            text: "继续"
            font.bold: true
            onClicked: {
                GameLogic.continu()
            }
        }
        GameButton {
            text: "重新开始"
            onClicked: {
                GameLogic.restart()
            }
        }
        GameButton {
            text: "返回主界面"
            onClicked: {
                GameLogic.returnmenu()
            }
        }
        GameButton {
            text: "退出游戏"
            onClicked: Qt.quit()
        }
    }
}

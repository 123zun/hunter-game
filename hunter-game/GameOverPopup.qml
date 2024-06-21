//定义了一个游戏结束界面，显示游戏得分和一个重新开始游戏的选项
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import "GameLogic.js" as GameLogic


Item {
    anchors { fill: parent }

    Behavior on opacity { PropertyAnimation { duration: 500 } }

    ColumnLayout {
        anchors { centerIn: parent }

        Image {
            Layout.alignment: Qt.AlignHCenter
            fillMode: Image.PreserveAspectFit
            source: "images/skull.png"
        }

        Label {
            Layout.alignment: Qt.AlignHCenter
            font.pixelSize: 60
            color: "black"
            text: "GAME OVER"
        }

        Label {
            Layout.alignment: Qt.AlignHCenter
            font.pixelSize: 60
            color: "black"
            text: "Score " + score
        }

        // Restart label and mouse area
        Label {
            Layout.alignment: Qt.AlignHCenter
            font.pixelSize: 60
            color: "black"
            text: "Restart"
            MouseArea {
                anchors { fill: parent }
                onClicked: GameLogic.gameStart()
            }
        }

        // Menu label and mouse area
        Label {
            Layout.alignment: Qt.AlignHCenter
            font.pixelSize: 60
            color: "black"
            text: "Exit"
            MouseArea {
                anchors { fill: parent }
                onClicked: Qt.quit()
            }
        }
    }
}

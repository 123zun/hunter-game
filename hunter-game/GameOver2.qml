import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import "GameLogic.js" as GameLogic
Item {
    anchors { fill: parent }
    visible:false


    Behavior on opacity { PropertyAnimation { duration: 500 } }

    ColumnLayout {
        z:50
        anchors { centerIn: parent }


        Label {
            Layout.alignment: Qt.AlignHCenter
            font.pixelSize: 50
            color: "black"
            text: "GAME OVER"
        }
        Label {
            Layout.alignment: Qt.AlignHCenter
            font.pixelSize: 50
            color: "black"
            text: "Score " + score
        }
        Label {
            Layout.alignment: Qt.AlignHCenter
            font.pixelSize: 50
            color: "black"
            text: "Restart"
            TapHandler {
                onTapped: {
                    GameLogic.restart2()
                }
            }
        }
        Label {
            Layout.alignment: Qt.AlignHCenter
            font.pixelSize: 50
            color: "black"
            text: "Menu"
            TapHandler {
                onTapped:{
                    screenLoader.source = "MenuScreen.qml"
                }
            }
        }
        Label {
            Layout.alignment: Qt.AlignHCenter
            font.pixelSize: 50
            color: "black"
            text: "Exit"
            TapHandler {
                onTapped:Qt.quit()
            }
        }
    }
}

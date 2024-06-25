import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls

import "GameLogic.js" as GameLogic

Item {
    id: board
    visible: true

    width: 1920
    height: 1080

    signal clearBricks()

    property int points: 0
    property int score: 0

    property int livesLost: 0
    property int heartCount: 5

    property bool gameOver: livesLost>= heartCount

    Component.onCompleted: GameLogic.gameStart()

    Timer {
        id:cloudtimer
        repeat: true
        running: false
        interval:4000
        onTriggered: GameLogic.createCloud()
    }
    Timer {
        id:bricktimer
        repeat: false
        running: false
        interval:400
        onTriggered: GameLogic.createbrick()
    }
    Timer {
        id: tubetimer
        repeat: true
        running: false
        interval: 2500

        onTriggered: {
            GameLogic.totube()
        }
    }
    Timer {
        id: bullettimer
        repeat: true
        running: false
        interval: 1000

        onTriggered: {
            GameLogic.createbullete()
        }
    }

    Image {
        id: background
        anchors { fill: parent }
        source: "images/background.png"
    }

    RowLayout {

        visible: !gameOver
        anchors { left: parent.left; top: parent.top; margins: 64 }

        Text {
            font.pixelSize: 50
            color: "white"
            text: "Score:"
        }

        Image {
            fillMode: Image.PreserveAspectFit
            source: "images/bean.png"
        }

        Text {
            font.pixelSize: 50
            color: "white"
            text: points
        }
    }

    Player {
            id: player

            property int speed: 50
            focus: true

            //Player的键盘控制
            Keys.onPressed: {
                switch(event.key) {
                case Qt.Key_Left:
                    player.x = Math.max(0, x - speed)
                    break
                case Qt.Key_Right:
                    player.x = Math.min(board.width - width, x + speed)
                    break
                case Qt.Key_Up:
                    player.y = Math.max(0, y - speed)
                    break
                case Qt.Key_Down:
                    player.y = Math.min(board.height - height, y + speed)
                    break
                }
            }

             onXChanged: {
                 cloudtimer.start()
                 tubetimer.start()
                 bullettimer.start()

             }
        }
}

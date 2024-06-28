import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtMultimedia

import "GameLogic.js" as GameLogic

Window {
    id: board2
    visible: true

    width: 1920
    height: 1080

    property int points: 0
    property int score: 0

    property int livesLost: 0
    property int heartCount: 5

    property bool gameOver2: livesLost>= heartCount
    property bool gamewin2: points>=2

    signal clearghost()
    signal clearbean2()


    Component.onCompleted: GameLogic.gameStart2()

    Timer {
        id:ghosttimer
        repeat: false
        running: false
        interval:400
        onTriggered: GameLogic.createghost()
    }

    Image {
        id: background
        anchors { fill: parent }
        source: "images/background2.png"
    }

    RowLayout {
        z:50
        visible: !gameOver2 && !gamewin2
        anchors { left: parent.left; top: parent.top; margins: 64 }

        Text {
            font.pixelSize: 50
            color: "white"
            text: "Score:"
        }

        Image {
            visible: true
            fillMode: Image.PreserveAspectFit
            source: "images/bean.png"
        }

        Text {
            font.pixelSize: 50
            color: "white"
            text: points
        }
    }

    RowLayout {
        z:50
        visible: !gameOver2 && !gamewin2
        anchors { right: parent.right; top: parent.top; margins: 64 }
        Text{
            text:"HP:"
            font.pixelSize: 54
        }

        Repeater {
            model: heartCount

            Image {
                fillMode: Image.PreserveAspectFit
                source: index >= livesLost ? "images/heart-on.png"
                                           : "images/heart-off.png"
            }
        }
    }

    Ghost{
        id:ghost
    }

    Player {
            id: player

            property int speed: 50
            focus: true

            Keys.onPressed: {

                switch(event.key) {
                    case Qt.Key_Left:
                        console.log("qml.Player moved left")
                        player.x = Math.max(0, player.x - speed);
                        player.rotation=180
                        break;
                    case Qt.Key_Right:
                        console.log("qml.Player moved right")
                        player.x = Math.min(board2.width - player.width, player.x + speed);
                        player.rotation=0
                        break;
                    case Qt.Key_Up:
                        console.log("qml.Player moved up")
                        player.y = Math.max(0, player.y - speed);
                        player.rotation=270
                        break;
                    case Qt.Key_Down:
                        console.log("qml.Player moved down")
                        player.y = Math.min(board2.height - player.height, player.y + speed);
                        player.rotation=90
                        break;
                    }
            }
        }
}

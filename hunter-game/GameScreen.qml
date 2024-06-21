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

    property int playerSpeed: 100

    property int points: 0
    property int score: 0

    property int livesLost: 0
    property int heartCount: 5

    property int prevDirection: 3

    property bool gameOver: livesLost >= heartCount

    onLivesLostChanged: {
        if (livesLost >= heartCount) {
            GameLogic.gameOver()
        }
    }

    Component.onCompleted: GameLogic.gameStart()

    Image {
        id: background
        anchors { fill: parent }
        source: "images/cc_background.png"
    }

    RowLayout {
        visible: !gameOver
        anchors { left: parent.left; top: parent.top; margins: 64 }

        Image {

            source: "images/coin.png"
        }

        Text {
            font.pixelSize: 54
            color: "white"
            text: points
        }
    }

    Player {
        id: player

        onXChanged: shellPipeTimer.start()
    }

    WarpPipe {
        id: warpPipe
    }
    GameOverPopup {
        id: gameOverPopup
        visible: gameOver
    }
}

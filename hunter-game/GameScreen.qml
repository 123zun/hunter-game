import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls


Item {
    id: board
    visible: true

    width: 1920
    height: 1080




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
}

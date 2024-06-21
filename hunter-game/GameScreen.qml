import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls


Item {
    id: board
    visible: true

    width: 1920
    height: 1080
     property int points: 0

    Timer {
        id:cloudtimer
        repeat: true
        running: true
        interval: GameLogic.getrandom(cloudSpeedLow, cloudSpeedHigh)

        property int cloudSpeedLow: 3000
        property int cloudSpeedHigh: 5500

        onTriggered: GameLogic.createRandomCloud()
    }

    Image {
        id: background
        anchors { fill: parent }
        source: "images/cc_background.png"
    }

    RowLayout {
        visible: true
        anchors { left: parent.left; top: parent.top; margins: 64 }

        Image {

            source: "images/bean.png"
        }

        Text {
            font.pixelSize: 54
            color: "white"
            text: points
        }
    }
    MouseArea {
        anchors { fill: parent }
        hoverEnabled: true
        cursorShape: Qt.BlankCursor

        onMouseXChanged: (mouse) => player.updatePosition(mouse)

        onMouseYChanged: (mouse) => player.updatePosition(mouse)
    }
    Player {
        id: player
    }

}

import QtQuick
import QtQuick.Window

import "GameLogic.js" as GameLogic

Image {
    id: enemy
    state: "center"
    source: "images/enemy" + state + ".png"

    property int enemySpeed: 1500

    property string direction: ""
    property bool crashed: false

    onYChanged: GameLogic.checkenemyCollision()

    Component.onCompleted: {
        y = board.height / 6
    }

    Behavior on opacity {
        SequentialAnimation {
            PropertyAnimation{ duration: 300 }
            ScriptAction { script: enemy.destroy() }
        }
    }

    Behavior on y {
        SequentialAnimation {
            PauseAnimation { duration: 1000 }
            PropertyAnimation {
                easing.type: Easing.OutSine
                duration: enemySpeed / 2
            }
            PropertyAnimation {
                target: enemy
                easing.type: Easing.InSine
                property: "y"
                to: board.height
                duration: enemySpeed / 2
            }
            ScriptAction { script: enemy.destroy() }
        }
    }

    Timer {
        id: spinTimer
        repeat: true
        running: true
        interval: 50

        onTriggered: {
            switch(enemy.state) {
            case "center": enemy.state = "left"; break
            case "left": enemy.state = "back"; break
            case "back": enemy.state = "right"; break
            case "right": enemy.state = "center"; break
            }
        }
    }
}

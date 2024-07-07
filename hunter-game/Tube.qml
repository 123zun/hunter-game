import QtQuick
import QtQuick.Window

import "GameLogic.js" as GameLogic

Image {
    id: tube
    z: 100
    fillMode: Image.PreserveAspectFit
    source: "images/tube.png"

    property bool crashed: false

    onYChanged: checktubeCollision()

    Connections {
        target: player
        function onXChanged() { checktubeCollision() }
        function onYChanged() { checktubeCollision() }
    }
    Component.onCompleted: {
        y = board.height - height
    }

    function checktubeCollision() {
        if (crashed) {
            return
        }

        if (GameLogic.checkCollision(player, this)) {
            console.log("tube destroyed")
            crashed = true
            opacity = 0
            livesLost++
        }
    }

    Behavior on opacity {
        SequentialAnimation {
            PropertyAnimation{ duration: 300 }
            ScriptAction { script:tube.destroy() }
        }
    }

    Behavior on y {
        SequentialAnimation {
            PropertyAnimation { easing.type: Easing.InSine; duration: 1000 }
            PauseAnimation { duration: 3000 }
            PropertyAnimation { target: tube; property: "y"; to: board.height }
            ScriptAction { script: tube.destroy() }
        }
    }
}

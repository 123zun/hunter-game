import QtQuick
import QtQuick.Window

import "GameLogic.js" as GameLogic

Image {
    id: brick
    source: "images/brick.png"

    property bool crashed: false

    function crash() {
        crashed = true
        opacity = 0
    }

    function checkBrickCollision() {
        if (crashed) {
            return
        }

        if (GameLogic.checkCollision(player, this)) {
            crash()
            livesLost++
        }
    }

    Connections {
        target: player

        function onXChanged() { checkBrickCollision() }

        function onYChanged() { checkBrickCollision() }
    }

    Connections {
        target: board

        function onClearBricks() { crash() }
    }

    Behavior on opacity {
        SequentialAnimation {
            PropertyAnimation { duration: 400 }
            ScriptAction { script: brick.destroy() }
        }
    }

}

import QtQuick
import QtQuick.Window

import "GameLogic.js" as GameLogic

Image {
    id: bullet
    z: 100
    fillMode: Image.PreserveAspectFit
    source: "images/bullet.png"

    property string direction: ""
    property bool crashed: false
    onXChanged:checkbulletCollision()

    Connections {
        target: player
        function onXChanged() { checkbulletCollision() }
        function onYChanged() { checkbulletCollision() }
    }

    Component.onCompleted: {
        switch (direction) {
        case "left":
            x = board.width;
            break
        case "right":
            x = -width;
            rotation = 180
            break
        }

    }

    function checkbulletCollision() {
        if (crashed) {
            return
        }

        if (GameLogic.checkCollision(player, this)) {
            console.log("bullet destroyed")
            crashed = true
            opacity = 0
            livesLost++
        }
    }

    Behavior on opacity {
        SequentialAnimation {
            PropertyAnimation{ duration: 300 }
            ScriptAction { script:bullet.destroy() }
        }
    }

    Behavior on x {
        SequentialAnimation {
            PauseAnimation { duration: 1000 }
            PropertyAnimation { duration: 3000 }
            ScriptAction { script: bullet.destroy() }
        }
    }

}


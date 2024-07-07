
import QtQuick 2.15
import QtQuick.Controls 2.15

import "GameLogic.js" as GameLogic

Image {
    id: bullet2
    width: 50
    height: 50
    source: "images/bullet2.png"
    fillMode: Image.PreserveAspectFit

    property var direction: null
    property int speed: 40

    property bool crashed: false
    onXChanged:checkbullet2Collision()
    onYChanged:checkbullet2Collision()

    Connections {
        target: player
        function onXChanged() { checkbullet2Collision() }
        function onYChanged() { checkbullet2Collision() }
    }

    function move() {
        switch (direction) {
        case "up":
            y =-100
            break
        case "down":
            y = 1100
            break
        case "left":
            x =-100
            break
        case "right":
            x = 2000
            break
        }
    }

    Component.onCompleted: {

        move()
    }

    Behavior on x { PropertyAnimation { duration: 3000} }
    Behavior on y { PropertyAnimation { duration: 3000} }

    function checkbullet2Collision() {
        if (crashed) {
            return
        }

        if (GameLogic.checkCollision(player, this)) {
            console.log("bullet2 destroyed")
            crashed = true
            opacity = 0
            livesLost++
        }
    }
    Behavior on opacity {
        SequentialAnimation {
            PropertyAnimation{ duration: 300 }
            ScriptAction { script:bullet2.destroy() }
        }
    }
}

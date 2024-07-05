import QtQuick
import QtQuick.Window

import "GameLogic.js" as GameLogic

Image {

    id: bean2

    width: 34; height: 34

    source: "images/bean.png"

    fillMode: Image.PreserveAspectFit

    property int speed: 100

    property bool crashed: false

    onYChanged: checkbean2Collision()
    onXChanged: checkbean2Collision()

    Connections {
        target: player
        function onXChanged() { checkbean2Collision() }
        function onYChanged() { checkbean2Collision() }
    }
    Connections {
        target: board2
        function onClearbean2() {crash() }
    }
    function crash() {
        console.log("bean2 destroyed")
        crashed = true
        opacity = 0
    }

    function move() {
        var newX = x + Math.random() * speed * 2 - speed;
        var newY = y + Math.random() * speed * 2 - speed;


        if (newX >= 0 && newX + width <= board2.width) {
            x = newX;
        }
        if (newY >= 0 && newY + height <= board2.height) {
            y = newY;
        }
    }
    Behavior on x { PropertyAnimation { duration: 1000} }
    Behavior on y { PropertyAnimation { duration: 1000} }
    function checkbean2Collision() {
        if (crashed) {
            return
        }

        if (GameLogic.checkCollision(player, this)) {
            crashed = true
            opacity = 0
            points++
        }
    }
    Behavior on opacity {
        SequentialAnimation {
            PropertyAnimation{ duration: 1000 }
            ScriptAction { script:bean2.destroy() }
        }
    }

    Timer {
        id:bean2move
        running: true
        interval: 1000
        repeat: true
        onTriggered: bean2.move()
    }

    Connections {
        target: board2
        function onBean2pause() {
            bean2move.stop()
        }
    }
    Connections {
        target: board2
        function onBean2continu() {
            bean2move.start()
        }
    }
}


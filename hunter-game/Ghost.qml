import QtQuick
import QtQuick.Window

import "GameLogic.js" as GameLogic

Image {

    id: ghost

    width: 100; height: 100

    source: "images/ghost.png"

    fillMode: Image.PreserveAspectFit

    property int speed: 100

    property bool crashed: false

    onYChanged: checkghostCollision()
    onXChanged: checkghostCollision()

    Connections {
        target: player
        function onXChanged() { checkghostCollision() }
        function onYChanged() { checkghostCollision() }
    }
    Connections {
        target: board2
        function onClearghost() {crash() }
    }
    function crash() {
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
    function checkghostCollision() {
        if (crashed) {
            return
        }

        if (GameLogic.checkCollision(player, this)) {
            crash()
            livesLost++
        }
    }


    Behavior on opacity {
        SequentialAnimation {
            PropertyAnimation{ duration: 1000 }
            ScriptAction { script:ghost.destroy() }
        }
    }

    Timer {
        running: true
        interval: 1000
        repeat: true
        onTriggered: ghost.move()
    }
    Timer {
        repeat: true
        running: true
        interval: 3000
        onTriggered: {
            GameLogic.fireBullet()
        }
    }
}

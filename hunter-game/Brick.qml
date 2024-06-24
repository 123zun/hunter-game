//砖块。砖块可以被玩家角色碰撞，并且有一个碰撞后的消失动画。
import QtQuick
import QtQuick.Window

import "GameLogic.js" as GameLogic

Image {
    id: brick
    source: "images/brick.png"

    property bool crashed: false

    Connections {
        target: player
        function onXChanged() { GameLogic.checkBrickCollision() }
        function onYChanged() { GameLogic.checkBrickCollision() }
    }

    Connections {
        target: board
        function onClearBricks() { GameLogic.crash() }
    }
    Behavior on opacity {
        SequentialAnimation {
            PropertyAnimation { duration: 500 }
            ScriptAction { script: brick.destroy() }
        }
    }

}

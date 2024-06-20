//攻击口在屏幕上的位置和行为
import QtQuick
import QtQuick.Window

import "GameLogic.js" as GameLogic

Image {
    //攻击口
    x: board.width/2 - width/2
    y: board.height
    fillMode: Image.PreserveAspectFit
    source: "images/tube.png"

    Behavior on y {
        SequentialAnimation {
            PropertyAnimation { easing.type: Easing.InSine; duration: 1000 }
            PauseAnimation { duration: 2000 }
            ScriptAction { script: { player.movable = true } }
            PauseAnimation { duration: 3000 }
            PropertyAnimation { target: warpPipe; property: "y"; to: board.height }
        }
    }
}

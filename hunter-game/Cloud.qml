//游戏中的云朵，它可以在屏幕上移动并生成豆子
import QtQuick
import QtQuick.Window

import "GameLogic.js" as GameLogic

Image {
    id: cloud
    fillMode: Image.PreserveAspectFit

    Component.onCompleted: {
        x = board.width
        state = (GameLogic.getrandom(1, 20) < 20) ? "normal" : "rainy"
    }
    Behavior on x {
        SequentialAnimation {
            PropertyAnimation {
                easing.type: Easing.Linear
                duration: 15000
            }
            ScriptAction { script: cloud.destroy() }
        }
    }
    Timer {
        repeat: true
        running: true
        interval: 2000* (cloud.state === "normal" ? 1 : 0.1)
        onTriggered: {
            GameLogic.cloudbean()
        }
    }
}

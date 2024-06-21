//游戏中的云朵，它可以在屏幕上移动并生成硬币
import QtQuick
import QtQuick.Window

import "GameLogic.js" as GameLogic

Image {
    id: cloud
    fillMode: Image.PreserveAspectFit

    property int cloudSpeedLow: 12000
    property int cloudSpeedHigh: 17500

    property int coinSpeedLow: 1500
    property int coinSpeedHigh: 2500

    Component.onCompleted: {
        x = board.width
        state = (GameLogic.getrandom(1, 20) < 20) ? "normal" : "rainy"
    }

    Behavior on x {
        SequentialAnimation {
            PropertyAnimation {
                easing.type: Easing.Linear
                duration: GameLogic.getrandom(cloudSpeedLow, cloudSpeedHigh)
            }
            ScriptAction { script: cloud.destroy() }
        }
    }

    Timer {
        repeat: true
        running: true
        interval: GameLogic.getrandom(coinSpeedLow, coinSpeedHigh)
                  * (cloud.state === "normal" ? 1 : 0.1)

        onTriggered: {
            var size = (cloud.state === "normal") ? 70 : 30
            var x = cloud.x, y = cloud.y, w = cloud.width, h = cloud.height
            GameLogic.createCoin(GameLogic.getrandom(x + w/6, x + w - w/6),
                                 GameLogic.getrandom(y + h/6, y + h - h/6),
                                 size)
        }
    }
}

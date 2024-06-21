//可收集的豆子，会在屏幕上移动，并且玩家可以通过碰撞来收集它
import QtQuick
import QtQuick.Window
import QtMultimedia

import "GameLogic.js" as GameLogic

Image {
    id: coin
    opacity: 0
    fillMode: Image.PreserveAspectFit
    source: "images/coin.png"

    onYChanged: checkCoinCollision()

    property bool instantiated: false

    property int coinSpeedLow: 2000
    property int coinSpeedHigh: 3000

    function checkCoinCollision() {
        if (!instantiated)
            return

        if (GameLogic.checkCollision(player, this)) {
            points++
            coin.destroy()
        }
    }

    Component.onCompleted: {
        y = board.height - height - 100
        opacity = 1
        instantiated = true
    }

    Behavior on y {
        SequentialAnimation {
            PropertyAnimation {
                easing.type: Easing.InSine
                duration: GameLogic.getRandom(coinSpeedLow, coinSpeedHigh)
            }
            PropertyAnimation {
                easing.type: Easing.InSine
                properties: "y"
                to: board.height - coin.height
                duration: 500
            }
            PropertyAnimation {
                easing.type: Easing.InSine
                properties: "y"
                to: (board.height - coin.height) - GameLogic.getRandom(0, coin.height / 6)
                duration: 500
            }
            PropertyAnimation {
                easing.type: Easing.InSine
                properties: "y"
                to: board.height - coin.height
                duration: 500
            }
            ParallelAnimation {
                PropertyAnimation {
                    easing.type: Easing.InSine
                    properties: "y"
                    to: board.height
                    duration: 500
                }
                PropertyAnimation {
                    target: coin
                    property: "opacity"
                    to: 0; duration: 500
                }
            }
            ScriptAction {
                script: coin.destroy()
            }
        }
    }
}

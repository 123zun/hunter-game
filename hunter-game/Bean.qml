//可收集的豆子，会在屏幕上移动，并且玩家可以通过碰撞来收集它
import QtQuick
import QtQuick.Window

import "GameLogic.js" as GameLogic

Image {
    id: bean
    opacity: 0
    fillMode: Image.PreserveAspectFit
    source: "images/bean.png"


    onYChanged: GameLogic.checkbeanCollision()

    property bool beanstate: false

    property int beanSpeedLow: 2000
    property int beanSpeedHigh: 3000

    Component.onCompleted: {
        y = board.height - height - 100
        opacity = 1
        beanstate = true
    }

    Behavior on y {
        SequentialAnimation {
            PropertyAnimation {
                easing.type: Easing.InSine
                duration: GameLogic.getrandom(beanSpeedLow, beanSpeedHigh)
            }
            PropertyAnimation {
                easing.type: Easing.InSine
                properties: "y"
                to: board.height - bean.height
                duration: 500
            }
            PropertyAnimation {
                easing.type: Easing.InSine
                properties: "y"
                to: (board.height - bean.height) - GameLogic.getrandom(0, bean.height / 6)
                duration: 500
            }
            PropertyAnimation {
                easing.type: Easing.InSine
                properties: "y"
                to: board.height - bean.height
                duration: 500
            }
            ParallelAnimation {
                PropertyAnimation {
                    easing.type: Easing.InSine
                    properties: "y"
                    to: board.height
                    duration: 500
                }
                PropertyAnimation { target: bean; property: "opacity"; to: 0; duration: 500 }
            }
            ScriptAction { script: bean.destroy() }
        }
    }
}

import QtQuick
import QtQuick.Window

import "GameLogic.js" as GameLogic

Image {
    id: cloud
    fillMode: Image.PreserveAspectFit

    Component.onCompleted: {
        x = board.width
        state = (GameLogic.getrandom(1, 10) < 10) ? "grade1" : "grade2"
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
        interval: 1500* (cloud.state === "grade1" ? 1 : 0.3)
        onTriggered: {
            GameLogic.cloudbean()
        }
    }
}

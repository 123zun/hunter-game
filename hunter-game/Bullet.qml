import QtQuick
import QtQuick.Window

import "GameLogic.js" as GameLogic

Image {
    id: bullet
    z: 100
    fillMode: Image.PreserveAspectFit
    source: "images/bullet.png"

    property string direction: ""
    property bool crashed: false

    Component.onCompleted: {
        switch (direction) {
        case "left":
            x = board.width;
            break
        case "right":
            x = -width;
            rotation = 180
            break
        }
    }
    Behavior on opacity {
        SequentialAnimation {
            PropertyAnimation{ duration: 300 }
            ScriptAction { script:bullet.destroy() }
        }
    }
    Behavior on x {
        SequentialAnimation {
            PauseAnimation { duration: 1000 }
            PropertyAnimation { duration: 3000 }
            ScriptAction { script: bullet.destroy() }
        }
    }

}

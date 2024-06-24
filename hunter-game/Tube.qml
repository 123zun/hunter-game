//发射口
import QtQuick
import QtQuick.Window
import QtMultimedia

Image {

    id: tube
    z: 100
    fillMode: Image.PreserveAspectFit
    source: "images/tube.png"

    //发射口的初始方向属性
    property string direction: ""
    property bool crashed: false

    Component.onCompleted: {
         // 根据发射口的方向设置其初始位置和旋转
        switch (direction) {
        case "bottom":
            y = board.height - height
            break
        case "left":
            rotation = 90
            x = 0
            break
        case "right":
            rotation = 270
            x = board.width - height + 20
            break
        }
    }

    Behavior on opacity {
        SequentialAnimation {
            PropertyAnimation{
                duration: 300  //改变透明度
            }
            ScriptAction {
                script:tube.destroy()
            }
        }
    }

    // 设置发射口水平位置的行为动画
    Behavior on x {
        SequentialAnimation {
            PropertyAnimation {
                easing.type: Easing.InSine
                duration: 1000
            }
            PauseAnimation {
                duration: 3000
            }
            PropertyAnimation {
                target: tube
                property: "x"
                to: direction == "left" ? -tube.height
                                        : board.width + 20
            }
            ScriptAction {
                script: tube.destroy()
            }
        }
    }

    // 设置发射口垂直位置的行为动画
    Behavior on y {
        SequentialAnimation {
            PropertyAnimation {
                easing.type: Easing.InSine
                duration: 1000
            }
            PauseAnimation {
                duration: 3000
            }
            PropertyAnimation {
                target: tube
                property: "y"
                to: board.height
            }
            ScriptAction {
                script: tube.destroy()
            }
        }
    }
}

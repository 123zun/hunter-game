//发射口
import QtQuick
import QtQuick.Window
import QtMultimedia

Image {

    id: tube
    z: 100
    fillMode: Image.PreserveAspectFit
    source: "images/tube.png"

    property bool crashed: false

    Component.onCompleted: {
        y = board.height - height
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

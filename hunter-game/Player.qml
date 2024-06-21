//玩家角色
import QtQuick
import QtQuick.Window

import "GameLogic.js" as GameLogic

Image {
        id: player

        x: board.width / 2 - width / 2
        y: board.height - height - 10

        width: 100
        height: 100

        property bool movable: false

        fillMode: Image.PreserveAspectFit
        source: "images/flower-" + state + ".png"
        state: "closed"


        property int speed: 100

        // 键盘事件处理
        focus: true
        Keys.onPressed: {
            switch(event.key) {
            case Qt.Key_Left:
                x = Math.max(0, x - speed)
                break
            case Qt.Key_Right:
                x = Math.min(board.width - width, x + speed)
                break
            case Qt.Key_Up:
                y = Math.max(0, y - speed)
                break
            case Qt.Key_Down:
                y = Math.min(board.height - height, y + speed)
                break
            // case Qt.Key_Space:
            //     state = (state === "closed" ? "opened" : "closed")
            //     source = "images/flower-" + state + ".png"
            //     break
            }
        }
        Behavior on x { PropertyAnimation { duration: playerSpeed } }
        Behavior on y { PropertyAnimation { duration: playerSpeed } }

        Timer {
            repeat: true
            running: true
            interval: 200

            onTriggered: parent.state = (parent.state === "closed" ? "opened" : "closed")
        }


    }

//玩家角色
import QtQuick
import QtQuick.Window

import "GameLogic.js" as GameLogic

Image {
    id: player
     // 设置玩家的初始位置
    x: board.width / 2 - width / 2
    y: board.height + 200

    fillMode: Image.PreserveAspectFit
    source: "images/flower-" + state + ".png"
    state: "closed"

    property bool movable: false

    onMovableChanged: rotation = 0

    // 更新玩家位置的函数，根据鼠标位置
    function updatePosition(mouse) {
        x = mouse.x - width / 2
        y = mouse.y - height / 2
        var fromPosition = Qt.point(x + width / 2, y + height / 2)
        rotation = GameLogic.getRotation(fromPosition, mouse)
    }

    Behavior on x { PropertyAnimation { duration: 1000 } }
    Behavior on y { PropertyAnimation { duration: 1000 } }

    //创建一个定时器，用于周期性地改变玩家的状态
    Timer {
        repeat: true
        running: true
        interval: 200

        //// 每次定时器触发时，切换玩家的状态
        onTriggered: parent.state = (parent.state === "closed" ? "opened" : "closed")
    }
}


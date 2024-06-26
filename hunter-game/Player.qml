import QtQuick
import QtQuick.Window

import "GameLogic.js" as GameLogic

Image {

    id: player
    x: 800
    y: 500
    width: 70
    height: 70

    fillMode: Image.PreserveAspectFit
    source: "images/player-" + state + ".png"
    state: "closed"

    property int speed: 100
    Behavior on x { PropertyAnimation { duration: 100} }
    Behavior on y { PropertyAnimation { duration: 100} }
    Timer {
        repeat: true
        running: true
        interval: 200
        onTriggered: parent.state = (parent.state === "closed" ? "opened" : "closed")
     }
    }

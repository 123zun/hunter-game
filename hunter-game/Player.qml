//玩家角色
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
    property string direction: ""
    source: "images/player_" + state + ".png"
    state: "1"
    // property string direction: ""

    // onRotationChanged:fx()

    // function fx(){
    //     switch (direction) {
    //     case "left":
    //         player.rotation=180;
    //         break;
    //     case "right":
    //         player.rotation = 0;
    //         break;
    //     case "up":
    //         player.rotation = 90;
    //         break;
    //     case"down":
    //         player.rotation=270;
    //         break;
    //     }
    // }

    property int speed: 100
    Behavior on x {
        PropertyAnimation { duration: 100}
    }
    Behavior on y {
        PropertyAnimation {

            duration: 100
        }
    }
    Timer {
        repeat: true
        running: true
        interval: 400
        onTriggered: parent.state = (parent.state === "1" ? "2" : "1")
     }
    }

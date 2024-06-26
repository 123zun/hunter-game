import QtQuick
import QtQuick.Controls
import QtMultimedia

Item {
    id: gamechoose
    anchors.fill: parent

    MediaPlayer {
        id: choosegameplayer
        audioOutput: AudioOutput{}
        source: "audio/begin.mp3"
        loops: MediaPlayer.Infinite
        Component.onCompleted: {play()}
    }
    AnimatedImage {
            id: choosebackground
            anchors.fill: parent
            source: "audio/menu.gif"
            //loops: AnimatedImage.Infinite // 设置为无限循环
            //running: true // 开始播放动画
        }
    Column {
        spacing: 10
        anchors.centerIn: parent

        // Connections {
        //     target: board
        //     function onfirstlevel(){
        //         gameButton2.enabled=true
        //     }
        // }


        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "选择关卡"
            color: "black"
            font.bold: true
            font.pixelSize: 50
        }
        GameButton {
            id: gameButton
            text: "第一关"
            onClicked: {
                screenLoader.source = "Gamescreen2.qml"
            }
        }
        GameButton {
            id: gameButton2
            text: "第二关"
            enabled:true
            onClicked: {
                screenLoader.source = "GameScreen.qml"
            }
        }
        GameButton {
            id: backButton
            text: "返回"
            onClicked: {
                screenLoader.source = "MenuScreen.qml"
            }
        }
    }
}

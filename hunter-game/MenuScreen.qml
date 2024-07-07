import QtQuick
import QtQuick.Controls
import QtMultimedia
import QtQuick.Window

Item{
    id: menuScreen
    anchors.fill: parent
    MediaPlayer {
        id: beginplayer
        audioOutput: AudioOutput{}
        source: "audio/begin.mp3"
        loops: MediaPlayer.Infinite
        Component.onCompleted: {play()}
    }
    AnimatedImage {
            id: mainbackground
            anchors.fill: parent
            source: "audio/main.gif"
            //loops: AnimatedImage.Infinite // 设置为无限循环
            //running: true // 开始播放动画
        }
    Column {
        anchors.centerIn: parent
        spacing: 10

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "MENU"
            color: "white"
            font.bold: true
            font.pixelSize: 50
        }

        GameButton {
            id: gameButton
            text: "New game"
            onClicked: {
                screenLoader.source = "Choosegame.qml"
            }
        }

        GameButton {
            id: exitButton
            text: "Exit"
            onClicked: {
                Qt.quit()
            }
        }
    }
}

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
        Component.onCompleted: {play()}//信号处理器，当组件完成加载后会触发这个处理器，这里调用了play()方法来开始播放音频。
    }
    AnimatedImage {
            id: mainbackground
            anchors.fill: parent
            source: "audio/main.gif"
            //loops: AnimatedImage.Infinite // 设置为无限循环
            //running: true // 开始播放动画
        }//动画
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

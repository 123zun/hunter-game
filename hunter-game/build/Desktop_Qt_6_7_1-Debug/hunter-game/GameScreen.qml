import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtMultimedia

import "GameLogic.js" as GameLogic

Window {
    id: board
    visible: true

    width: 1920
    height: 1080

    signal clearBricks()

    property int points: 0
    property int score: 0

    property int livesLost: 0
    property int heartCount: 5

    property bool gameOver: livesLost>= heartCount
    property bool gamewin: points>=5

    onLivesLostChanged: {
        GameLogic.playerdie()
         damageplayer.play()
    }
    onPointsChanged: {
        goalplayer.play()
        GameLogic.playerwin()
    }
    MediaPlayer {
        id: goalplayer
        audioOutput: AudioOutput{}
        source: "audio/goal.mp3"
    }

    MediaPlayer {
        id: damageplayer
        audioOutput: AudioOutput{}
        source: "audio/damage.mp3"
    }
    MediaPlayer {
        id:loseplayer
        audioOutput: AudioOutput{}
        source: "audio/shibai.mp3"
    }
    MediaPlayer {
        id:winplayer
        audioOutput: AudioOutput{}
        source: "audio/victory.mp3"
    }
    MediaPlayer {
        id: bgmplayer
        audioOutput: AudioOutput{}
        source: "audio/bgm.mp3"
    }
    Component.onCompleted: {
        GameLogic.gameStart()
    }

    Timer {
        id:cloudtimer
        repeat: true
        running: false
        interval:4000
        onTriggered: GameLogic.createCloud()
    }
    Timer {
        id:bricktimer
        repeat: false
        running: false
        interval:400
        onTriggered: GameLogic.createbrick()
    }

    Timer {
        id: tubetimer
        repeat: true
        running: false
        interval: 2500

        onTriggered: {
            GameLogic.totube()
        }
    }
    Timer {
        id: bullettimer
        repeat: true
        running: false
        interval: 1000

        onTriggered: {
            GameLogic.createbullete()
        }
    }
    Image {
        id: background
        anchors { fill: parent }
        source: "images/background.png"
    }

    RowLayout {

        visible: !gameOver && !gamewin
        anchors { left: parent.left; top: parent.top; margins: 64 }

        Text {
            font.pixelSize: 50
            color: "white"
            text: "Score:"
        }

        Image {
            visible: !pausePanel.visible
            fillMode: Image.PreserveAspectFit
            source: "images/bean.png"
        }

        Text {
            font.pixelSize: 50
            color: "white"
            text: points
        }
    }

    RowLayout {
        z:50
        visible: !gameOver && !gamewin
        anchors { right: parent.right; top: parent.top; margins: 64 }
        Text{
            text:"HP:"
            font.pixelSize: 54
        }

        Repeater {
            model: heartCount

            Image {
                fillMode: Image.PreserveAspectFit
                source: index >= livesLost ? "images/heart-on.png"
                                           : "images/heart-off.png"
            }
        }
    }

    GameOver {
          id: gameover
          z:50
          visible: gameOver && !gamewin
      }
    Gamesuccess{
        z:50
        id:gamesuccess
        visible:gamewin
    }

    Label {
        z:50
        visible:!gameOver && !gamewin
        id: pauseButton
        text: "暂停"
        width: 80
        height: 50
        font.pixelSize: 40
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        TapHandler{
        onTapped: {
            GameLogic.pause()
        }
        }
    }
    Rectangle {
        z:50
        id: pausePanel
        width: board.width
        height: board.height
        color: "transparent"
        visible: false
        anchors.centerIn: parent

        Column {
            anchors.centerIn: parent
            Text {
                text: "游戏暂停"
                font.bold: true
                font.pixelSize: 48
            }
            GameButton {
                text: "继续"
                font.bold: true
                onClicked: {GameLogic.continu()}
            }
            GameButton {
                text: "重新开始"
                onClicked: {GameLogic.restart()}
            }
            GameButton {
                text: "返回主界面"
                onClicked: {GameLogic.returnmenu()}
            }
            GameButton {
                text: "退出游戏"
                onClicked: Qt.quit()
            }
        }
    }



    Player {
                id: player

                property int speed: 50
                focus: true

                Keys.onPressed: {

                    if (pausePanel.visible) {
                                return
                            }
                    switch(event.key) {
                    case Qt.Key_Left:
                        player.x = Math.max(0, x - speed)
                        break
                    case Qt.Key_Right:
                        player.x = Math.min(board.width - width, x + speed)
                        break
                    case Qt.Key_Up:
                        player.y = Math.max(0, y - speed)
                        break
                    case Qt.Key_Down:
                        player.y = Math.min(board.height - height, y + speed)
                        break
                     }
                }
                 onXChanged: {
                     tubetimer.start()
                     cloudtimer.start()
                     bullettimer.start()
                 }
            }
}

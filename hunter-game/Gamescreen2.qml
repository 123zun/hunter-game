import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls

import "GameLogic.js" as GameLogic

Window {
    id: board2
    visible: true

    width: 1920
    height: 1080

    property int points: 0
    property int score: 0

    property int livesLost: 0
    property int heartCount: 5

    property bool gameOver2: livesLost>= heartCount
    property bool gamewin2: points>=6

    signal clearghost()
    signal clearbean2()

    onLivesLostChanged: {
        GameLogic.playerdie2()
    }
    onPointsChanged: {
        GameLogic.playerwin2()
    }

    Component.onCompleted: GameLogic.gameStart2()

    Timer {
        id:ghosttimer
        repeat: false
        running: false
        interval:400
        onTriggered: GameLogic.createghost()
    }

    Image {
        id: background
        anchors { fill: parent }
        source: "images/background2.png"
    }

    RowLayout {
        z:50
        visible: !gameOver2 && !gamewin2
        anchors { left: parent.left; top: parent.top; margins: 64 }

        Text {
            font.pixelSize: 50
            color: "white"
            text: "Score:"
        }

        Image {
            visible: !pausePanel2.visible
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
        visible: !gameOver2 && !gamewin2
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
    Label {
        z:50
        visible:!gameOver2 && !gamewin2
        id: pauseButton2
        text: "暂停"
        width: 80
        height: 50
        font.pixelSize: 40
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        TapHandler{
        onTapped: {
            GameLogic.pause2()
        }
        }
    }
    Rectangle {
        z:50
        id: pausePanel2
        width: board2.width
        height: board2.height
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
                onClicked: {GameLogic.continu2()}
            }
            GameButton {
                text: "重新开始"
                onClicked: {GameLogic.restart2()}
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
    GameOver2 {
          id: gameover2
          z:50
          visible: gameOver2 && !gamewin2 && !pausePanel2
      }
    Gamesuccess2{
        id:gamesuccess2
        z:50
        visible:gamewin2
    }

    Ghost{
        id:ghost
    }

    Player {
            id: player

            property int speed: 50
            focus: true

            Keys.onPressed: {

                switch(event.key) {
                case Qt.Key_Left:
                    player.x = Math.max(0, x - speed)
                    break
                case Qt.Key_Right:
                    player.x = Math.min(board2.width - width, x + speed)
                    break
                case Qt.Key_Up:
                    player.y = Math.max(0, y - speed)
                    break
                case Qt.Key_Down:
                    player.y = Math.min(board2.height - height, y + speed)
                    break
                 }
            }
        }
}

import QtQuick
import QtQuick.Controls
Item {
    id: difficulty
    anchors.fill: parent

    // 定义难度级别
    enum Difficulty {
        Easy,
        Normal,
        Hard
    }
    // 创建一个变量来存储当前选择的难度
    property var currentDifficulty: Difficulty.Normal

    // 创建一个难度设置组合框
    ComboBox {
        id: difficultyComboBox
        anchors.centerIn: parent
        width: 300
        model: ["Easy", "Normal", "Hard"]
        onCurrentIndexChanged: {
            // 当用户选择一个不同的难度时，更新currentDifficulty
            switch (currentIndex) {
            case 0:
                currentDifficulty = Difficulty.Easy
                break
            case 1:
                currentDifficulty = Difficulty.Normal
                break
            case 2:
                currentDifficulty = Difficulty.Hard
                break
            }
        }
    }


    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: difficultyComboBox.bottom
        anchors.topMargin: 20 // 设置ComboBox和按钮之间的垂直间距
        spacing: 10
        GameButton {
            id: gameButton
            text: "Start"
            onClicked: {
                screenLoader.source = "GameScreen.qml"
            }
        }
    }
}

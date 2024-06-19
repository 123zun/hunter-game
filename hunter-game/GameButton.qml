import QtQuick
import QtQuick.Controls

Button {
    id: button
    width: 200
    height: 50
    text: "Default Animated Button"
    font.bold: true
    font.pixelSize: 18

    Image{
        id: image
        source: button.pressed ? "images/yellow_button01.png":"images/blue_button01.png"
        anchors.fill: parent
    }
}

var cloudComponent = Qt.createComponent("Cloud.qml")
function checkCollision(a, b) {
    return !((a.y + a.height < b.y)
             || (a.y > b.y + b.height)
             || (a.x + a.width < b.x)
             || (a.x > b.x + b.width))
}

function getrandom(minimum, maximum){
    var now = new Date()
    return Math.floor(Math.random(now.getSeconds()) * (maximum - minimum + 1)) + minimum
}
function getRotation(fromPosition, toPosition) {
    var rotation = Math.atan2(toPosition.y - fromPosition.y, toPosition.x - fromPosition.x)
    rotation = rotation * (180 / Math.PI)

    if (rotation < 0) {
        rotation = 360 + rotation
    }
    return 90 + rotation
}
function createCloud(x, y, width) {
    const type = getrandom(1, 3)
    cloudComponent.createObject(board, {"x": x, "y": y, "width": width,"source": "images/cloud_0" + type + ".png"})
}

function createRandomCloud() {
    createCloud(-250, getrandom(0, board.height/5.2), getrandom(150, 500))
}

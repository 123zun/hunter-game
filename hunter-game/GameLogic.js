var cloudComponent = Qt.createComponent("Cloud.qml")
function checkCollision(a, b) {
    return !((a.y + a.height < b.y)
             || (a.y > b.y + b.height)
             || (a.x + a.width < b.x)
             || (a.x > b.x + b.width))
}

function getRandom(minimum, maximum){
    var now = new Date()
    return Math.floor(Math.random(now.getSeconds()) * (maximum - minimum + 1)) + minimum
}

function createCoin(x, y, size) {
    coinComponent.createObject(board, {"x": x, "y": y, "width": size, "height": size})
}

function gameStart() {
    clearBricks()
    createBricks()

    points = 0
    livesLost = 0

    var oldSpeed = playerSpeed
    playerSpeed = 3000
    player.visible = true
    player.movable = true
    player.y = board.height - player.height - 290
    warpPipe.y = board.height - 103 - warpPipe.height
    playerSpeed = oldSpeed
}

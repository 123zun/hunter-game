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
function getRotation(fromPosition, toPosition) {
    var rotation = Math.atan2(toPosition.y - fromPosition.y, toPosition.x - fromPosition.x)
    rotation = rotation * (180 / Math.PI)

    if (rotation < 0) {
        rotation = 360 + rotation
    }

    return 90 + rotation
}

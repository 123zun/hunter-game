var a=0
var b=0
var c=0
var d=0

function checkCollision(smallObj, largeObj) {

      let smallX = smallObj.x;
      let smallY = smallObj.y;
      let smallWidth = smallObj.width;
      let smallHeight = smallObj.height;

      let largeX = largeObj.x;
      let largeY = largeObj.y;
      let largeWidth = largeObj.width;
      let largeHeight = largeObj.height;

      let smallCenterX = smallX + smallWidth / 2;
      let smallCenterY = smallY + smallHeight / 2;

      let largeCenterX = largeX + largeWidth / 2;
      let largeCenterY = largeY + largeHeight / 2;

      let dx = Math.abs(smallCenterX - largeCenterX);
      let dy = Math.abs(smallCenterY - largeCenterY);

      let halfWidth = (smallWidth + largeWidth) / 2;
      let halfHeight = (smallHeight + largeHeight) / 2;

      if (dx < halfWidth && dy < halfHeight) {

        return true;
      } else {
        return false;
      }
}

function getrandom(minimum, maximum) {

    return Math.floor(Math.random() * (maximum - minimum + 1)) + minimum;

}
var beanComponent = Qt.createComponent("Bean.qml")
function createBean(x, y, size) {

    beanComponent.createObject(board, {"x": x, "y": y, "width": size, "height": size})
}
var cloudComponent = Qt.createComponent("Cloud.qml")
function createCloud() {
    const type = getrandom(1, 3)
    var x=0
    var y=board.height*0.045
    cloudComponent.createObject(board, {"x": x, "y": y, "width":300,"source": "images/cloud_0" + type + ".png"})
}

function totube(){
        createtube(getrandom(100, board.width*0.9), board.height)
}
var tubeComponent = Qt.createComponent("Tube.qml")

var enemyComponent = Qt.createComponent("Enemy.qml")
function createtube(x, y) {

    tubeComponent.createObject(board, {"x": x, "y": y})

    x+=40
    enemyComponent.createObject(board, {"x": x, "y": y})
}


function createbullete(){

    var dir=getrandom(1,3)

    if (dir === 1)
        createbullet(-182, getrandom(board.height*0.1, board.height*0.8), "left")
    else if (dir === 2)
        createbullet(board.width, getrandom(board.height*0.1, board.height*0.8), "right")

}
var bulletComponent = Qt.createComponent("Bullet.qml")
function createbullet(x, y, direction) {

    bulletComponent.createObject(board, {"x": x, "y": y, "direction": direction})
}

var brickComponent = Qt.createComponent("Brick.qml")
function createbrick() {
    var b1 = brickComponent.createObject(board, {"x": board.width/7,"y": board.height/2})
    brickComponent.createObject(board, {"x": b1.x + b1.width, "y": b1.y})
    brickComponent.createObject(board, {"x": b1.x + b1.width*2, "y": b1.y})
    brickComponent.createObject(board, {"x": b1.x + b1.width*3, "y": b1.y})
    brickComponent.createObject(board, {"x": b1.x + b1.width*4, "y": b1.y})

    var b2 = brickComponent.createObject(board, {"x": board.width*0.7,"y": board.height*0.4})
    brickComponent.createObject(board,{"x": b2.x + b2.width, "y": b2.y})
    brickComponent.createObject(board,{"x": b2.x + b2.width*2, "y": b2.y})
    brickComponent.createObject(board,{"x": b2.x + b2.width, "y": b2.y+b2.height})
    //brickComponent.createObject(board,{"x": b2.x + b2.width, "y": b2.y+b2.height*2})

    var b3 = brickComponent.createObject(board, {"x": board.width*0.7,"y":board.height*0.7})
    brickComponent.createObject(board, {"x": b3.x + b3.width, "y": b3.y})
    brickComponent.createObject(board, {"x": b3.x + b3.width*2, "y": b3.y})

    var b4 = brickComponent.createObject(board, {"x": board.width*0.5,"y":board.height*0.7})
    brickComponent.createObject(board, {"x": b4.x + b4.width, "y": b4.y})
    brickComponent.createObject(board, {"x": b4.x + b4.width*2, "y": b4.y})

    var b5 = brickComponent.createObject(board, {"x": board.width/6.5,"y": board.height/4.5})
    brickComponent.createObject(board, {"x": b5.x + b5.width, "y": b5.y+b5.height})
    brickComponent.createObject(board, {"x": b5.x + b5.width*3, "y": b5.y+b5.height})
    brickComponent.createObject(board, {"x": b5.x + b5.width*2, "y": b5.y})

    var b6 = brickComponent.createObject(board, {"x": board.width*0.58,"y": board.height*0.35})
    brickComponent.createObject(board,{"x": b6.x, "y": b6.y+b6.height})
    brickComponent.createObject(board,{"x": b6.x, "y": b6.y+b6.height*2})

    var b7 = brickComponent.createObject(board, {"x": board.width*0.2,"y": board.height*0.7})
    brickComponent.createObject(board,{"x": b7.x+b7.width, "y": b7.y})

    var b8 = brickComponent.createObject(board, {"x": board.width*0.65,"y": board.height*0.2})
    brickComponent.createObject(board, {"x": b8.x + b8.width, "y": b8.y})
    brickComponent.createObject(board, {"x": b8.x + b8.width*2, "y": b8.y})
    brickComponent.createObject(board, {"x": b8.x + b8.width*3, "y": b8.y})
}

function gameStart() {
    console.log("game start")
    clearBricks()
    points=0
    livesLost = 0
    player.visible = true
    bricktimer.start()
    bgmplayer.play()
}

function gameOver() {
    console.log("game over")
    bgmplayer.stop()
    loseplayer.play()
    clearBricks()
    tubetimer.stop()
    score = points
    player.x = board.width*0.5
    player.y = board.height*0.5
    player.visible=false
}

function destroyObject(object) {
    object.destroy()
}

function pause(){
    console.log("game pause")
    player.visible=false
    pausePanel.visible=true
    tubetimer.stop()
    cloudtimer.stop()
    bullettimer.stop()
    a=livesLost
    b=points
}

function continu(){
    console.log("game continu")
    player.visible=true
    pausePanel.visible = false
    player.focus = true
    tubetimer.start()
    cloudtimer.start()
    livesLost = a
    points=b
}

function restart(){
    console.log("game restart")
    pausePanel.visible = false
    resetPlayer()
    gameStart()
    player.focus = true
    player.visible=true
}

function returnmenu(){
    console.log("return to menu")
    screenLoader.source = "MenuScreen.qml"
    pausePanel.visible = false
}

function resetPlayer() {
        player.x = board.width / 2
        player.y = board.height / 2;
}

function playerdie(){
    if (livesLost >= heartCount) {
        console.log("player die")
        gameOver()
    }
}

function cloudbean(){
    var size = 40
    var x = cloud.x, y = cloud.y
    createBean(x+x*0.5,y+y*0.5,size)
}

function checkbeanCollision() {
    if (!beanstate)
        return

    if (checkCollision(player, this)) {
        console.log("player scored")
        points++
        bean.destroy()
    }
}

function checkenemyCollision() {
    if (crashed) {
        return
    }

    if (checkCollision(player, this)) {
        console.log("enemy died")
        crashed = true
        opacity = 0
        livesLost++
    }
}

function checkBrickCollision() {
    if (crashed) {
        return
    }
    if (checkCollision(player, this)) {
        console.log("brick destroyed")
        crash()
        livesLost++
    }
}

function crash() {
    crashed = true
    opacity = 0
}
function playerwin(){
    if(points===12){
        winplayer.play()
        bgmplayer.stop()
        gamewin()
    }
}
function gamewin(){
    console.log("you win")
    clearBricks()
    tubetimer.stop()
    score = points
    player.x = board.width*0.5
    player.y = board.height*0.5
    player.visible=false
}
function playerdie2(){
    if (livesLost >= heartCount) {
        console.log("player die")
        gameover2()
        bgmplayer2.stop()
        loseplayer2.play()
    }
}
function gameover2(){
    console.log("game over")
    score = points
    player.x = board2.width*0.5
    player.y = board2.height
    player.visible=false
}
function pause2(){
    console.log("game pause")
    player.visible=false
    pausePanel2.visible=true
    ghostpause()
    bean2pause()
    c=livesLost
    d=points
}

function continu2(){
    console.log("game continu")
    player.visible=true
    pausePanel2.visible = false
    ghostcontinu()
    bean2continu()
    player.focus = true
    livesLost = c
    points=d
}
function gameStart2() {
    console.log("game satrt")
    bgmplayer2.play()
    clearghost()
    clearbean2()
    points=0
    livesLost = 0
    player.visible = true
    ghosttimer.start()
    createbean2()

}
function restart2(){
    console.log("game start")
    clearghost()
    clearbean2()
    pausePanel2.visible = false
    resetPlayer2()
    gameStart2()
    player.focus = true
    player.visible=true
}
function resetPlayer2() {
        player.x = board2.width / 2
        player.y = board2.height / 2;
}

var ghostComponent = Qt.createComponent("Ghost.qml")

function createbean2(){

    bean2Component.createObject(board2, {"x":1600, "y": 200})
    bean2Component.createObject(board2, {"x":200, "y": 800})
    bean2Component.createObject(board2, {"x":600, "y": 500})
    bean2Component.createObject(board2, {"x":1200, "y": 300})
    bean2Component.createObject(board2, {"x":50, "y": 50})
    bean2Component.createObject(board2, {"x":1200, "y": 900})

}
var bullet2Component = Qt.createComponent("Bullet2.qml")
function fireBullet() {

    var possibleDirections = ["up", "down", "left", "right"]
    var randomIndex = Math.floor(Math.random() * possibleDirections.length)
    var direction = possibleDirections[randomIndex]

    var x=ghost.x + ghost.width/2
    var y=ghost.y + ghost.height/2

    shoot(x,y,direction)
}
function shoot(x,y,direction){
    bullet2Component.createObject(board2, {"x": x, "y": y, "direction": direction})
}
var bean2Component = Qt.createComponent("Bean2.qml")
function createghost(){

    ghostComponent.createObject(board2, {"x":1600, "y": 200})
    ghostComponent.createObject(board2, {"x":200, "y": 800})
    ghostComponent.createObject(board2, {"x":600, "y": 500})
    ghostComponent.createObject(board2, {"x":1200, "y": 300})
    ghostComponent.createObject(board2, {"x":50, "y": 50})
    ghostComponent.createObject(board2, {"x":1200, "y": 900})
    ghostComponent.createObject(board2, {"x":1500, "y": 600})
    ghostComponent.createObject(board2, {"x":1000, "y": 400})
    ghostComponent.createObject(board2, {"x":950,"y":800 })

}
function playerwin2(){
    if(points===6)
    {
        console.log("you win")
        bgmplayer2.stop()
        winplayer2.play()
        gamewin2()
    }
}
function gamewin2(){
    clearbean2()
    score = points
    player.x = board2.width*0.5
    player.y = board2.height*0.5
    player.visible=false
}

function gameStart() {
    clearBricks()
    points=0
    livesLost = 0
    player.visible = true
    bricktimer.start()
}
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

//bean
var beanComponent = Qt.createComponent("Bean.qml")
function createBean(x, y, size) {

beanComponent.createObject(board, {"x": x, "y": y, "width": size, "height": size})
}
function checkbeanCollision() {
if (!beanstate)
    return

if (checkCollision(player, this)) {
    points++
    bean.destroy()
}
}
//cloud
var cloudComponent = Qt.createComponent("Cloud.qml")
function createCloud() {
const type = getrandom(1, 3)
var x=0
var y=board.height*0.045
cloudComponent.createObject(board, {"x": x, "y": y, "width":300,"source": "images/cloud_0" + type + ".png"})
}
function createCloud() {
const type = getrandom(1, 3)
var x=0
var y=board.height*0.045
cloudComponent.createObject(board, {"x": x, "y": y, "width":300,"source": "images/cloud_0" + type + ".png"})
}
function cloudbean(){
var size = 40
var x = cloud.x, y = cloud.y
createBean(x+x*0.5,y+y*0.5,size)
}
//brick
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
function checkBrickCollision() {
if (crashed) {
    return
}
if (checkCollision(player, this)) {
    crash()
    livesLost++
}
}
function crash() {
crashed = true
opacity = 0
}

function totube(){
    createtube(getrandom(100, board.width*0.9), board.height)
}
//tube
var tubeComponent=Qt.createComponent("Tube.qml")
function createtube(x, y) {

tubeComponent.createObject(board, {"x": x, "y": y})
}
//bullet
var bulletComponent=Qt.createComponent("Bullet.qml")
function createbullete(){

var dir=getrandom(1,3)

if (dir === 1)
    createbullet(-182, getrandom(board.height*0.1, board.height*0.8), "left")
else if (dir === 2)
    createbullet(board.width, getrandom(board.height*0.1, board.height*0.8), "right")

}

function createbullet(x, y, direction) {

bulletComponent.createObject(board, {"x": x, "y": y, "direction": direction})
}

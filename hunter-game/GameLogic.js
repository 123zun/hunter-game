var beanComponent = Qt.createComponent("Bean.qml")
var cloudComponent = Qt.createComponent("Cloud.qml")
var brickComponent = Qt.createComponent("Brick.qml")


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

function createBean(x, y, size) {

    beanComponent.createObject(board, {"x": x, "y": y, "width": size, "height": size})
}

function createCloud() {
    const type = getrandom(1, 3)
    var x=0
    var y=board.height*0.045
    cloudComponent.createObject(board, {"x": x, "y": y, "width":300,"source": "images/cloud_0" + type + ".png"})
}

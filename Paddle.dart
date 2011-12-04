class Paddle {
  final Game game;
 
  final paddleh = 10;
  final paddlew = 75;
  
  var paddlex;
  var canvasMinX;
  var canvasMaxX;
  bool rightDown = false;
  bool leftDown = false;
  
  Paddle(this.game) {
    canvasMinX = 0;
    canvasMaxX = canvasMinX + game.WIDTH;
    
    this.paddlex = game.WIDTH / 2;
    document.on.keyDown.add(_onKeyDown);
    document.on.keyUp.add(_onKeyUp);
    document.on.mouseMove.add(_onMouseMove);
  }
  
  draw() {
    //move the paddle left or right depending upon keypress
    if (rightDown) paddlex += 5;
    else if (leftDown) paddlex -= 5;
    
    //draw the paddle rectangle.
    rect(game.ctx, paddlex, game.HEIGHT - paddleh, paddlew, paddleh);
  }
  
  bool hasHitBall(ballPosX) {
    return (ballPosX > paddlex && ballPosX < paddlex + paddlew);
  }
  
  _onKeyDown(event) {
    if (event.keyCode == 39) { 
      rightDown = true;
    }
    else if (event.keyCode == 37) {
      leftDown = true;
    }
  }
  
  _onKeyUp(event) {
    if (event.keyCode == 39) {
      rightDown = false;
    }
    else if (event.keyCode == 37) {
      leftDown = false;
    }
  }
  
  _onMouseMove(event) {
    if (event.pageX > canvasMinX && event.pageX < canvasMaxX) {
      paddlex = event.pageX - canvasMinX;
    }
  }
   
 
}

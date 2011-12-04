
class Game {
  
  final CanvasElement _canvas; 
  CanvasRenderingContext2D ctx;
  
  Wall wall;
  Ball ball;
  Paddle paddle;
  
  var WIDTH;
  var HEIGHT;
  
  var _intervalId;
  
  
  
  Game(this._canvas) {
    ctx = _canvas.getContext("2d");
    WIDTH = _canvas.width;
    HEIGHT = _canvas.height;
    
    document.on.keyPress.add(_onKeyPress);
     
  }
  
  
  
  start() {
    wall = new Wall(this);
    ball = new Ball(this);
    paddle = new Paddle(this);
    
    //call the function draw() every 10ms.
    _intervalId = document.window.setInterval(this.draw, 10);
    
  }
  
  draw() {
    clear(ctx,WIDTH,HEIGHT);
    wall.draw();
    paddle.draw();
    
    if (ball.draw() == false) {
      print("ball.draw==false");
      //game over, so stop the repeat.
      document.window.clearInterval(_intervalId);  
    }
        
  }
  
  _onKeyPress(event) {
    if (event.keyCode == 13) {
      wall = new Wall(this);
      ball = new Ball(this);
      paddle = new Paddle(this);
      
      //restart the game.
      document.window.clearInterval(_intervalId);
      start();
    }
  }
  
  
  
}
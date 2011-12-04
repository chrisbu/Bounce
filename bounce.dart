#import('dart:html');
#source('Ball.dart');
#source('Paddle.dart');
#source('Wall.dart');
#source('Game.dart');


circle(ctx,x,y,r) {
  ctx.beginPath();
  ctx.arc(x, y, r, 0, Math.PI*2, true);
  ctx.closePath();
  ctx.fill();
}

rect(ctx,x,y,w,h) {
  ctx.beginPath();
  ctx.rect(x,y,w,h);
  ctx.closePath();
  ctx.fill();
}

clear(ctx,WIDTH,HEIGHT) {
  ctx.clearRect(0, 0, WIDTH, HEIGHT);
}


void main() {
  //get a reference to the canvas
  final CanvasElement canvas = document.query('#canvas');
  
 
  //create the game object, and start it.
  final Game game = new Game(canvas);
  game.start();
  
}


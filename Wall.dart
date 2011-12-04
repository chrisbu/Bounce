class Wall {
  final NROWS = 5;
  final NCOLS = 5;
  final BRICKHEIGHT = 15;
  final PADDING = 1;
  final Game game;
  final VISIBLE = 1;
  final HIDDEN = 0;
  
  var BRICKWIDTH;
  var bricks;
  
  Wall(this.game) {
    BRICKWIDTH = (game.WIDTH/NCOLS) - 1;
    
    //initialise the bricks in the wall
    bricks = new List(NROWS);
    for (var i=0; i < NROWS; i++) {
      //for each row, create a new list of columns
      bricks[i] = new List(NCOLS); 
      for (var j=0; j < NCOLS; j++) {
        bricks[i][j] = VISIBLE; //for each brick, set it to visible.
      }
    }
  }
  
  /**
  * if we have hit a brick, return true if we have
  */
  checkCollision(ballPosX, ballPosY) {
    //have we hit a brick?
    var rowheight = BRICKHEIGHT + PADDING;
    var colwidth = BRICKWIDTH + PADDING;
    var row = (ballPosY / rowheight).floor();
    var col = (ballPosX / colwidth).floor();
    //if so, reverse the ball and mark the brick as broken
    if (ballPosY < NROWS * rowheight && 
           row >= 0 && 
           col >= 0 && 
           bricks[row][col] == 1) {
      
      //hide the brick
      bricks[row][col] = HIDDEN;
      return true;
    }
    return false;
  }
  
  draw() {
    //draw bricks
    for (int i=0; i < NROWS; i++) { //for each row
      for (int j=0; j < NCOLS; j++) { //for each col
        if (bricks[i][j] == VISIBLE) {
          //only draw visible bricks
          rect(game.ctx,
                (j * (BRICKWIDTH + PADDING)) + PADDING, 
                (i * (BRICKHEIGHT + PADDING)) + PADDING,
                BRICKWIDTH, BRICKHEIGHT);
        }
      }
    }
  }
}
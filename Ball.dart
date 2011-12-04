class Ball {
  final Game game;
  final BALLSIZE = 10;
  
  var directionX = 2;
  var directionY = 4;
  var posX = 150;
  var posY = 150;
  
  Ball(this.game) {}
  
  /**
  * Draws the ball in the current position, and moves the 
  * ball ready for the next iteration.
  * If the ball has missed the paddle, then the game is over
  * and returns false. 
  */
  bool draw() {
    //draw the ball at the current position
    circle(game.ctx,posX,posY,BALLSIZE);
    
    final gameOver = checkForBounce();
    
    if (gameOver == false) {
      //check to see if we've hit a brick
      checkHitBrick();
      
      //move ball ready for the next iteration
      applyMovement();
      return true;
    }
    else {
      return false;
    }
    
  }
  
  /**
  * Has the ball hit a brick?  If so, change the y direction of the ball.
  */
  checkHitBrick() {
    //have we hit a brick?
    if (game.wall.checkCollision(posX, posY)) {
      directionY = -directionY;   //reverse the ball.
    }
    
    
  }
  
  /**
  * Check to see if the ball has bounced on an edge or the paddle.
  * If the ball misses the paddle, then return false, indicating
  * gameOver.
  */
  bool checkForBounce() {
    //change x direction?
    if (posX + directionX > game.WIDTH -1  || posX + directionX  < 0) {
      directionX = -directionX; 
    }

    //change y direction?
    if (posY + directionY < 0) {
      directionY = -directionY; 
    }
    else if (posY + directionY > game.HEIGHT) {
      //has it hit the paddle?
      if (game.paddle.hasHitBall(posX)) {
        directionY = -directionY;
      }
      else {
        //game over, so stop the animation
        return true;

      }
    }
    return false;
  }

  /**
  * Move the ball by applying the direction increment / decrement.
  * (directions may be negative).
  */  
  applyMovement() {
    //apply the movement change./
    posX += directionX;
    posY += directionY;
  }
}

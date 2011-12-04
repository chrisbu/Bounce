Google Dart port of the canvas tutorial at 
http://billmill.org/static/canvastutorial/

Ref http://www.dartlang.org

WARNING - don't try to view the .js file (it's not optimized).

bounce.dart is the main library file, which defines the main() method and some
utility functions.

The Game.dart class creates the main game loop, making use of the 
Ball, Wall and Paddle classes, each of which has a draw() function

It makes use of document.window.setInterval() to callback the 
main game.draw() function every 10ms - this gives the rudimentary animation.
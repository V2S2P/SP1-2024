class Ball { // A class is something that has data for our object and the functionality(methods) of it.
  // Data
  float x, y, diameter, xspeed, yspeed;
  boolean popped = false;

  // Constructor
  // The Constructor is the moment the object is born, so when we give it these parameters we tell it to be born
  // with these values from the start.
  Ball(float xstart, float ystart, float speedX, float speedY, float dia) {
    x = xstart;
    y = ystart;
    xspeed = speedX;
    yspeed = speedY;
    diameter = dia;
  }

  // Method for displaying the ball, its width, height and color
  void displayBall(float diameter, color c) {
    stroke(0);
    if (popped) { // If the ball has popped, change to black. So since popped is default set to false, this wont happen
      // unless you click.
      fill(0);
    } else {
      fill(c);
    }

    ellipse(x, y, diameter, diameter);
  }
  // Method for the speed of the ball, both on the x-axis and y-axis
  void speed() {
    x = x + xspeed;
    y = y + yspeed;
  }
  // Method for checking when the balls hit the edges, if they hit either the left or right edge they will bounce
  // back, and if they hit either the top or bottom they will also bounce back.
  void checkEdges() {
    if (x > width || x < 0) {
      xspeed = xspeed * -1;
    }
    if (y > height || y < 0) {
      yspeed = yspeed * -1;
    }
  }
  void ballPop() {
    popped = true; // Set the popped state to true when clocked.
  }

  boolean bounceOffEach(Ball[] balls) { // The method now takes a Ball[] as parameter, which is an array of Ball objects
    for(Ball other : balls){ // A for each loop, it iterates over each Ball object in the balls[] array.
    // The temporary variable "other" represents one ball from the array during each iteration of the loop.
    // Example: The first iteration, "other" refers to the first ball in the array, second iteration it will refer to the
    // second and so on till the end of the array
      if(other != this){ // This if statement ensures that the current ball(this) does not compare itself with itself
      // self collision does not make sense. If "other" is the same as "this", the method skips this iteration and moves
      // on to the next ball.
        float d = dist(this.x,this.y,other.x,other.y); // float d calculates the distance "d" between the center
        // of the current ball(this.x,this.y) and the center of the "other" ball(other.x,other.y).
        // The dist() function in processing calculates the straight-line distance between two points (x1,y2) and (x2,y2)
        if(d < (this.diameter/2 + other.diameter/2)){ // We check if distance d between the centers of the two balls is less
        // than the sum of their radii(which is diameter/2 for each ball). If the distance is less than the sum of the radii
        // it means the two balls are overlapping or colliding.
          xspeed = xspeed * -1; // when colliding the balls go the opposite direction on the x and y axis
          yspeed = yspeed * -1;
          return true; // The method returns true as soon as collision is detected, saying that a collision has happened
        }
      }
    }
    return false; // If the loop finishes and no collision has happened (so the distance between this and every other 
    // ball is greater than their radii), then the method returns false, saying that no collision has happened.
  }
}

/* Explaning of for each loop
And the current ball (this) is b1. The loop goes through each ball in the array:

First Iteration: other = b1

other != this will be false because b1 == b1 (it's the same ball), so this iteration is skipped.
Second Iteration: other = b2

other != this will be true because b2 != b1, so the distance between b1 and b2 is calculated.
Third Iteration: other = b3

other != this will be true because b3 != b1, so the distance between b1 and b3 is calculated.
Fourth Iteration: other = b4

other != this will be true because b4 != b1, so the distance between b1 and b4 is calculated.

The loop checks each ball, and if a collision is found with any ball (b2, b3, or b4), the speed is reversed and the method returns true.

*/

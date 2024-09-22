Ball[] balls = new Ball[50];

void setup() {
  // We initialize our object. "b" and "b2" are both new instances of our "Ball" object.
  size(1000, 1000);
  
  for(int i = 0; i < balls.length; i++){
    balls[i] = new Ball(50*i,0,3,2.5,32);
    }
}

boolean collisionDetected = false;

void draw() {
  // Using dot syntax to call a function/method on our object of ball b and ball b2
  if (collisionDetected) {
    background(0, 255, 0);
  } else {
    background(255);
  }
  for(int i = 0; i < balls.length; i++){
     balls[i].displayBall(32,color(255,0,0));
     balls[i].speed();
     balls[i].checkEdges();
     if(balls[i].bounceOffEach(balls)){
     collisionDetected = true;
     }
  }
}

void mousePressed() {
  // When mousePressed (when you click) the balls will pop and turn black.
 for(int i = 0; i < balls.length; i++){
   balls[i].ballPop();
 }
}

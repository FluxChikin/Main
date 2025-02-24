class Player {

  // player variables
  float xpos;
  float ypos;
  float radius;
  float speed;
  float speeD;
  String classType;
  color rcolor;
  
  // gun variables
  float gx;
  float gy;
  float gRad;

  Player(float xpos, float ypos, float radius, float speed, String classType, color rcolor) {
    this.xpos = xpos;
    this.ypos = ypos;
    this.radius = radius;
    this.speed = speed;
    speeD = sqrt((speed*speed)/2);
    this.classType = classType;
    this.rcolor = rcolor;
    gRad = this.radius/5;
  }
  
  void move() {
    if (keyState[2] == true && keyState[3] == true) {
      this.xpos += speeD;
      this.ypos -= speeD;
    } else if (keyState[0] == true && keyState[3] == true) {
      this.xpos -= speeD;
      this.ypos -= speeD;
    } else if (keyState[2] == true && keyState[1] == true) {
      this.xpos += speeD;
      this.ypos += speeD;
    } else if (keyState[0] == true && keyState[1] == true) {
      this.xpos -= speeD;
      this.ypos += speeD;
    } else if (keyState[0] == true) {
      //left
      this.xpos -= this.speed;
    } else if (keyState[2] == true) {
      //right
      this.xpos += this.speed;
    } else if (keyState[3] == true) {
      //up
      this.ypos -= this.speed;
    } else if (keyState[1] == true) {
      //down
      this.ypos += this.speed;
    }
  }

  void render() {
    fill(this.rcolor);
    ellipse(this.xpos, this.ypos, this.radius, this.radius);
    gun(frameCount/40.0f, 5);
    gun(frameCount/60.0f, 20);
    gun(frameCount/80.0f, 30);
    gun(frameCount/100.0f, 50);
  }
  
  void gun(float ang, float dist2) {
    float dist = this.radius + dist2 + 10; 
    gx = this.xpos + (dist*cos(ang));
    gy = this.ypos + (dist*sin(ang));
    println(gx, gy);
    ellipse(gx,gy,gRad,gRad);
  }
}

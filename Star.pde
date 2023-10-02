class Star {
  
  PShape center;
  float xpos;
  float ypos;

  float scaleSize;
  float hardScale;
  float[] sizes = {0.50, 0.75, 1.0, 1.25, 1.5, 1.75, 2.0};
  boolean scaled;

  float rotationSpeed;
  float[] speeds = {0.2, 0.4, 0.6, 0.8, 1.0, 1.2, 1.4, 1.6, 1.8, 2.0};
  boolean starDirection;

  color darkRed = color(139,0,0);
  color tangerineOrange = color(242, 133, 0);
  color brightYellow = color(255, 242, 0);
  color lightBlue = color(173, 216, 230);
  color justWhite = color(255, 255, 255);
  color[] pallette = {darkRed, tangerineOrange, brightYellow, lightBlue, justWhite};
  color starColor;

  Star(float x, float y) {
    xpos = x;
    ypos = y;

    starColor = (pallette[int(random(0, 5))]);

    scaled = false;
    scaleSize = (sizes[int(random(0, 7))]);
    hardScale = scaleSize;

    starDirection = (((int(random(1, 100)))%2)==0);
    rotationSpeed = (speeds[int(random(0, 10))]);
  }

  void display(){
    scale(0.5);
    star_scale();
    star_color();
    drawStar();
    star_direction();
  }

  void drawStar(){
    beginShape();
    vertex(xpos, ypos);
    vertex(xpos+7, ypos+15);
    vertex(xpos+23, ypos+18);
    vertex(xpos+12, ypos+28);
    vertex(xpos+15, ypos+45);
    vertex(xpos, ypos+37);
    vertex(xpos-15, ypos+45);
    vertex(xpos-12, ypos+28);
    vertex(xpos-23, ypos+18);
    vertex(xpos-7, ypos+15);
    endShape(CLOSE);
  }

  void star_color() {
    stroke(255);
    fill(starColor);
  }

  void star_direction() {
    if(starDirection) {
      rotate(rotationSpeed);
      rotationSpeed = rotationSpeed + 0.1;
    }
    if(!starDirection) {
      rotate(rotationSpeed);
      rotationSpeed = rotationSpeed - 0.1;
    }  
  }

  void star_scale() {
    if(scaled) {
      scale(scaleSize);
      if(scaleSize >= hardScale) {
        scaled = false;
      }
      scaleSize = scaleSize + 0.05;
    } else if(!scaled) {
      scale(scaleSize);
      if(scaleSize < 0.25){
        scaled = true;
      }
      scaleSize = scaleSize - 0.05;
    }
  }
}

class Button {
  /*
  
   Default button (No Type):
   X = 100
   Y = 100
   W = 100
   H = 100
   strokeWeight = 1 (not hovering)
   strokeWeight = 3 (hovering)
   stroke = black
   fill = white
   no img, no text
   
   
   Button Types:
   0: Default button, with location + size
   1: Button 0, with stroke & strokeWeight on hover and fill on pressed able to be changed
   2: Button 1, but with non-hover stroke & strokeweight, and not pressed fill
   3: Button 2, with img
   
   */

  float x, y, w, h;
  color cNotHover, cHover, cNotPressed, cPressed;
  PImage img;
  int hoverWeight, hoverNotWeight;
  int buttonType;
  String label;

  Button(PImage Image, float X, float Y, float W, float H, int strokeHoverWeight, int strokeNotHoverWeight) {
    x = X;
    y = Y;
    w = W;
    h = H;  
    hoverWeight = strokeHoverWeight;
    hoverNotWeight = strokeNotHoverWeight;
    
    img = Image;
  }

  Button(String buttonLabel, float X, float Y, float W, float H, color cStrokeHover, color cStrokeNotHover, color cFillPressed, color cFillNotPressed, int strokeHoverWeight, int strokeNotHoverWeight) {
    x = X;
    y = Y;
    w = W;
    h = H;
    cHover = cStrokeHover;
    cPressed = cFillPressed;
    hoverWeight = strokeHoverWeight;
    cNotHover = cStrokeNotHover;
    cNotPressed = cFillNotPressed;
    hoverNotWeight = strokeNotHoverWeight;

    label = buttonLabel;
  }


  // Type 0
  Button(int type, float X, float Y, float W, float H) {
    buttonType = type; // Location
    x = X;
    y = Y;
    w = W;
    h = H;
    if (type < 2) {
      if (type == 0) {
        cHover = 50;
        cPressed = 0;
        hoverWeight = 3;
      }
      cNotHover = 0;
      cNotPressed = 255;
      hoverNotWeight = 1;
    }
  }

  // Type 1
  Button(int type, float X, float Y, float W, float H, color cStrokeHover, color cFillPressed, int strokeHoverWeight) {
    this(type, X, Y, W, H); // Location, Stroke, Fill
    cHover = cStrokeHover;
    cPressed = cFillPressed;
    hoverWeight = strokeHoverWeight;
  }

  // Type 2
  Button(int type, float X, float Y, float W, float H, color cStrokeHover, color cStrokeNotHover, color cFillPressed, color cFillNotPressed, int strokeHoverWeight, int strokeNotHoverWeight) {
    this(type, X, Y, W, H, cStrokeHover, cFillPressed, strokeHoverWeight); // Location, Stroke, Fill, NotStroke, NotFill
    cNotHover = cStrokeNotHover;
    cNotPressed = cFillNotPressed;
    hoverNotWeight = strokeNotHoverWeight;
  }

  // Type 3
  Button(int type, float X, float Y, float W, float H, color cStrokeHover, color cStrokeNotHover, color cFillPressed, color cFillNotPressed, int strokeHoverWeight, int strokeNotHoverWeight, PImage Image) {
    this(type, X, Y, W, H, cStrokeHover, cFillPressed, strokeHoverWeight, cStrokeNotHover, cFillNotPressed, strokeNotHoverWeight); // Image
    img = Image;
  }

  void show() {
    changeStroke();
    changeFill();
    drawRect();
    drawImg();
    drawTxt();
  }

  boolean hover() {
    return boundingBox(x, y, w, h);
  }

  boolean press() {
    if (hover() && mousePressed) return true;
    else return false;
  }

  void changeStroke() {
    if (this.hover()) {
      stroke(cHover);
      strokeWeight(hoverWeight);
    } else {
      stroke(cNotHover);
      strokeWeight(hoverNotWeight);
    }
  }

  void changeFill() {
    if (this.press()) fill(cPressed);
    else fill(cNotPressed);
  }

  void drawRect() {
    if (img == null) {
      rectMode(CENTER);
      rect(x, y, w, h);
    } else {
      noFill();
      stroke(0);
      rect(x, y, w, h);
    }
  }

  void drawImg() {
    if (img != null) {
      imageMode(CENTER);
      image(img, x, y, w, h);
    }
  }

  void drawTxt() {
    if (label != null) {
      textAlign(CENTER, CENTER);
      txtFillCalculate();
      textSize(20);
      text(label, x, y);
    }
  }

  void txtFillCalculate() {
    if (this.press()) fill(color( abs(red(cPressed)-255), abs(green(cPressed)-255), abs(blue(cPressed)-255) ));
    else fill(color( abs(red(cNotPressed)-255), abs(green(cNotPressed)-255), abs(blue(cNotPressed)-255) ));
  }
}

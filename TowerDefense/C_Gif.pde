class Gif {
  float x, y, w, h;
  int frames, currentFrame, framerate, subFrame;
  String location, name;
  PImage[] gif;

  Gif(int type, int X, int Y, String Location, String Name, int Frames, int FrameRate) {
    x = X;
    y = Y;
    frames = Frames;
    framerate = FrameRate;
    location = Location;
    name = Name;
    currentFrame = 0;
    subFrame = 0;

    gif = new PImage[frames];
    for (int i = 0; i < frames; i++) {
      gif[i] = loadImage(location + name + " (" + (i+1) + ").png");
    }
    
    if (type == 0) {
      w = gif[0].width;
      h = gif[0].height;
    }
  }

  Gif(int type, int X, int Y, int W, int H, String Location, String Name, int Frames, int FrameRate) {
    this(type, X, Y, Location, Name, Frames, FrameRate);
    w = W;
    h = H;
  }

  void show() {
    if (gif[currentFrame] != null) {
      image(gif[currentFrame], x, y, w, h);
    }
    subFrame++;
    if (subFrame == framerate-1) currentFrame++;
    subFrame = subFrame % framerate;

    currentFrame = currentFrame % frames;
  }
}

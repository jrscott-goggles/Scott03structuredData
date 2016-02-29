class ImgButton {
  int spot;
  PImage cover;
  PVector pos;
  
  ImgButton() {
    spot = 0;
    cover = loadImage("noImage.jpg");
    pos = new PVector(0, 0);
  }
  
   ImgButton(int spot, PImage cover, PVector pos) {
    this.spot = spot;
    this.cover = cover;
    this.pos = pos;
  }
  
  void draw() {
    image(cover,pos.x,pos.y);
  }
  
  boolean clicked() {
    return (mouseX > pos.x && mouseX < pos.x + cover.width && mouseY > pos.y && mouseY < pos.y + cover.height);
  }
}
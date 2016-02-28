class Button {
  String text;
  PVector pos;
  PVector size;
  int type;
  
  Button() {
    text = "default";
    pos = new PVector(0,0);
    size = new PVector(textWidth(text) + 5, 20);
    type = 0;
  }
  
   Button(String text, int x, int y, int type) {
    this.text = text;
    pos = new PVector (x,y);
    size = new PVector(textWidth(text) + 10, 20);
    this.type = type;
  }
  
  void draw() {
    rect(pos.x, pos.y, size.x, size.y);
    text(text, pos.x + 5, pos.y + 2);
  }
  
  boolean clicked() {
    return (mouseX > pos.x && mouseX < pos.x + size.x && mouseY > pos.y && mouseY < pos.y + size.y);
  }
  
}
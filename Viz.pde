void drawViz() {
  if (drawState == CHOOSING_GENRE) {
    nonFicButton.draw();
    ficButton.draw();
  } else if (drawState == SHOWING_GENRE) {
    text(list, width/2, 10);
    if (booksPicked) {
      for (ImgButton b : bookButtons) {
        b.draw();
      }
      if (inScrollRight() && bookButtons[bookButtons.length-1].pos.x >= width-128) {
        scrollRight();
      } else if (inScrollLeft() && bookButtons[0].pos.x <= 0) {
        scrollLeft();
      }
    } else {
      displayLoading();
    }
  }
  image(nytLogo, width - nytLogo.width, height - nytLogo.height);
}

boolean inScrollRight() {
  return mouseX > width-20 && mouseY > height-nytLogo.height-202 && mouseY < height-nytLogo.height;
}

boolean inScrollLeft() {
  return mouseX < 20 && mouseY > height-nytLogo.height-202 && mouseY < height-nytLogo.height;
}

void scrollRight() {
  for (ImgButton b : bookButtons) {
    b.pos.x -= 5;
  }
}

void scrollLeft() {
  for (ImgButton b : bookButtons) {
    b.pos.x += 5;
  }
}
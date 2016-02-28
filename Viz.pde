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
    } else {
      displayLoading();
    }
  }
  image(nytLogo, width - nytLogo.width, height - nytLogo.height);
}
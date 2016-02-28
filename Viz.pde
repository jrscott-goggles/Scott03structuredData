void drawViz() {
  if (drawState == CHOOSING_GENRE) {
    nonFicButton.draw();
    ficButton.draw();
  } else if (drawState == SHOWING_GENRE) {
    if (genre == NONFIC) {
      text("Non-Fiction", width/2, height/2);
    } else if (genre == FIC) {
      text("Fiction", width/2, height/2);
    }
  }
  image(nytLogo, width - nytLogo.width, height - nytLogo.height);
}
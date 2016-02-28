void drawViz() {
  if (drawState == CHOOSING_GENRE) {
    nonFicButton.draw();
    ficButton.draw();
  } else if (drawState == SHOWING_GENRE) {
    text(list, width/2, 10);
    if (genre == NONFIC) {
      
    } else if (genre == FIC) {
      
    }
  }
  image(nytLogo, width - nytLogo.width, height - nytLogo.height);
}
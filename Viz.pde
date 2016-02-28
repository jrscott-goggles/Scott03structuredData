void drawViz() {
  if (drawState == CHOOSING_GENRE) {
    nonFicButton.draw();
    ficButton.draw();
  } else if (drawState == SHOWING_GENRE) {
    text(list, width/2, 10);
    if (booksPicked) {
      for (int i = 0; i < bookPics.length; ++i) {
        image(bookPics[i], bookPics[i].width * i, bookPics[i].height);
      }
    } else {
      displayLoading();
    }
  }
  image(nytLogo, width - nytLogo.width, height - nytLogo.height);
}
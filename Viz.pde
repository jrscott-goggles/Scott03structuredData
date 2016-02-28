void drawViz() {
  if (drawState == CHOOSING_GENRE) {
    nonFicButton.draw();
    ficButton.draw();
  } else if (drawState == SHOWING_GENRE) {
    textAlign(CENTER);
    text(list, width/2, 20);
    if (booksPicked) {
      for (ImgButton b : bookButtons) {
        b.draw();
      }
      if (inScrollRight() && bookButtons[bookButtons.length-1].pos.x >= width-128) {
        scrollRight();
      } else if (inScrollLeft() && bookButtons[0].pos.x <= 0) {
        scrollLeft();
      }
      if (bookChosen) {
        //draw the info and the image
        image(bookButtons[chosenBook].cover, 30, 50);
        textAlign(LEFT);
        text("Ranking: " + 0, 200, 75);
        text("Title: " + 0, 200, 95);
        text("Author: " + 0, 200, 115);
        text("Weeks on Best Sellers List " + 0, 200, 135);
        text("ISBN10#: " + 0, 200, 175);
        text("ISBN13#: " + 0, 200, 195);
      }
    } else {
      displayLoading();
    }
  }
  image(nytLogo, width - nytLogo.width, height - nytLogo.height);
}

boolean inScrollRight() {
  return mouseX > width-50 && mouseY > height-nytLogo.height-202 && mouseY < height-nytLogo.height;
}

boolean inScrollLeft() {
  return mouseX < 50 && mouseY > height-nytLogo.height-202 && mouseY < height-nytLogo.height;
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
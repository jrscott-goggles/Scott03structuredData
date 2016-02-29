void drawViz() {
  if (drawState == CHOOSING_GENRE) {
    text("The New York Times Best Sellers", width/2, 100);
    nonFicButton.draw();
    ficButton.draw();
  } else if (drawState == SHOWING_GENRE) {
    JSONArray list;
    if (genre == NONFIC) {
      list = nonFicData;
    } else {
      list = ficData;
    }
    textAlign(CENTER);
    text(listName, width/2, 20);
    text("The bars above each book represent how long they have been on the Best Sellers List", width/2, height - 10);
    if (booksPicked) {
      back.draw();
      for (int i = 0; i < bookButtons.length; ++i) {
        bookButtons[i].draw();
        rectMode(CORNERS);
        fill(i * 255/bookButtons.length);
        rect(bookButtons[i].pos.x, bookButtons[i].pos.y, bookButtons[i].pos.x+128, bookButtons[i].pos.y - map(list.getJSONObject(i).getInt("weeks_on_list"), 0, mostWeeks, 5, 50));
      }
      if (inScrollRight() && bookButtons[bookButtons.length-1].pos.x >= width-128) {
        scrollRight();
      } else if (inScrollLeft() && bookButtons[0].pos.x <= 0) {
        scrollLeft();
      }
      if (bookChosen) {
        image(bookButtons[chosenBook].cover, 30, 50);
        textAlign(LEFT);
        text("Ranking: " + list.getJSONObject(chosenBook).getInt("rank"), 200, 75);
        text("Title: " + list.getJSONObject(chosenBook).getJSONArray("book_details").getJSONObject(0).getString("title"), 200, 95);
        text("Author: " + list.getJSONObject(chosenBook).getJSONArray("book_details").getJSONObject(0).getString("author"), 200, 115);
        text("Weeks on Best Sellers List: " + list.getJSONObject(chosenBook).getInt("weeks_on_list"), 200, 135);
        String isbn10 = "not available";
        String isbn13 = "not available";
        if (!list.getJSONObject(chosenBook).getJSONArray("isbns").isNull(0)) {
          isbn10 = list.getJSONObject(chosenBook).getJSONArray("isbns").getJSONObject(0).getString("isbn10");
          isbn13 = list.getJSONObject(chosenBook).getJSONArray("isbns").getJSONObject(0).getString("isbn13");
          if (isbn10.length() == 0 && !list.getJSONObject(chosenBook).getJSONArray("isbns").isNull(1)) {
            isbn10 = list.getJSONObject(chosenBook).getJSONArray("isbns").getJSONObject(1).getString("isbn10");
          } else if (isbn10.length() == 0) {
            isbn10 = "not available";
          }
          if (isbn13.length() == 0 && !list.getJSONObject(chosenBook).getJSONArray("isbns").isNull(1)) {
            isbn13 = list.getJSONObject(chosenBook).getJSONArray("isbns").getJSONObject(1).getString("isbn13");
          } else if (isbn13.length() == 0) {
            isbn13 = "not available";
          }
        }
        text("ISBN10#: " + isbn10, 200, 175);
        text("ISBN13#: " + isbn13, 200, 195);
      }
    } else {
      displayLoading();
    }
  }
  image(nytLogo, width - nytLogo.width, 0);
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
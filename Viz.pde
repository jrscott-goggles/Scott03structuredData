void drawViz() {
  textAlign(LEFT, TOP);
  text("The New York Times Best Sellers", 10, 0);
  textAlign(CENTER, BOTTOM);
  text("The bars above each book represent how long they have been on the Best Sellers List", width/2, height - 10);
  image(nytLogo, width - nytLogo.width, 0);
  drawGenre(nonFicData, nonFicBookButtons, nonFicChosenBook, 0);
  drawGenre(ficData, ficBookButtons, ficChosenBook, 445);
}

void drawGenre(JSONArray data, ImgButton[] buttons, int chosenBook, int y) {
  textAlign(CENTER, BOTTOM);
  text(data.getJSONObject(0).getString("list_name"), width/2, y + 50);
  for (int i = 0; i < buttons.length; ++i) {
    buttons[i].draw();
    rectMode(CORNERS);
    fill(i * 255/buttons.length);
    rect(buttons[i].pos.x, buttons[i].pos.y, buttons[i].pos.x+128, buttons[i].pos.y - map(data.getJSONObject(i).getInt("weeks_on_list"), 0, mostWeeks, 5, 50));
  }
  if (inScrollRight(buttons) && buttons[buttons.length-1].pos.x >= width-128) {
    scrollRight(buttons);
  } else if (inScrollLeft(buttons) && buttons[0].pos.x <= 0) {
    scrollLeft(buttons);
  }

  image(buttons[chosenBook].cover, 30, y + 50);
  textAlign(LEFT);
  text("Ranking: " + data.getJSONObject(chosenBook).getInt("rank"), 200, y + 75);
  text("Rank Last Week: " + data.getJSONObject(chosenBook).getInt("rank_last_week"), 200, y + 95);
  text("Title: " + data.getJSONObject(chosenBook).getJSONArray("book_details").getJSONObject(0).getString("title"), 200, y + 115);
  text("Author: " + data.getJSONObject(chosenBook).getJSONArray("book_details").getJSONObject(0).getString("author"), 200, y + 135);
  text("Weeks on Best Sellers List: " + data.getJSONObject(chosenBook).getInt("weeks_on_list"), 200, y + 155);
  String isbn10 = "not available";
  String isbn13 = "not available";
  if (!data.getJSONObject(chosenBook).getJSONArray("isbns").isNull(0)) {
    isbn10 = data.getJSONObject(chosenBook).getJSONArray("isbns").getJSONObject(0).getString("isbn10");
    isbn13 = data.getJSONObject(chosenBook).getJSONArray("isbns").getJSONObject(0).getString("isbn13");
    if (isbn10.length() == 0 && !data.getJSONObject(chosenBook).getJSONArray("isbns").isNull(1)) {
      isbn10 = data.getJSONObject(chosenBook).getJSONArray("isbns").getJSONObject(1).getString("isbn10");
    } else if (isbn10.length() == 0) {
      isbn10 = "not available";
    }
    if (isbn13.length() == 0 && !data.getJSONObject(chosenBook).getJSONArray("isbns").isNull(1)) {
      isbn13 = data.getJSONObject(chosenBook).getJSONArray("isbns").getJSONObject(1).getString("isbn13");
    } else if (isbn13.length() == 0) {
      isbn13 = "not available";
    }

    text("ISBN10#: " + isbn10, 200, y + 195);
    text("ISBN13#: " + isbn13, 200, y + 215);
  }
}

boolean inScrollRight(ImgButton[] buttons) {
  return mouseX > width-50 && mouseY > buttons[0].pos.y && mouseY < buttons[0].pos.y + buttons[0].cover.height;
}

boolean inScrollLeft(ImgButton[] buttons) {
  return mouseX < 50 && mouseY > buttons[0].pos.y && mouseY < buttons[0].pos.y + buttons[0].cover.height;
}

void scrollRight(ImgButton[] buttons) {
  for (ImgButton b : buttons) {
    b.pos.x -= 5;
  }
}

void scrollLeft(ImgButton[] buttons) {
  for (ImgButton b : buttons) {
    b.pos.x += 5;
  }
}
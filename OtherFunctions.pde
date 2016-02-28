void prepButtons() {
  nonFicButton = new Button("Non-Fiction", width/2 - width/4, height/2, NONFIC);
  ficButton = new Button("Fiction", width/2 + width/4, height/2, FIC);
}

PImage[] bookPics;

void selectBookPics(JSONArray list) {
  bookPics = new PImage[list.size()];
  for (int i = 0; i < list.size(); ++i) {
    if (!list.getJSONObject(i).getJSONArray("book_details").getJSONObject(0).isNull("book_image")) {
      bookPics[i] = loadImage(list.getJSONObject(i).getJSONArray("book_details").getJSONObject(0).getString("book_image"));
    } else {
      bookPics[i] = loadImage("noImage.jpg");
    }
    bookPics[i].resize(128, 202);
  }
}
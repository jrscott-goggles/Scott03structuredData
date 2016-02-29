void loadData() {
  JSONObject nonFicObj = loadJSONObject(NONFIC_URL + API_KEY);
  JSONObject ficObj = loadJSONObject(FIC_URL + API_KEY);
  nonFicData = nonFicObj.getJSONArray("results");
  ficData = ficObj.getJSONArray("results");
  loadingData = false;
}

void prepButtons() {
  nonFicButton = new Button("Non-Fiction", width/2 - width/4, height/2, NONFIC);
  ficButton = new Button("Fiction", width/2 + width/4, height/2, FIC);
  back = new Button("Back", 0, height - 24, 0);
}

ImgButton[] bookButtons;
boolean booksPicked = false;
int mostWeeks = 0;

void selectBookPics() {
  JSONArray list;
  if (genre == NONFIC) {
    list = nonFicData;
  } else {
    list = ficData;
  }
  bookButtons = new ImgButton[list.size()];
  for (int i = 0; i < list.size(); ++i) {
    PImage cover;
    if (!list.getJSONObject(i).getJSONArray("book_details").getJSONObject(0).isNull("book_image")) {
      cover = loadImage(list.getJSONObject(i).getJSONArray("book_details").getJSONObject(0).getString("book_image"));
    } else {
      cover = loadImage("noImage.jpg");
    }
    cover.resize(128, 202);
    PVector pos = new PVector(cover.width * i, height-nytLogo.height-cover.height);
    bookButtons[i] = new ImgButton(i, cover, pos);
    if (mostWeeks < list.getJSONObject(i).getInt("weeks_on_list")) {
      mostWeeks = list.getJSONObject(i).getInt("weeks_on_list");
    }
  }
  booksPicked = true;
}

void displayLoading() {
  textAlign(CENTER);
  text("LOADING...", width/2, height/2);
}
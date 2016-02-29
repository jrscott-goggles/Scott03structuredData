void loadData() {
  JSONObject nonFicObj = loadJSONObject(NONFIC_URL + API_KEY);
  JSONObject ficObj = loadJSONObject(FIC_URL + API_KEY);
  nonFicData = nonFicObj.getJSONArray("results");
  ficData = ficObj.getJSONArray("results");
  selectBookPics();
  loadingData = false;
}

void selectBookPics() {
  nonFicBookButtons = new ImgButton[nonFicData.size()];
  for (int i = 0; i < nonFicData.size(); ++i) {
    PImage cover;
    if (!nonFicData.getJSONObject(i).getJSONArray("book_details").getJSONObject(0).isNull("book_image")) {
      cover = loadImage(nonFicData.getJSONObject(i).getJSONArray("book_details").getJSONObject(0).getString("book_image"));
    } else {
      cover = loadImage("noImage.jpg");
    }
    cover.resize(128, 202);
    PVector pos = new PVector(cover.width * i, height-nytLogo.height-cover.height-445);
    nonFicBookButtons[i] = new ImgButton(i, cover, pos);
    if (mostWeeks < nonFicData.getJSONObject(i).getInt("weeks_on_list")) {
      mostWeeks = nonFicData.getJSONObject(i).getInt("weeks_on_list");
    }
  }
  
  ficBookButtons = new ImgButton[ficData.size()];
  for (int i = 0; i < ficData.size(); ++i) {
    PImage cover;
    if (!ficData.getJSONObject(i).getJSONArray("book_details").getJSONObject(0).isNull("book_image")) {
      cover = loadImage(ficData.getJSONObject(i).getJSONArray("book_details").getJSONObject(0).getString("book_image"));
    } else {
      cover = loadImage("noImage.jpg");
    }
    cover.resize(128, 202);
    PVector pos = new PVector(cover.width * i, height-nytLogo.height-cover.height);
    ficBookButtons[i] = new ImgButton(i, cover, pos);
    if (mostWeeks < ficData.getJSONObject(i).getInt("weeks_on_list")) {
      mostWeeks = ficData.getJSONObject(i).getInt("weeks_on_list");
    }
  }
}

void displayLoading() {
  textAlign(CENTER);
  text("LOADING...", width/2, height/2);
}
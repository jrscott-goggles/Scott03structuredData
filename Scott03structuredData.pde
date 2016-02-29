//Justin Scott
//Project 2: Structured Data
//Creates an interface that can be used to view data retrieved in JSON fromat from the New York Times Best Sellers List API to compare Non-Fiction and Fiction 

final String NONFIC_URL = "http://api.nytimes.com/svc/books/v2/lists/Combined-Print-and-E-Book-Nonfiction?api-key=";
final String FIC_URL = "http://api.nytimes.com/svc/books/v2/lists/Combined-Print-and-E-Book-Fiction?api-key=";
final String API_KEY = "ca055fddf3ce35d27e1e58471cef20ee:2:74542989"; //API key goes here
PImage nytLogo;

boolean loadingData;

JSONArray nonFicData;
JSONArray ficData;
ImgButton[] nonFicBookButtons;
ImgButton[] ficBookButtons;
int nonFicChosenBook = 0;
int ficChosenBook = 0;

int mostWeeks = 0;

void setup() {
  size(800, 945);
  nytLogo = loadImage("poweredby_nytimes_150c.png");
  loadingData = true;
  thread("loadData");

  textSize(14);
  stroke(255);
}

void draw() {
  background(0);
  if (loadingData) {
    displayLoading();
  } else {
    drawViz();
  }
}

void mousePressed() {
  if (!loadingData) {
    for (int i = 0; i < nonFicBookButtons.length; ++i) {
      if (nonFicBookButtons[i].clicked()) {
        nonFicChosenBook = i;
      }
    }
    for (int i = 0; i < ficBookButtons.length; ++i) {
      if (ficBookButtons[i].clicked()) {
        ficChosenBook = i;
      }
    }
  }
}
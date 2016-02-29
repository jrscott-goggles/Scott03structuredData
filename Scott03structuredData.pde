//Justin Scott
//Project 2: Structured Data
//Creates an interface that can be used to view data retrieved in JSON fromat from the New York Times Best Sellers List API

final String NONFIC_URL = "http://api.nytimes.com/svc/books/v2/lists/Combined-Print-and-E-Book-Nonfiction?api-key=";
final String FIC_URL = "http://api.nytimes.com/svc/books/v2/lists/Combined-Print-and-E-Book-Fiction?api-key=";
final String API_KEY = "ca055fddf3ce35d27e1e58471cef20ee:2:74542989"; //API key goes here

JSONArray nonFicData;
JSONArray ficData;
boolean loadingData;

PImage nytLogo;

int drawState;
final int CHOOSING_GENRE = 0;
final int SHOWING_GENRE = 1;

int genre = 0;
final int NONFIC = 1;
final int FIC = 2;
String listName;

boolean bookChosen;
int chosenBook;

Button nonFicButton;
Button ficButton;
Button back;


void setup() {
  size(800, 500);
  nytLogo = loadImage("poweredby_nytimes_150c.png");
  prepButtons();

  loadingData = true;
  bookChosen = false;
  drawState = CHOOSING_GENRE;
  thread("loadData");  //creates a thread.  it'll load the data and rest of program will run parallel

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
  if (nonFicButton.clicked() && drawState == CHOOSING_GENRE) {
    genre = nonFicButton.type;
    listName = nonFicData.getJSONObject(0).getString("list_name");
    thread("selectBookPics");
    drawState = SHOWING_GENRE;
  } else if (ficButton.clicked() && drawState == CHOOSING_GENRE) {
    genre = ficButton.type;
    listName = ficData.getJSONObject(0).getString("list_name");
    thread("selectBookPics");
    drawState = SHOWING_GENRE;
  } else if (drawState == SHOWING_GENRE && booksPicked) {
    for (int i = 0; i < bookButtons.length; ++i) {
      if (bookButtons[i].clicked()) {
        bookChosen = true;
        chosenBook = i;
      }
      if (back.clicked()) {
        drawState = CHOOSING_GENRE;
        bookChosen = false;
        booksPicked = false;
      }
    }
  }
}
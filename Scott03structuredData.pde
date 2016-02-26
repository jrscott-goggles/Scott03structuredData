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


void loadData() {
  JSONObject nonFicObj = loadJSONObject(NONFIC_URL + API_KEY);
  JSONObject ficObj = loadJSONObject(FIC_URL + API_KEY);
  nonFicData = nonFicObj.getJSONArray("results");
  ficData = ficObj.getJSONArray("results");
  
  println(nonFicData);
  println(ficData);
  loadingData = false;
}

void setup() {
  size(800, 800);
  nytLogo = loadImage("poweredby_nytimes_150c.png");
  loadingData = true;
  drawState = CHOOSING_GENRE;
  thread("loadData");  //creates a thread.  it'll load the data and rest of program will run parallel
}

void draw() {
  background(0);
  if (loadingData) {
    text("LOADING...", width/2, height/2);
  } else {
    drawViz();
  } 
}
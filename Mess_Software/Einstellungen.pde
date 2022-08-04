void setting() {

  textSize(30);
  fill(0);
  reconnect();
  tutorial_zum.hide();

  textSize(20);
  text("Daten speichern", 20, 25);
  text("Strichdicke", 770, 25);
  text(nf(day(), 2, 0) + "." + nf(month(), 2, 0) + "." + nf(year(), 4, 0) + " " + nf(hour(), 2, 0) + ":" + nf(minute(), 2, 0) + ":" + nf(second(), 2, 0), 20, 60);
textFont(bold);
  text("COM-Port", 550, 120);
  textFont(normal);
  text("Auflösung", 20, 250);
  text("Stationen freigeben", 550, 250);
  text("Messzeit Station 3:                        s", 20, 350);


  text("Kalibrierung Station 2.2", 550, 350);
  text("Faktor: ", 550, 420);
    text("Beispiel: 0.5 (kein Komma!) ", 550, 470);
  textSize(16);
  text("nicht wahrnehmbar: 0 - " + 60/float(Kalibrierung_Station2_2) + "\nsehr schwach: " + 60/float(Kalibrierung_Station2_2) + " - " + 3*60/float(Kalibrierung_Station2_2)+ "\nschwach: " + 3*60/float(Kalibrierung_Station2_2) + " - " + 5*60/float(Kalibrierung_Station2_2)+ "\ndeutlich: " + 5*60/float(Kalibrierung_Station2_2) + " - " + 7*60/float(Kalibrierung_Station2_2)+ "\nstark: " + 7*60/float(Kalibrierung_Station2_2) + " - " + 9*60/float(Kalibrierung_Station2_2)+ "\nsehr stark: " + 9*60/float(Kalibrierung_Station2_2) + " - " + 11*60/float(Kalibrierung_Station2_2) + "\nextrem stark: > " +11*60/float(Kalibrierung_Station2_2), 870, 320);
  //new Textfield22(350, 565, 100, 50, Kalibrierung_Station2_2, true);
  textSize(20);

  textAlign(CORNER);
  if (BaselineString[4] == "0000") {
    text("eCO2-Baseline: " + BaselineString[0]  + "\nTVOC-Baseline: " + BaselineString[1], 220, 150);
  } else {
    textAlign(CENTER);
    text("eCO2-Baseline: " + BaselineString[0]  + "\nTVOC-Baseline: " + BaselineString[1] + "\n(gesetzt am " + BaselineString[2] + "." +  BaselineString[3] + "." +  BaselineString[4] + "\num " +  BaselineString[5] + ":" +  BaselineString[6] + " Uhr)", 370, 120);
  }
textAlign(CORNER);
  stroke(0);
  strokeWeight(4);
  line(950, 105 + 30*ausgewaehlterPort, 1050, 105 + 30*ausgewaehlterPort);
  line(950, 105 + 30*ausgewaehlterPort, 975, 95 + 30*ausgewaehlterPort);
  line(950, 105 + 30*ausgewaehlterPort, 975, 115 + 30*ausgewaehlterPort);

  if (Aufloesung.name == "Niedrig (800x450)") {
    scale_factor = 0.625;
    surface.setSize(800, 450);
  } else if (Aufloesung.name == "Mittel (1024x600)") {
    scale_factor = 0.8;
    surface.setSize(1024, 600);
  } else if (Aufloesung.name == "Standard (1280x720)") {
    scale_factor = 1;
    surface.setSize(1280, 720);
  } else if (Aufloesung.name == "Hoch (1440x810)") {
    scale_factor = 1.125;
    surface.setSize(1440, 810);
  } else if (Aufloesung.name == "Fullscreen") {
    float w = displayWidth;
    float h = displayHeight - 75;

    float frac = w/h;

    if (frac > 1.7777) {
      w = 1.777*h;
    } else if (frac <= 1.7777) {
      h = w/1.777;
    }

    scale_factor = w/1280;
    surface.setSize(floor(w), floor(h));
  }
  strokeWeight(1);
  stroke(0);
  line(0, 90, 1280, 90);
  line(0, 220, 1280, 220);
  line(0, 300, 1280, 300);
  line(0, 490, 1280, 490);
  line(530, 90, 530, 490);
  autosave.show();
  dateiformat.show();

  Aufloesung.show();
  // connect.show();
  // error_bars.show();
  freie_stationen.show();
  setBaseline.show();
  strichdicke.show();
    Kalibrierung2_2.show(Kalibrierung_Station2_2);
  Zeit_Station3.show(Kalibrierung_Station3);
}
float aufloesung_index = 0;
float scale_factor = 1;

void reconnect() {
  textSize(20);
  for (int i = 0; i < Serial.list().length; i++) {
    text("COM [" + Serial.list()[i] + "]", 700, 120 + 30*i);
  }
}

float scroll = 0;

//void mouseWheel(MouseEvent event){
//  scroll -= event.getCount()*10;
//  if(scroll < -300){
//   scroll = -300; 
//  }
//  if(scroll > 0){
//   scroll = 0; 
//  }
//}





class Aufgabentext {
  String text;
  float breite, x, y, hoehe;
  String[] newText = new String[100];


  Aufgabentext(String text_, float x_, float y_, float breite_, float hoehe_) {
    text = text_;
    breite = breite_;
    hoehe = hoehe_;
    x = x_;
    y = y_;
    newText = split(text, " ");

    float len = 0;
    for (int i = 0; i < newText.length; i++) {
      len = len + 2*textWidth(newText[i]);

      if (len > breite - 90) {
        len = 0;
        newText[i] = newText[i] + "\n";
      }
    }
    text = "";
    for (int i = 0; i < newText.length; i++) {
      if (newText[i] != "\n") {
        text += newText[i] + " ";
      } else {
        text += newText[i];
      }
    }
  }


  void show() {
    // 1. Box mit abgerundeten Ecken
    fill(150, 150, 255, 100);
    noStroke();
    bezierRect(x, y, breite, hoehe, 5, 5);
    fill(0);

    // Aufzählungszeichen
    stroke(0);
    beginShape();
    fill(255);
    vertex(x + 30, y + 22);
    vertex(x + 45, y + 27);
    vertex(x + 35, y + 27);
    vertex(x + 30, y + 22);    
    endShape();
    beginShape();
    fill(0);
    vertex(x + 30, y + 32);
    vertex(x + 45, y + 27);
    vertex(x + 35, y + 27);
    vertex(x + 30, y + 32);    
    endShape();

    noStroke();
    fill(0);
    textSize(20);
    text(text, x + 60, y + 35);
  }
}


void bezierRect(float x, float y, float w, float h, float xr, float yr) {
  float w2=w/2f, h2=h/2f, cx=x+w2, cy=y+h2;
  beginShape();
  vertex(cx, cy-h2);
  bezierVertex(cx+w2-xr, cy-h2, cx+w2, cy-h2+yr, cx+w2, cy);
  bezierVertex(cx+w2, cy+h2-yr, cx+w2-xr, cy+h2, cx, cy+h2);
  bezierVertex(cx-w2+xr, cy+h2, cx-w2, cy+h2-yr, cx-w2, cy);
  bezierVertex(cx-w2, cy-h2+yr, cx-w2+xr, cy-h2, cx, cy-h2);
  endShape();
}

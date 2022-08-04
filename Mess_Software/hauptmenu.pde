boolean[] connected = {false, false, false};


void hauptmenu() {
  stroke(0);
  one.show();
  two.show();
  four.show();
  three.show();


  two_a.hide();
  two_b.hide();

  fill(0);
  textSize(20);
  strokeWeight(5);
  noFill();

  zumObermenu2.hide();
  if (one.isOver()) {
    strokeWeight(2);
    fill(0);
    textFont(bold);
    text("Station 1.2 - Die Sensoren testen", 600, 50);
    strokeWeight(1);
    textFont(normal);
    noStroke();
    text("Führe verschiedene Tests durch, um die Funktion zu\ntesten!", 600, 120);

    image(Vorschau_Station1, 600, 200);
  }


  if (four.isOver()) {
    strokeWeight(2);
    fill(0);
    textFont(bold);
    text("Station 4.2 - Kreidestaub", 600, 50);
    strokeWeight(1);
    textFont(normal);
    noStroke();
    text("Sollte man die Schultafel lieber nass abwischen? Unter-\nsuche die Feinstaubemission von trockenen und nassen\nSchwämmen!", 600, 120);
    imageMode(CENTER);
    image(Aufbau_Feinstaub_Vorschau, 900, 415);
  }

  if (two.isOver()) {
    fill(0);
    textSize(20);
    stroke(0);
    strokeWeight(2);
    textFont(bold);
    text("Station 2.1 - Ich rieche was, was du nicht riechst", 600, 50);
    text("Station 2.2 - TVOC-Duelle", 600, 450);
    strokeWeight(1);
    textFont(normal);
    noStroke();
    text("Wie gut ist eure Nase?\nFindet es heraus und tretet gegen\neinen Sensor an.\n\nOrdnet 5 verschiedene Ethanolkon-\nzentrationen der Größe\nnach an.", 600, 120);
    textFont(bold);
    textFont(normal);
    text("Untersuche Alltagsgegenstände auf\nihre Emission von Schadstoffen.\n\nHalten Alternativen, was sie versprechen?", 600, 520);
    image(Vorschau_Station2, 1010, 100);
    image(Stoff1_bild, 1020, 540);
    image(Stoff2_bild, 1160, 540);
    textSize(40);
    text("vs.", 1120, 605);
    textSize(20);
    image(blauer_engel, 1025, 420);
    image(blauer_engel, 1160, 420);
    strokeWeight(4);
    stroke(255, 0, 0);
    line(1020, 420, 1120, 520);
    line(1120, 420, 1020, 520);
    noStroke();
    strokeWeight(1);
  }


  if (three.isOver()) {
    strokeWeight(2);
    textFont(bold);
    text("Station 3.2 - Bitte lüften", 600, 50);
    strokeWeight(1);
    textFont(normal);
    noStroke();
    text("Setze dich in eine Messkammer, und untersuche, wie sich\ndie Luftqualität ändert.", 600, 120);
    image(Vorschau_Station3, 750, 200);
  }
  strokeWeight(3);
  stroke(0);
  line(520, 0, 520, 720);
  zumObermenu2.y = 650;
  if (zumObermenu2.isClicked()) {
    delay(200);
    page = 1;
  }
  zumObermenu.y = 650;
}

int[] y_scale = {0, 0};
int[] y_scale1 = {0, 0};
int[] y_scale2 = {0, 0};
int x_scale = 0;
float gesamtzeit_station1 = 150;
boolean ersterStart_Station1 = false;

void Feinstaub1() {
  up1.hide();
  down1.hide();
  up2.hide();
  down2.hide();
  left1.hide();
  right1.hide();
  reset.hide();
  station1_MessungStarten.hide();
  aktualisierung_right.hide();
  aktualisierung_left.hide();
  fill(0);
  textSize(20);
  textFont(bold);
  text("Station 4.2 - Kreidestaub", 20, 50);
  textFont(normal);
  text("In diesem Versuch werdet ihr die Feinstaubemission beim Schreiben mit Kreide und anschließendem Wischen untersuchen.", 20, 100);
  Feinstaub_weiter.show();
  imageMode(CENTER);
  image(Aufbau_Feinstaub, 640, 400);
  textAlign(CENTER);

  stroke(0);
  fill(255);
  rect(95, 185, 155, 30);
  rect(45, 460, 210, 60);
  rect(1015, 185, 200, 30);
  rect(1000, 418, 240, 60);





  fill(0);


  text("Zwei Kreidearten\nsind zu untersuchen.", 150, 480);
  text("Es soll trocken und nass\ngewischt werden.", 1120, 440);
  text("Kleine Schreibtafel", 1115, 207);
  text("Sensorboard", 170, 207);
  stroke(0);

  line(255, 480, 440, 480);
  line(255, 480, 470, 550);

  line(850, 550, 1000, 450);
  line(850, 450, 1000, 450);

  line(750, 200, 1015, 200);

  line(250, 205, 580, 440);
  //stroke(0);
  //fill(255);
  //rect(100, 150, 980, 500);
  //fill(0);
  //textSize(40);
  //text("Platzhalter", 550, 300);

  if (FeinstaubAbgeschlossen) {
    zurAuswertung_Feinstaub.show();
  }

  if (zurAuswertung_Feinstaub.isClicked()) {
    page = 1.91111; 
    zurAuswertung_Feinstaub.hide();
  }

  ////////////////// HIER NACH ABSCHLUSS DES VERSUCHS EIN "Zur Auswertung" Button erscheinen lassen!!!!! ///////////////////////////////////////////////////////////
}
void Feinstaub2() {

  fill(255);
  stroke(0);
  rect(10, 75, 820, 108);
  fill(0);
  textSize(20);
  textFont(bold);
  text("Station 4.2 - Kreidestaub", 20, 50);
  text("Bevor es losgeht", 20, 100); 
  textFont(normal);
  text("Fädelt das Board an den Füßen durch die Schlaufen der Tafel. Achtet dabei darauf,\ndass die Öffnung des Feinstaubsensors in Richtung der Tafel zeigt:", 20, 140); 


  Feinstaub_weiter.show();

  image(Feinstaub_Oeffnung, 900, 75);
  image(Feinstaub_Einfaedeln1, 300, 330);
  image(Feinstaub_Einfaedeln2, 780, 330);


  stroke(0);
  strokeWeight(3);
  line(830, 224, 1050, 224);
  line(1050, 224, 1050, 180);

  line(550, 490, 760, 490);
  line(750, 480, 760, 490);
  line(760, 490, 750, 500);


  strokeWeight(1);
  fill(255);
  rect(500, 205, 330, 38);
  rect(590, 438, 115, 30);
  fill(0);
  text("Öffnung des Feinstaubsensors", 515, 230);
  text("Einfädeln", 605, 460);
}
void Feinstaub3() {
  textSize(20);
  fill(0);
  text("Der Messvorgang dauert 5 x 30s und sieht für beide Kreidearten folgendermaßen aus.", 20, 50);

  fill(255);
  stroke(0);
  rect(150, 150, 980, 400);
  strokeWeight(3);
  line(150, 570, 1130, 570);
  textAlign(CENTER);
  fill(0);
  for (int i = 0; i < 5; i++) {
    strokeWeight(1);
    line(346 + 196*i, 150, 346 + 196*i, 550); 
    strokeWeight(3);
    line(155 + 196*i, 565, 150 + 196*i, 570);
    line(155 + 196*i, 575, 150 + 196*i, 570);

    line(341 + 196*i, 565, 346 + 196*i, 570);
    line(341 + 196*i, 575, 346 + 196*i, 570);

    text("30 s", 253 + 196*i, 600);
  }

  pushMatrix();
  translate(width/2, height/2);
  rotate(3*PI/2);
  text("Feinstaub PM2.5", height/2 -370, -width/2 + 100);  
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(PI/2);
  text("Feinstaub PM10", -height/2 +370, width/2 - 1170);
  popMatrix();

  textSize(18);
  text("Die Messung beginnt\nmit einer Einlauf-\nphase.\n\nHier ist nichts zu\ntun, außer zu warten.", 250, 300);
  Feinstaub_weiter.show();
}
void Feinstaub4() {
  Feinstaub3();
  textAlign(CENTER);
  textSize(18);
  text("Schreibt anschließend\nmit der Kreide\n''munter drauf los''.", 445, 180);
}
void Feinstaub5() {
  Feinstaub4();

  textAlign(CENTER);
  textSize(18);
  text("Dann wird erst\ntrocken gewischt...", 641, 280);
}
void Feinstaub6() {
  Feinstaub5();

  textAlign(CENTER);
  textSize(18);
  text("... ehe noch einmal\nordentlich\ngekritzelt wird.", 837, 350);
}
void Feinstaub7() {
  Feinstaub6();

  textAlign(CENTER);
  textSize(18);
  text("Schließlich wird die\nTafel nass gewischt.", 1033, 440);
}

void Feinstaub8() {
  Feinstaub7();
  stroke(0, 0, 255);
  // line(100, 100, 1180, 100);
  strokeWeight(4);
  line(100, 100, 290, 100);
  line(1180, 100, 990, 100);
  line(100, 100, 100, 270);

  line(95, 265, 100, 270);
  line(100, 270, 105, 265);

  line(1180, 100, 1180, 270);
  line(1175, 265, 1180, 270);
  line(1180, 270, 1185, 265);
  fill(0);
  textAlign(CENTER);
  textSize(20);
  text("Beachtet noch: Es werden Partikel verschiedener Größe gemessen.", 640, 105);
}


void Feinstaub9() {
  Feinstaub_weiter.show();
  fill(0);
  textSize(20);
  textAlign(CENTER);
  text("Beginnt bitte mit der gewöhnlichen Schulkreide.", 640, 200);
  imageMode(CENTER);
  image(KreideA, 640, 300);
}


void Feinstaub10() {
  Feinstaub_KreideA();
}

void Feinstaub11() {
  textSize(20);
  fill(0);
  textAlign(CENTER);
  text("Bevor es mit dem Kreidestift weiter geht...", 640, 100);
  imageMode(CENTER);
  text("...säubert so gut es geht Tafel, Schwamm und Tuch.", 640, 220);
  text("Ohne Kreidereste\nund trocken", 320, 650);
  text("ordentlich ausklopfen\n(z.B. am Fenster)", 640, 650);
  text("Waschen und\ngut auswirgen", 960, 650);
  image(Tafel, 320, 450);
  image(nasserSchwamm, 960, 450);
  image(trockenerSchwamm, 640, 450);
  image(KreideB, 640, 150);
  Feinstaub_weiter.show();
}

boolean Station1_trocken_Start = false;


void Feinstaub_KreideB() {
  //Welche Graphen sollen angezeigt werden?
  up1.show();
  down1.show();
  zumObermenu.y = 605;
  up2.show();
  down2.show();
  Feinstaub_weiter.y = 385;
  Feinstaub_weiter.size = 16;
  Feinstaub_weiter.text = "zur Auswertung";
  // println(page);
  strokeWeight(1);
  fill(0);
  textSize(20);
  reset.hide();
  fill(0);
  noStroke();

  // Zeichne den Hintergrund
  fill(255);
  stroke(0);
  rect(145, 165, 780, 450);
  fill(230);
  rect(1080, -1, 200, 720);
  stroke(0, 50);
  textSize(16);
  fill(0);
  textAlign(CENTER);
  text("Einlaufen", 223, 130);
  text("Tafel beschriften", 379, 130);
  text("Tafel wischen\n(trocken)", 535, 125);
  text("Tafel beschriften", 691, 130);
  text("Tafel wischen\n(nass)", 847, 125);
  textAlign(CORNER);
  stroke(100, 100);
  if (y_scale[0] != 0 || y_scale[1] != 0) {
    for (int i = 0; i < 4; i++) {
      line(145, 255 + 90*i, 925, 255 + 90*i);
    }
  }

  if (up1.isClicked()) {
    y_scale[0] += 1;
    if (y_scale[0] > 7) {
      y_scale[0] = 0;
    }
  }

  if (down1.isClicked()) {
    y_scale[0] -= 1;
    if (y_scale[0] < 0) {
      y_scale[0] = 7;
    }
  }



  if (up2.isClicked()) {
    y_scale[1] += 1;
    if (y_scale[1] > 7) {
      y_scale[1] = 0;
    }
  }

  if (down2.isClicked()) {
    y_scale[1] -= 1;
    if (y_scale[1] < 0) {
      y_scale[1] = 7;
    }
  }

  fill(255);
  stroke(0);
  //rect(470, 20, 130, 50);
  image(KreideB, 400, 60);
  rect(1105, 155, 155, 80);



  float maxPM25 = 0;
  float minPM25 = 99999999;

  float maxPM10 = 0;
  float minPM10 = 99999999;
  textSize(16);

  if (indexStation1_trocken > 0) {
    textAlign(LEFT);
    fill(255, 0, 0);
    text("Aktueller Wert: (" + round(Station1_PM25_trocken[indexStation1_trocken-1]) + " +/- 10 µg/m³)", 145, 50);
    textAlign(RIGHT);
    fill(0, 0, 255);
    text("Aktueller Wert: (" + round(Station1_PM10_trocken[indexStation1_trocken-1]) + " +/- 10 µg/m³)", 925, 50);
  }
  textAlign(CORNER);
  textSize(20);
  fill(255, 0, 0);
  if (y_scale[0] == 0) {
    maxPM25 = max(Station1_PM25_trocken);
    minPM25 = min(Station1_PM25_trocken);
    if (maxPM25 != 0) {
      text(nf(maxPM25, 0, 1), 80, 175);
      text(nf(minPM25, 0, 1), 80, 625);
    }
  } else if (y_scale[0] == 1) {
    maxPM25 = 10;
    minPM25 = 0;
  } else if (y_scale[0] == 2) {
    maxPM25 = 50;
    minPM25 = 0;
  } else if (y_scale[0] == 3) {
    maxPM25 = 100;
    minPM25 = 0;
  } else if (y_scale[0] == 4) {
    maxPM25 = 200;
    minPM25 = 0;
  } else if (y_scale[0] == 5) {
    maxPM25 = 500;
    minPM25 = 0;
  } else if (y_scale[0] == 6) {
    maxPM25 = 1000;
    minPM25 = 0;
  } else if (y_scale[0] == 7) {
    maxPM25 = 2000;
    minPM25 = 0;
  }
  fill(0, 0, 255);
  if (y_scale[1] == 0) {
    maxPM10 = max(Station1_PM10_trocken);
    minPM10 = min(Station1_PM10_trocken);
    if (maxPM10 != 0) {
      text(nf(maxPM10, 0, 1), 960, 175);
      text(nf(minPM10, 0, 1), 960, 625);
    }
  } else if (y_scale[1] == 1) {
    maxPM10 = 10;
    minPM10 = 0;
  } else if (y_scale[1] == 2) {
    maxPM10 = 50;
    minPM10 = 0;
  } else if (y_scale[1] == 3) {
    maxPM10 = 100;
    minPM10 = 0;
  } else if (y_scale[1] == 4) {
    maxPM10 = 200;
    minPM10 = 0;
  } else if (y_scale[1] == 5) {
    maxPM10 = 500;
    minPM10 = 0;
  } else if (y_scale[1] == 6) {
    maxPM10 = 1000;
    minPM10 = 0;
  } else if (y_scale[1] == 7) {
    maxPM10 = 2000;
    minPM10 = 0;
  }


  fill(255, 0, 0);
  if (y_scale[0] != 0) {
    for (int i = 0; i < 6; i++) {
      text(round(i*maxPM25/5), 80, 625- 90*i);
    }
  }
  fill(0, 0, 255);
  if (y_scale[1] != 0) {
    for (int i = 0; i < 6; i++) {
      text(round(i*maxPM10/5), 960, 625- 90*i);
    }
  }


  //rect(145, 165, 780, 450);
  stroke(255, 0, 0);
  strokeWeight(3);
  for (int i = 1; i < 500; i++) {
    if (Station1_PM25_trocken[i] != 0) {
      float x1 = 145 + 780*(Station1_zeit_trocken[i]-Station1_zeit_trocken[0])/150;
      float x2 = 145 + 780*(Station1_zeit_trocken[i-1]-Station1_zeit_trocken[0])/150;
      float y1 = 615 - 450*(Station1_PM25_trocken[i] - minPM25)/(maxPM25 - minPM25);
      float y2 = 615 - 450*(Station1_PM25_trocken[i-1] - minPM25)/(maxPM25 - minPM25);

      float e1 = 615 - 615*(Station1_PM25_trocken[i] - 10 - minPM25)/(maxPM25-minPM25);
      float e2 = 615- 615*(Station1_PM25_trocken[i] + 10 - minPM25)/(maxPM25-minPM25);
      if (x1 >=145 && x2 >= 145 && x1 <= 925 && x2 <= 925 && y1 >=165 && y2 >= 165) {
        strokeWeight(3);
        if (verbinde.checked) {
          line(x1, y1, x2, y2);
        } else {
          line(x2-5, y2, x2+5, y2);
          line(x2, y2-5, x2, y2+5);
        }
        if (fehler.checked) {
          if (e1 < 165) {
            e1 = 165;
          }
          if (e1 > 615) {
            e1 = 615;
          }
          if (e2 < 165) {
            e2 = 165;
          }
          if (e2 > 615) {
            e2 = 615;
          }
          strokeWeight(1);
          line(x1, e1, x1, e2);
          line(x1-2, e1, x1+2, e1);
          line(x1-2, e2, x1+2, e2);
        }
      }
    }
  }


  stroke(0, 0, 255);
  for (int i = 1; i < 500; i++) {
    if (Station1_PM10_trocken[i] != 0) {
      float x1 = 145 + 780*(Station1_zeit_trocken[i]-Station1_zeit_trocken[0])/150;
      float x2 = 145 + 780*(Station1_zeit_trocken[i-1]-Station1_zeit_trocken[0])/150;
      float y1 = 615 - 450*(Station1_PM10_trocken[i] - minPM10)/(maxPM10 - minPM10);
      float y2 = 615 - 450*(Station1_PM10_trocken[i-1] - minPM10)/(maxPM10 - minPM10);
      float e1 = 615 - 615*(Station1_PM10_trocken[i] - 10 - minPM10)/(maxPM10-minPM10);
      float e2 = 615- 615*(Station1_PM10_trocken[i] + 10 - minPM10)/(maxPM10-minPM10);
      if (x1 > 925) {
        x1 = 925;
      }
      if (x1 >=145 && x2 >= 145 && x1 <= 925 && x2 <= 925 && y1 >=165 && y2 >= 165) {
        strokeWeight(3);
        if (verbinde.checked) {
          line(x1, y1, x2, y2);
        } else {
          line(x2-5, y2, x2+5, y2);
          line(x2, y2-5, x2, y2+5);
        }
        if (fehler.checked) {
          if (e1 < 165) {
            e1 = 165;
          }
          if (e1 > 615) {
            e1 = 615;
          }
          if (e2 < 165) {
            e2 = 165;
          }
          if (e2 > 615) {
            e2 = 615;
          }
          strokeWeight(1);
          line(x1, e1, x1, e2);
          line(x1-2, e1, x1+2, e1);
          line(x1-2, e2, x1+2, e2);
        }
      }
    }
  }
  strokeWeight(1);
  //rect(145, 165, 780, 450);
  fill(255, 200, 200, 50);
  noStroke();
  if (indexStation1_trocken > 0) {
    if ((Station1_zeit_trocken[indexStation1_trocken-1] -Station1_zeit_trocken[0]) < 30) {
      rect(145, 165, 156, 450);
    } else if ((Station1_zeit_trocken[indexStation1_trocken-1] - Station1_zeit_trocken[0])  > 30 && (Station1_zeit_trocken[indexStation1_trocken-1] - Station1_zeit_trocken[0]) < 60) {
      rect(301, 165, 156, 450);
    } else if ((Station1_zeit_trocken[indexStation1_trocken-1] - Station1_zeit_trocken[0])  > 60 && (Station1_zeit_trocken[indexStation1_trocken-1] - Station1_zeit_trocken[0]) < 90) {
      rect(457, 165, 156, 450);
    } else if ((Station1_zeit_trocken[indexStation1_trocken-1] - Station1_zeit_trocken[0])  > 90 && (Station1_zeit_trocken[indexStation1_trocken-1] - Station1_zeit_trocken[0]) < 120) {
      rect(613, 165, 156, 450);
    } else if ((Station1_zeit_trocken[indexStation1_trocken-1] -Station1_zeit_trocken[0])  > 120 && (Station1_zeit_trocken[indexStation1_trocken-1] - Station1_zeit_trocken[0]) < 150) {
      rect(769, 165, 156, 450);
    } else {
      Feinstaub_weiter.show();
    }
    if ((Station1_zeit_trocken[indexStation1_trocken-1] - Station1_zeit_trocken[0]) > 149) {
      Feinstaub_weiter.show();
      Station1_trocken_Start = false;
      KreideBAbgeschlossen = true;
      station1_MessungWiederholen.show();
      station1_MessungWiederholen.text = "Messung\nwiederholen";
    } else {
      station1_MessungWiederholen.show();
      station1_MessungWiederholen.text = "Messung\nneu starten";
    }
  } else {
    station1_MessungWiederholen.hide();
  }
  if (indexStation1_trocken == 0) {
    station1_MessungStarten.show();
  } else {
    station1_MessungStarten.hide();
  }

  if (KreideBAbgeschlossen) {
    Feinstaub_weiter.show();
  } else {
    Feinstaub_weiter.hide();
  }

  if (freie_stationen.name == "freigeben") {
    Feinstaub_weiter.show();
  }
  Feinstaub_weiter.size = 20;
  // graphFeinstaub(Station1_PM25, 1, "Feinstaub PM2.5 in μg/m³", x_scale, y_scale, true);
  // graphFeinstaub(Station1_PM10, 1, "Feinstaub PM10 in μg/m³", x_scale, y_scale, false);


  pushMatrix();
  translate(width/2, height/2);
  rotate(3*PI/2);
  fill(255, 0, 0);
  text("Feinstaub PM2.5", height/2 -470, -width/2 + 50);  
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(PI/2);
  fill(0, 0, 255);
  text("Feinstaub PM10", -height/2 +320, width/2 - 1035);
  popMatrix();


  fill(0);
  textSize(20);
  textAlign(CENTER);
  text("0", 145, 660);
  text("30", 301, 660);
  text("60", 455, 660);
  text("90", 615, 660);
  text("120", 766, 660);
  text("150", 925, 660);
  stroke(0);
  // rect(145, 165, 780, 450);
  for (int i = 0; i < 4; i++) {
    line(301 + 156*i, 165, 301 + 156*i, 615);
  }



  textSize(20);
  text("Zeit in Sekunden", 530, 700);
  fill(0);
  textAlign(CENTER);

  textAlign(CORNER);
  two_b.hide();
  two_a.hide();
  Geruchstest.hide();
  fill(0);
  noStroke();
  textSize(24);
  text("Optionen", 1120, 30);
  fill(240);
  stroke(0);
  rect(1105, 450, 155, 140);
  fill(0);
  noStroke();
  textSize(20);
  textAlign(CENTER);
  if (del == 0) {
    text("Messintervall", 1185, 480);
    text("Maximum", 1190, 565);
  } else {
    text("Messintervall", 1185, 480);
    text(nf(del, 0, 0) + " s", 1185, 565);
  }
  textSize(13);
  text("Messunsicherheit", 1165, 180);
  textSize(16);
  text("verbinden", 1165, 220);
  textAlign(CORNER);
  back.show();
  aktualisierung_right.show();
  aktualisierung_left.show();
  verbinde.show();
  fehler.show();

  if (fehler.checked) {
    error_bars.name = "anzeigen";
  } else {
    error_bars.name = "nicht anzeigen";
  }
  if (verbinde.checked) {
    connect.name = "verbinden";
  } else {
    connect.name = "nicht verbinden";
  }
}


boolean FeinstaubAbgeschlossen = false;


void Feinstaub13() {
  textSize(20);
  fill(0);
  textAlign(CENTER);
  text("Säubert bitte erneut Tafel, Schwamm und Tuch, so gut es geht.", 640, 100);
  imageMode(CENTER);
  text("Ohne Kreidereste\nund trocken", 320, 550);
  text("ordentlich ausklopfen\n(z.B. am Fenster)", 640, 550);
  text("Waschen und\ngut auswirgen", 960, 550);
  image(Tafel, 320, 320);
  image(nasserSchwamm, 960, 320);
  image(trockenerSchwamm, 640, 320);
  //  image(KreideB, 640, 150);
  FeinstaubAbgeschlossen = true;
  Feinstaub_weiter.show();
  zumObermenu2.hide();
}

void Feinstaub14() {

  verbinde.x = 690;
  fehler.x = 690;
  verbinde.y = 350;
  fehler.y = 400;

  verbinde.show();
  fehler.show();
  image(KreideA, 230, 70);
  image(KreideB, 827, 80);
  textSize(20);
  fill(0);
  textAlign(CENTER);
  text("Entnehmt in den einzelnen Phasen die maximalen Werte und tragt diese in die Tabelle in der Broschüre ein.", 640, 50);
  text("verbinden", 630, 370);
  text("Messun-\nsicherheit", 630, 410);
  fill(255);
  stroke(0);
  rect(100, 200, 450, 350);
  rect(740, 200, 450, 350);

  for (int i = 0; i < 5; i++) {
    line(190 + 90*i, 200, 190 + 90*i, 550);
    line(830 + 90*i, 200, 830 + 90*i, 550);
  }
  pushMatrix();
  translate(width/2, height/2);
  rotate(3*PI/2);
  fill(255, 0, 0);
  //text("Feinstaub PM2.5", height/2 -370, -width/2 + 25);  
  //text("Feinstaub PM2.5", height/2 -370, -width/2 + 660);  
  popMatrix();
  fill(255, 0, 0);
  text("Feinstaub PM2.5", 640, 100);  
  pushMatrix();
  translate(width/2, height/2);
  rotate(PI/2);
  fill(0, 0, 255);
  //text("Feinstaub PM10", -height/2 +370, width/2 - 600);
  //text("Feinstaub PM10", -height/2 +370, width/2 - 1240);
  popMatrix();
  fill(0, 0, 255);
  text("Feinstaub PM10", 640, 140);
  textSize(14);
  fill(0);
  textAlign(CENTER);
  text("Einlaufen", 145, 180);
  text("Beschriften 1", 235, 180);
  text("Trocken\nwischen", 325, 170);
  text("Beschriften 2", 415, 180);
  text("Nass\nwischen", 505, 170);

  text("Einlaufen", 145 + 640, 180);
  text("Beschriften 1", 235 + 640, 180);
  text("Trocken\nwischen", 325 + 640, 170);
  text("Beschriften 2", 415 + 640, 180);
  text("Nass\nwischen", 505 + 640, 170);




  //  rect(100, 200, 450, 350);
  //  rect(740, 200, 450, 350);

  stroke(200);
  if (y_scale[0] != 0 || y_scale[1] != 0) {
    for (int i = 0; i < 4; i++) {
      line(100, 270 + 70*i, 550, 270 + 70*i);
      line(740, 270 + 70*i, 1190, 270 + 70*i);
    }
  }
  up_Feinstaub1.show();
  down_Feinstaub1.show();
  stroke(0);
  if (up_Feinstaub1.isClicked()) {
    y_scale[1] += 1;
    if (y_scale[1] > 7) {
      y_scale[1] = 0;
    }
  }

  if (down_Feinstaub1.isClicked()) {
    y_scale[1] -= 1;
    if (y_scale[1] < 0) {
      y_scale[1] = 7;
    }
  }

  float min = 0;
  float max = 100;


  if (y_scale[1] == 0) {
    max = max(Station1_PM10);
  } else if (y_scale[1] == 1) {
    max = 10;
  } else if (y_scale[1] == 2) {
    max = 50;
  } else if (y_scale[1] == 3) {
    max = 100;
  } else if (y_scale[1] == 4) {
    max = 200;
  } else if (y_scale[1] == 5) {
    max = 500;
  } else if (y_scale[1] == 6) {
    max = 1000;
  } else if (y_scale[1] == 7) {
    max = 2000;
  }
  textAlign(CENTER);
  text("µg/m³", 65, 165);
  text("µg/m³", 1230, 165);
  if (y_scale[1] != 0) {
    for (int i = 0; i < 6; i++) {
      text(round(i*max/5), 60, 555- 70*i);
      text(round(i*max/5), 1225, 555- 70*i);
    }
  } else {
    text(nf(max, 0, 1), 60, 200);
    text(nf(max, 0, 1), 1225, 200);
    text("0", 60, 555);
    text("0", 1225, 555);
  }
  /////////
  //rect(740, 200, 450, 350);
  stroke(0, 0, 255);
  for (int i = 1; i < 500; i++) {
    if (Station1_PM10_trocken[i] != 0) {
      float x1 = 740 + 450*(Station1_zeit_trocken[i]-Station1_zeit_trocken[0])/150;
      float x2 = 740 + 450*(Station1_zeit_trocken[i-1]-Station1_zeit_trocken[0])/150;
      float y1 = 550 - 350*(Station1_PM10_trocken[i] - min)/(max - min);
      float y2 = 550 - 350*(Station1_PM10_trocken[i-1] - min)/(max - min);
      float e1 = 550 - 350*(Station1_PM10_trocken[i] - 10 - min)/(max-min);
      float e2 = 550- 350*(Station1_PM10_trocken[i] + 10 - min)/(max-min);
      if (x1 > 1190) {
        x1 = 1190;
      }
      if (x1 >=740 && x2 >= 740 && x1 <= 1190 && x2 <= 1190 && y1 >= 200 && y2 >= 200) {
        strokeWeight(3);
        if (verbinde.checked) {
          line(x1, y1, x2, y2);
        } else {
          line(x2-5, y2, x2+5, y2);
          line(x2, y2-5, x2, y2+5);
        }
        if (fehler.checked) {
          if (e1 < 200) {
            e1 = 200;
          }
          if (e1 > 550) {
            e1 = 550;
          }
          if (e2 < 200) {
            e2 = 200;
          }
          if (e2 > 550) {
            e2 = 550;
          }
          strokeWeight(1);
          line(x1, e1, x1, e2);
          line(x1-2, e1, x1+2, e1);
          line(x1-2, e2, x1+2, e2);
        }
      }
    }
  }
  ////////////////////
  stroke(255, 0, 0);
  for (int i = 1; i < 500; i++) {
    if (Station1_PM25_trocken[i] != 0) {
      float x1 = 740 + 450*(Station1_zeit_trocken[i]-Station1_zeit_trocken[0])/150;
      float x2 = 740 + 450*(Station1_zeit_trocken[i-1]-Station1_zeit_trocken[0])/150;
      float y1 = 550 - 350*(Station1_PM25_trocken[i] - min)/(max - min);
      float y2 = 550 - 350*(Station1_PM25_trocken[i-1] - min)/(max - min);
      float e1 = 550 - 350*(Station1_PM25_trocken[i] - 10 - min)/(max-min);
      float e2 = 550- 350*(Station1_PM25_trocken[i] + 10 - min)/(max-min);
      if (x1 > 1190) {
        x1 = 1190;
      }
      if (x1 >=740 && x2 >= 740 && x1 <= 1190 && x2 <= 1190 && y1 >= 200 && y2 >= 200) {
        strokeWeight(3);
        if (verbinde.checked) {
          line(x1, y1, x2, y2);
        } else {
          line(x2-5, y2, x2+5, y2);
          line(x2, y2-5, x2, y2+5);
        }
        if (fehler.checked) {
          if (e1 < 200) {
            e1 = 200;
          }
          if (e1 > 550) {
            e1 = 550;
          }
          if (e2 < 200) {
            e2 = 200;
          }
          if (e2 > 550) {
            e2 = 550;
          }
          strokeWeight(1);
          line(x1, e1, x1, e2);
          line(x1-2, e1, x1+2, e1);
          line(x1-2, e2, x1+2, e2);
        }
      }
    }
  }
  ///////////////////
  stroke(0, 0, 255);
  for (int i = 1; i < 500; i++) {
    if (Station1_PM10[i] != 0) {
      float x1 = 100 + 450*(Station1_zeit[i]-Station1_zeit[0])/150;
      float x2 = 100 + 450*(Station1_zeit[i-1]-Station1_zeit[0])/150;
      float y1 = 550 - 350*(Station1_PM10[i] - min)/(max - min);
      float y2 = 550 - 350*(Station1_PM10[i-1] - min)/(max - min);
      float e1 = 550 - 350*(Station1_PM10[i] - 10 - min)/(max-min);
      float e2 = 550 - 350*(Station1_PM10[i] + 10 - min)/(max-min);
      if (x1 > 550) {
        x1 = 550;
      }
      if (x1 >=100 && x2 >= 100 && x1 <= 550 && x2 <= 550 && y1 >= 200 && y2 >= 200) {
        strokeWeight(3);
        if (verbinde.checked) {
          line(x1, y1, x2, y2);
        } else {
          line(x2-5, y2, x2+5, y2);
          line(x2, y2-5, x2, y2+5);
        }
        if (fehler.checked) {
          if (e1 < 200) {
            e1 = 200;
          }
          if (e1 > 550) {
            e1 = 550;
          }
          if (e2 < 200) {
            e2 = 200;
          }
          if (e2 > 550) {
            e2 = 550;
          }
          strokeWeight(1);
          line(x1, e1, x1, e2);
          line(x1-2, e1, x1+2, e1);
          line(x1-2, e2, x1+2, e2);
        }
      }
    }
  }
  ////////////////////
  stroke(255, 0, 0);
  for (int i = 1; i < 500; i++) {
    if (Station1_PM25[i] != 0) {
      float x1 = 100 + 450*(Station1_zeit[i]-Station1_zeit[0])/150;
      float x2 = 100 + 450*(Station1_zeit[i-1]-Station1_zeit[0])/150;
      float y1 = 550 - 350*(Station1_PM25[i] - min)/(max - min);
      float y2 = 550 - 350*(Station1_PM25[i-1] - min)/(max - min);
      float e1 = 550 - 350*(Station1_PM25[i] - 10 - min)/(max-min);
      float e2 = 550- 350*(Station1_PM25[i] + 10 - min)/(max-min);
      if (x1 > 550) {
        x1 = 550;
      }
      if (x1 >=100 && x2 >= 100 && x1 <= 550 && x2 <= 550 && y1 >= 200 && y2 >= 200) {
        strokeWeight(3);
        if (verbinde.checked) {
          line(x1, y1, x2, y2);
        } else {
          line(x2-5, y2, x2+5, y2);
          line(x2, y2-5, x2, y2+5);
        }
        if (fehler.checked) {
          if (e1 < 200) {
            e1 = 200;
          }
          if (e1 > 550) {
            e1 = 550;
          }
          if (e2 < 200) {
            e2 = 200;
          }
          if (e2 > 550) {
            e2 = 550;
          }
          strokeWeight(1);
          line(x1, e1, x1, e2);
          line(x1-2, e1, x1+2, e1);
          line(x1-2, e2, x1+2, e2);
        }
      }
    }
  }

  textAlign(CENTER);
  text("0", 100, 580);
  text("30", 190, 580);
  text("60", 280, 580);
  text("90", 370, 580);
  text("120", 460, 580);
  text("150", 550, 580);

  text("0", 740, 580);
  text("30", 830, 580);
  text("60", 920, 580);
  text("90", 1010, 580);
  text("120", 1100, 580);
  text("150", 1190, 580);

  text("Zeit in Sekunden", 325, 610);
  text("Zeit in Sekunden", 965, 610);
  strokeWeight(1);
  if (mouseX > 100 && mouseX < 550 && mouseY > 200 && mouseY < 550) {
    fill(255);
    stroke(0);
    ellipse(mouseX, mouseY, 10, 10);
    rect(mouseX + 10, mouseY - 35, 125, 40);
    fill(0);
    float pm = max*(550 - mouseY)/350;
    textAlign(CENTER);
    text(round(pm) + " µg/m³", mouseX + 75, mouseY - 8);
  }

  if (mouseX > 740 && mouseX < 1190 && mouseY > 200 && mouseY < 550) {
    fill(255);
    stroke(0);
    ellipse(mouseX, mouseY, 10, 10);
    rect(mouseX + 10, mouseY - 35, 125, 40);
    fill(0);
    float pm = max*(550 - mouseY)/350;
    textAlign(CENTER);
    text(round(pm) + " µg/m³", mouseX + 75, mouseY - 8);
  }
  zumObermenu2.show();
  zumObermenu2.y = 600;
  if (zumObermenu2.isClicked()) {
    page = 0;
  }
  //Feinstaub_weiter.show();
}





void Feinstaub_Aufgabe2() {
  fill(150, 150, 255, 100);
  noStroke();
  bezierRect(25, 25, 650, 650, 5, 5);
  fill(0);
  Feinstaub_weiter.show();
  fill(0);
  textSize(20);
  textFont(bold);
  textAlign(CENTER);
  text("Aufgabe 2 - Messung der Feinstaubemission", 337.5, 65);
  text("a) Kreidesorte A", 135, 205);
  textFont(normal);
  text("- Klicke auf 'Messung starten'\n- Warte 30 Sekunden (Einlaufzeit)\n- Beschrifte die Tafel für 30 Sekunden mit Kreidesorte A\n- Wische die Tafel für 30 Sekunden mit einem\ntrockenen Schwamm\n- Beschrifte die Tafel für 30 Sekunden\n- Wische die Tafel für 30 Sekunden mit einem nassen\nSchwamm", 337.5, 325);

  image(KreideA, 290, 155);
  textAlign(CORNER);
  text("Miss nun die Feinstaubemission, die bei Beschriftung und\nWischen der Tafel entsteht.\n\n\nIm ersten Versuch arbeiten wir mit Kreidesorte A. Führe die\nfolgenden Schritte auf der nächsten Seite aus:", 50, 115);
  text("Wenn du den Messablauf verinnerlicht hast, klicke auf ‚weiter‘.", 50, 605);
  image(Versuchsaufbau_Feinstaub2, 700, 70);
}


void Feinstaub_KreideA() {
  //Welche Graphen sollen angezeigt werden?
  up1.show();
  down1.show();
  zumObermenu.y = 605;
  up2.show();
  down2.show();

  Feinstaub_weiter.y = 385;
  Feinstaub_weiter.size = 16;
  Feinstaub_weiter.text = "zum Kreidestift";
  fill(0);
  textSize(20);
  reset.hide();
  fill(0);
  noStroke();

  // Zeichne den Hintergrund
  fill(255);
  stroke(0);
  rect(145, 165, 780, 450);
  fill(230);
  rect(1080, -1, 200, 720);
  stroke(0, 50);
  textSize(16);
  fill(0);
  textAlign(CENTER);
  text("Einlaufen", 223, 130);
  text("Tafel beschriften", 379, 130);
  text("Tafel wischen\n(trocken)", 535, 125);
  text("Tafel beschriften", 691, 130);
  text("Tafel wischen\n(nass)", 847, 125);
  textAlign(CORNER);
  stroke(100, 100);
  if (y_scale[0] != 0 || y_scale[1] != 0) {
    for (int i = 0; i < 4; i++) {
      line(145, 255 + 90*i, 925, 255 + 90*i);
    }
  }

  if (up1.isClicked()) {
    y_scale[0] += 1;
    if (y_scale[0] > 7) {
      y_scale[0] = 0;
    }
  }

  if (down1.isClicked()) {
    y_scale[0] -= 1;
    if (y_scale[0] < 0) {
      y_scale[0] = 7;
    }
  }

  if (up2.isClicked()) {
    y_scale[1] += 1;
    if (y_scale[1] > 7) {
      y_scale[1] = 0;
    }
  }

  if (down2.isClicked()) {
    y_scale[1] -= 1;
    if (y_scale[1] < 0) {
      y_scale[1] = 7;
    }
  }

  fill(255);
  stroke(0);
  //rect(470, 20, 130, 50);
  image(KreideA, 440, 20);
  rect(1105, 155, 155, 80);



  float maxPM25 = 0;
  float minPM25 = 99999999;

  float maxPM10 = 0;
  float minPM10 = 99999999;
  textSize(16);

  if (indexStation1 > 0) {
    textAlign(LEFT);
    fill(255, 0, 0);
    text("Aktueller Wert: (" + round(Station1_PM25[indexStation1-1]) + " +/- 10 µg/m³)", 145, 50);
    textAlign(RIGHT);
    fill(0, 0, 255);
    text("Aktueller Wert: (" + round(Station1_PM10[indexStation1-1]) + " +/- 10 µg/m³)", 925, 50);
  }
  textAlign(CORNER);
  textSize(20);
  fill(255, 0, 0);
  if (y_scale[0] == 0) {
    maxPM25 = max(Station1_PM25);
    minPM25 = min(Station1_PM25);
    if (maxPM25 != 0) {
      text(nf(maxPM25, 0, 1), 80, 175);
      text(nf(minPM25, 0, 1), 80, 625);
    }
  } else if (y_scale[0] == 1) {
    maxPM25 = 10;
    minPM25 = 0;
  } else if (y_scale[0] == 2) {
    maxPM25 = 50;
    minPM25 = 0;
  } else if (y_scale[0] == 3) {
    maxPM25 = 100;
    minPM25 = 0;
  } else if (y_scale[0] == 4) {
    maxPM25 = 200;
    minPM25 = 0;
  } else if (y_scale[0] == 5) {
    maxPM25 = 500;
    minPM25 = 0;
  } else if (y_scale[0] == 6) {
    maxPM25 = 1000;
    minPM25 = 0;
  } else if (y_scale[0] == 7) {
    maxPM25 = 2000;
    minPM25 = 0;
  }
  fill(0, 0, 255);
  if (y_scale[1] == 0) {
    maxPM10 = max(Station1_PM10);
    minPM10 = min(Station1_PM10);
    if (maxPM10 != 0) {
      text(nf(maxPM10, 0, 1), 960, 175);
      text(nf(minPM10, 0, 1), 960, 625);
    }
  } else if (y_scale[1] == 1) {
    maxPM10 = 10;
    minPM10 = 0;
  } else if (y_scale[1] == 2) {
    maxPM10 = 50;
    minPM10 = 0;
  } else if (y_scale[1] == 3) {
    maxPM10 = 100;
    minPM10 = 0;
  } else if (y_scale[1] == 4) {
    maxPM10 = 200;
    minPM10 = 0;
  } else if (y_scale[1] == 5) {
    maxPM10 = 500;
    minPM10 = 0;
  } else if (y_scale[1] == 6) {
    maxPM10 = 1000;
    minPM10 = 0;
  } else if (y_scale[1] == 7) {
    maxPM10 = 2000;
    minPM10 = 0;
  }


  fill(255, 0, 0);
  if (y_scale[0] != 0) {
    for (int i = 0; i < 6; i++) {
      text(round(i*maxPM25/5), 80, 625- 90*i);
    }
  }
  fill(0, 0, 255);
  if (y_scale[1] != 0) {
    for (int i = 0; i < 6; i++) {
      text(round(i*maxPM10/5), 960, 625- 90*i);
    }
  }


  //rect(145, 165, 780, 450);
  stroke(255, 0, 0);
  strokeWeight(3);
  for (int i = 1; i < 500; i++) {
    if (Station1_PM25[i] != 0) {
      float x1 = 145 + 780*(Station1_zeit[i]-Station1_zeit[0])/150;
      float x2 = 145 + 780*(Station1_zeit[i-1]-Station1_zeit[0])/150;
      float y1 = 615 - 450*(Station1_PM25[i] - minPM25)/(maxPM25 - minPM25);
      float y2 = 615 - 450*(Station1_PM25[i-1] - minPM25)/(maxPM25 - minPM25);

      float e1 = 615 - 615*(Station1_PM25[i] - 10 - minPM25)/(maxPM25-minPM25);
      float e2 = 615- 615*(Station1_PM25[i] + 10 - minPM25)/(maxPM25-minPM25);
      if (x1 >=145 && x2 >= 145 && x1 <= 925 && x2 <= 925 && y1 >=165 && y2 >= 165) {
        strokeWeight(3);
        if (verbinde.checked) {
          line(x1, y1, x2, y2);
        } else {
          line(x2-5, y2, x2+5, y2);
          line(x2, y2-5, x2, y2+5);
        }
        if (fehler.checked) {
          if (e1 < 165) {
            e1 = 165;
          }
          if (e1 > 615) {
            e1 = 615;
          }
          if (e2 < 165) {
            e2 = 165;
          }
          if (e2 > 615) {
            e2 = 615;
          }
          strokeWeight(1);
          line(x1, e1, x1, e2);
          line(x1-2, e1, x1+2, e1);
          line(x1-2, e2, x1+2, e2);
        }
      }
    }
  }


  stroke(0, 0, 255);
  for (int i = 1; i < 500; i++) {
    if (Station1_PM10[i] != 0) {
      float x1 = 145 + 780*(Station1_zeit[i]-Station1_zeit[0])/150;
      float x2 = 145 + 780*(Station1_zeit[i-1]-Station1_zeit[0])/150;
      float y1 = 615 - 450*(Station1_PM10[i] - minPM10)/(maxPM10 - minPM10);
      float y2 = 615 - 450*(Station1_PM10[i-1] - minPM10)/(maxPM10 - minPM10);
      float e1 = 615 - 615*(Station1_PM10[i] - 10 - minPM10)/(maxPM10-minPM10);
      float e2 = 615- 615*(Station1_PM10[i] + 10 - minPM10)/(maxPM10-minPM10);
      if (x1 > 925) {
        x1 = 925;
      }
      if (x1 >=145 && x2 >= 145 && x1 <= 925 && x2 <= 925 && y1 >=165 && y2 >= 165) {
        strokeWeight(3);
        if (verbinde.checked) {
          line(x1, y1, x2, y2);
        } else {
          line(x2-5, y2, x2+5, y2);
          line(x2, y2-5, x2, y2+5);
        }
        if (fehler.checked) {
          if (e1 < 165) {
            e1 = 165;
          }
          if (e1 > 615) {
            e1 = 615;
          }
          if (e2 < 165) {
            e2 = 165;
          }
          if (e2 > 615) {
            e2 = 615;
          }
          strokeWeight(1);
          line(x1, e1, x1, e2);
          line(x1-2, e1, x1+2, e1);
          line(x1-2, e2, x1+2, e2);
        }
      }
    }
  }
  //rect(145, 165, 780, 450);
  fill(255, 200, 200, 50);
  noStroke();
  if (indexStation1 > 0) {
    if ((Station1_zeit[indexStation1-1] -Station1_zeit[0]) < 30) {
      rect(145, 165, 156, 450);
    } else if ((Station1_zeit[indexStation1-1] -Station1_zeit[0])  > 30 && (Station1_zeit[indexStation1-1] -Station1_zeit[0]) < 60) {
      rect(301, 165, 156, 450);
    } else if ((Station1_zeit[indexStation1-1] -Station1_zeit[0])  > 60 && (Station1_zeit[indexStation1-1] -Station1_zeit[0]) < 90) {
      rect(457, 165, 156, 450);
    } else if ((Station1_zeit[indexStation1-1] -Station1_zeit[0])  > 90 && (Station1_zeit[indexStation1-1] -Station1_zeit[0]) < 120) {
      rect(613, 165, 156, 450);
    } else if ((Station1_zeit[indexStation1-1] -Station1_zeit[0])  > 120 && (Station1_zeit[indexStation1-1] -Station1_zeit[0]) < 150) {
      rect(769, 165, 156, 450);
    }
    if ((Station1_zeit[indexStation1-1] -Station1_zeit[0]) > 150) {
      Feinstaub_weiter.show();
      Station1Start = false;
      KreideAAbgeschlossen = true;
      station1_MessungWiederholen.show();
      station1_MessungWiederholen.text = "Messung\nwiederholen";
    } else {
      station1_MessungWiederholen.show();
      station1_MessungWiederholen.text = "Messung\nneu starten";
    }
  } else {
    station1_MessungStarten.show();
  }


  if (KreideAAbgeschlossen) {
    Feinstaub_weiter.show();
  } else {
    Feinstaub_weiter.hide();
  }


  if (freie_stationen.name == "freigeben") {
    Feinstaub_weiter.show();
  }

  Feinstaub_weiter.size = 20;




  // graphFeinstaub(Station1_PM25, 1, "Feinstaub PM2.5 in μg/m³", x_scale, y_scale, true);
  // graphFeinstaub(Station1_PM10, 1, "Feinstaub PM10 in μg/m³", x_scale, y_scale, false);


  pushMatrix();
  translate(width/2, height/2);
  rotate(3*PI/2);
  fill(255, 0, 0);
  text("Feinstaub PM2.5", height/2 -470, -width/2 + 50);  
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(PI/2);
  fill(0, 0, 255);
  text("Feinstaub PM10", -height/2 +320, width/2 - 1035);
  popMatrix();


  fill(0);
  textSize(20);
  textAlign(CENTER);
  text("0", 145, 660);
  text("30", 301, 660);
  text("60", 455, 660);
  text("90", 615, 660);
  text("120", 766, 660);
  text("150", 925, 660);
  stroke(0);
  // rect(145, 165, 780, 450);
  for (int i = 0; i < 4; i++) {
    line(301 + 156*i, 165, 301 + 156*i, 615);
  }



  textSize(20);
  text("Zeit in Sekunden", 530, 700);
  fill(0);
  textAlign(CENTER);

  textAlign(CORNER);
  two_b.hide();
  two_a.hide();
  Geruchstest.hide();
  fill(0);
  noStroke();
  textSize(24);
  text("Optionen", 1120, 30);
  fill(240);
  stroke(0);
  strokeWeight(1);
  rect(1105, 450, 155, 140);
  fill(0);
  noStroke();
  textSize(20);
  textAlign(CENTER);
  if (del == 0) {
    text("Messintervall", 1185, 480);
    text("Maximum", 1190, 565);
  } else {
    text("Messintervall", 1185, 480);
    text(nf(del, 0, 0) + " s", 1185, 565);
  }
  textSize(13);
  text("Messunsicherheit", 1165, 180);
  textSize(16);
  text("verbinden", 1165, 220);
  textAlign(CORNER);
  back.show();
  aktualisierung_right.show();
  aktualisierung_left.show();
  verbinde.show();
  fehler.show();

  if (fehler.checked) {
    error_bars.name = "anzeigen";
  } else {
    error_bars.name = "nicht anzeigen";
  }
  if (verbinde.checked) {
    connect.name = "verbinden";
  } else {
    connect.name = "nicht verbinden";
  }
}


boolean KreideAAbgeschlossen = false;
boolean KreideBAbgeschlossen = false;





void haken(float x) {
  strokeWeight(5);
  stroke(0, 255, 0);

  line(x, 510, x + 50, 560);
  line(x + 50, 560, x + 100, 460);
  strokeWeight(1);
}


void kreuz(float x) {
  strokeWeight(5);
  stroke(255, 0, 0);
  line(x - 50, 460, x + 50, 560);
  line(x - 50, 560, x + 50, 460);
  strokeWeight(1);
}


boolean ersterDurchlauf_Station1_referenz = false;
boolean station1_referenz_abgeschlossen = false;

float time_station1 = -999999;





void analyseFeinstaub(float[] array, String string, int index, int posY) {

  float x1 = sFeinstaub.x1-120;
  float x2 = sFeinstaub.x2-120;

  // 1. Schritt: Finde die entsprechenden Array Indizes
  // Es gibt "indexInnenraumluftabc" Daten im Array, die auf 830 Pixel verteilt sind

  float dichteA = float(index)/830;
  // Entsprechender Index zu x1, x2

  int indexX1A = round(x1*dichteA);
  int indexX2A = floor(x2*dichteA);



  // 2. Schritt: Merkmale Maximum, Minimum, Steigung und Mittelwert in diesem Intervall berechnen

  float MaxA = 0;
  float MinA = 99999;
  float MWA = 0;
  float SteigungA = 0;
  float MWA_fuerSteigung = 0;
  if (indexX1A < 0) {
    indexX1A = 0;
  }
  //Merkmale A
  for (int i = indexX1A; i < indexX2A + 1; i++) {
    if (array[i] > MaxA) {
      MaxA = array[i];
    }
    if (array[i] < MinA && array[i] != 0) {
      MinA =  array[i];
    }
    MWA += array[i];

    // Für die Steigung
    MWA_fuerSteigung += array[i];
  }
  MWA = MWA/(indexX2A+ 1 - indexX1A);
  MWA_fuerSteigung = MWA_fuerSteigung/(indexX2A+ 1 - indexX1A);

  float Steigung_Zaehler_A = 0;
  float Steigung_Nenner_A = 0;
  for (int i = indexX1A; i < indexX2A + 1; i++) {
    Steigung_Zaehler_A += (array[i] - MWA_fuerSteigung)*(array[i] - MWA);
    Steigung_Nenner_A += (array[i] - MWA_fuerSteigung)*(array[i] - MWA_fuerSteigung);
  }
  SteigungA = Steigung_Zaehler_A/Steigung_Nenner_A;

  stroke(0);
  if (posY == 0) {
    fill(255, 100, 100, 100);
    stroke(0);
    rect(1040, 100, 220, 25);
    fill(255);
    rect(1040, 125, 220, 115);
  } else if (posY == 1) {
    fill(100, 255, 100, 100);
    rect(1040, 250, 220, 25);
    fill(255);

    rect(1040, 275, 220, 115);
  } else if (posY == 2) {
    fill(100, 100, 255, 100);
    rect(1040, 400, 220, 25);
    fill(255);
    rect(1040, 425, 220, 115);
  }

  //fill(0);
  //stroke(0);
  //line(1060, 125, 1260, 125);
  //line(1060, 275, 1260, 275);
  //line(1060, 425, 1260, 425);

  noStroke();
  fill(0);
  String Einheit = "µg/m³";

  textSize(16);
  textAlign(CENTER);
  text(string, 1150, 120 + 150*posY);


  text("Maximum: " + nf(MaxA, 0, 1) + " in " + Einheit, 1150, 150 + 150*posY);
  text("Minimum: " + nf(MinA, 0, 1) + " in " + Einheit, 1150, 175+ 150*posY);
  text("Mittelwert: " + nf(MWA, 0, 1) + " in " + Einheit, 1150, 200+ 150*posY);
  text("Steigung: " + nf(SteigungA, 0, 1) + " in " + Einheit + "s", 1150, 225+ 150*posY);

  textAlign(CORNER);
}

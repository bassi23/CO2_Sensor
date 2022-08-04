void TVOC_Duelle() {
  Sensormessung.visible = false;
  textSize(20);
  fill(0);
  textFont(bold);
  text("Station 2.2 - TVOC-Duelle", 20, 50);
  textFont(normal);
  Station3_Aufgabentext_a1.show();
  //  text("Vergleiche verschiedene Materialien auf die Ausdünstung von flüchtigen organischen Verbindungen (TVOC). Welche Stoffe\nemittieren am meisten? Gib zuvor eine Prognose ab, indem du an den Stoffen riechst.", 20, 100);
  stroke(0);
  line(0, 180, 1280, 180);
  noStroke();
  textFont(bold);
  text("a) Riechen", 20, 220);
  textFont(normal);
  Station3_Aufgabentext_a2.show();
  //  text("\nOrdne die Emission der folgenden Stoffe auf der unteren Skala an! Vergib Punkte von 0 (nicht wahrnehmbar) bis\n6(extrem stark).", 20, 220); 
  TVOC_Duelle_Start.show();
  if (TVOC_Duelle_Start.isClicked()) {
    delay(200);
    page = 3.1;
  }
  Station3_Aufgabentext_a2.y = 230;
  Duell_Runde = 1;
}

int Duell_Runde = 1;
boolean TVOC_Geruch_Absolviert = false;
void ZwischenFolieTVOC() {
  TVOC_analyse.show();
  Geruchstest.show();
  if (TVOC_Geruch_Absolviert) {
    auswertung_Geruchstest.show();
  }

  if (auswertung_Geruchstest.isClicked()) {
    page = 3.111;
    auswertung_Geruchstest.hide();
  }
}




void TVOC_Duelle_Riechen() {
  weiter_zum_Sensor.hide();
  textSize(20);
  fill(0);
  //  Station3_Aufgabentext_a1.show();
  // text("Vergleiche verschiedene Materialien auf die Ausdünstung von flüchtigen organischen Verbindungen (TVOC). Welche Stoffe\nemittieren am meisten? Gib zuvor eine Prognose ab, indem du an den Stoffen riechst.", 20, 100);
  stroke(0);
  line(0, 180, 1280, 180);
  noStroke();
  textFont(bold);
  text("a) Riechen", 20, 50);
  textFont(normal);
  Station3_Aufgabentext_a2.y = 60;
  Station3_Aufgabentext_a2.show();
  // text("\nOrdne die Emission der folgenden Stoffe auf der unteren Skala an! Vergib Punkte von 0 (nicht wahrnehmbar) bis\n6(extrem stark).", 20, 220); 
  text("nicht wahrnehmbar (0)", 50, 480);
  text("extrem stark (6)", 1020, 480);
  TVOC_Duelle_Start.hide();


  for (int i = 0; i < 50; i++) {
    fill(255*(float(i)/50), 255-255*(float(i)/50), 0);
    rect(290 + 14*i, 450, 14, 50);
  }



  Sensormessung.visible = false;

  if (naechstes_Duell.isClicked()) {
    Duell_Runde += 1;
    delay(200);
  }
  if (vorheriges_Duell.isClicked()) {
    Duell_Runde -= 1;
    delay(200);
  }


  if (Duell_Runde < 4) {
    naechstes_Duell.show();
  }
  if (Duell_Runde > 1) {
    vorheriges_Duell.show();
  }
  if (Duell_Runde == 1) {
    Stoff1.show();
    Stoff2.show();
  } else if (Duell_Runde == 2) {
    Stoff3.show();
    Stoff4.show();
  } else if (Duell_Runde == 3) {
    Stoff5.show();
    Stoff6.show();
  } else if (Duell_Runde == 4) {
    Stoff7.show();
    Stoff8.show();
    weiter_zum_Sensor.show();
  }

  if (weiter_zum_Sensor.isClicked()) {
    delay(200);
    weiter_zum_Sensor.hide();

    page = 3.11;
  }


  tvoc_duelle_werte_mensch[0] = 6*(Stoff1.x - 290)/700;
  tvoc_duelle_werte_mensch[1] = 6*(Stoff2.x- 290)/700;
  tvoc_duelle_werte_mensch[2] = 6*(Stoff3.x- 290)/700;
  tvoc_duelle_werte_mensch[3] = 6*(Stoff4.x- 290)/700;
  tvoc_duelle_werte_mensch[4] = 6*(Stoff5.x- 290)/700;
  tvoc_duelle_werte_mensch[5] = 6*(Stoff6.x- 290)/700;
  tvoc_duelle_werte_mensch[6] = 6*(Stoff7.x- 290)/700;
  tvoc_duelle_werte_mensch[7] = 6*(Stoff8.x- 290)/700;
}


class TVOC_Kandidat {
  float x, y;
  PImage image;
  String name;

  TVOC_Kandidat(float x_, float y_, PImage image_, String name_) {
    x = x_;
    y = y_;
    name = name_;
    image = image_;
  }

  void show() {
    imageMode(CENTER);
    image(image, x, y);
    imageMode(CORNER);
    textAlign(CENTER);
    textSize(20);
    fill(0);
    if (y < 475) {
      text(name, x, y - 70);
    } else {
      text(name, x, y + 70);
    }
    float points = (x-290)/70;
    float points2 = 6*points/10;
    text(nf(points2, 0, 1), x-70, y);
    String skala = "";
    if (points < 0.5) {
      skala = "nicht wahrnehmbar";
    } else if (points2 < 1.5) {
      skala = "sehr schwach";
    } else if (points2 < 2.5) {
      skala = "schwach";
    } else if (points2 < 3.5) {
      skala = "deutlich";
    } else if (points2 < 4.5) {
      skala = "stark";
    } else if (points2 < 5.5) {
      skala = "sehr stark";
    } else {
      skala = "extrem stark";
    }
    textAlign(CORNER);
    text(skala, x+55, y);

    if (mouseX > (x - image.width/2)*scale_factor && mouseX < (x + image.width/2)*scale_factor && (mouseY - scroll) > (y - image.height/2)*scale_factor && (mouseY - scroll) < (y + image.height/2)*scale_factor && mousePressed && mouseX > scale_factor*290 && mouseX < scale_factor*990) {
      x = mouseX/scale_factor;
    }

    float r = 255*(x - 290)/700;
    float g = 255 - r;
    strokeWeight(4);
    stroke(r, g, 0);

    if (y < 475) {
      line(x, y + image.height/2, x, 450);
      line(x - 20, 430, x, 450);
      line(x, 450, x + 20, 430);
    } else {
      line(x, y - image.height/2, x, 500);
      line(x - 20, 520, x, 500);
      line(x, 500, x + 20, 520);
    }
    strokeWeight(1);
  }
}


int tvoc_stoff = 1;

float[] tvoc_duelle_werte_mensch = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
float[] tvoc_duelle_werte_sensor = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

void TVOC_Duelle_Messen() {
  textSize(20);

  if (tvoc_stoff < 8) {
    naechster_Stoff.show();
    naechster_Stoff.y = 200;
    zur_Auswertung.hide();
  } else {
    zur_Auswertung.show();
  }
  if (naechster_Stoff.isClicked()) {
    delay(200); 
    tvoc_stoff += 1;
  }
  if (vorheriger_Stoff.isClicked()) {
    delay(200);
    tvoc_stoff -= 1;
  }
  if (tvoc_stoff > 1) {
    vorheriger_Stoff.show();
  }
  if (zur_Auswertung.isClicked()) {
    delay(200);
    page = 3.111;
  }
  strokeWeight(1);
  textFont(bold);
  text("b) Messen", 20, 50);
  textFont(normal);
  // text("\nMiss nun die verschiedenen Stoffe, indem du sie in die Gläser legst und unter den Sensor schraubst. Vergleiche die Messwerte\nmit deiner Vorhersage.", 20, 50);
  Station3_Aufgabentext_b1.show();
  //text("Miss die Emission von Stoff " + tvoc_stoff +". Warte dabei bis sich ein Gleichgewicht eingestellt hat.", 20, 150);
  textFont(bold);
  text("Deine Einschätzung", 20, 200);
  text("Messung des\nSensors", 20, 450);
  textFont(normal);
  text("nicht wahrnehmbar (0)", 10, 380);
  text("extrem stark (6)", 1020, 380);
  text("nicht wahrnehmbar (0)", 10, 630);
  text("extrem stark (6)", 1020, 630);
  stroke(0);
  // line(0, 125, 1280, 125);
  noStroke();
  for (int i = 0; i < 50; i++) {
    fill(255*(float(i)/50), 255-255*(float(i)/50), 0);
    rect(290 + 14*i, 350, 14, 50);
    rect(290 + 14*i, 600, 14, 50);
  }
  fill(0);



  if (tvoc_stoff == 1) {
    //Meine Vorhersage
    image(Stoff1_bild, Stoff1.x - 50, 210);
    text(nf(tvoc_duelle_werte_mensch[0], 0, 1), Stoff1.x - 90, 260);
    float points = tvoc_duelle_werte_mensch[0];
    String skala = "";
    if (points < 0.5) {
      skala = "nicht wahrnehmbar";
    } else if (points < 1.5) {
      skala = "sehr schwach";
    } else if (points < 2.5) {
      skala = "schwach";
    } else if (points < 3.5) {
      skala = "deutlich";
    } else if (points < 4.5) {
      skala = "stark";
    } else if (points < 5.5) {
      skala = "sehr stark";
    } else {
      skala = "extrem stark";
    }
    text(skala, Stoff1.x + 70, 260);

    float r = 255*(Stoff1.x - 360)/700;
    float g = 255 - r;
    strokeWeight(4);
    stroke(r, g, 0);
    line(Stoff1.x, 310, Stoff1.x, 350);
    line(Stoff1.x - 20, 330, Stoff1.x, 350);
    line(Stoff1.x, 350, Stoff1.x + 20, 330);
  } else if (tvoc_stoff == 2) {
    image(Stoff2_bild, Stoff2.x - 50, 210);
    text(nf(tvoc_duelle_werte_mensch[1], 0, 1), Stoff2.x - 90, 250);
    float points = tvoc_duelle_werte_mensch[1];
    String skala = "";
    if (points < 0.5) {
      skala = "nicht wahrnehmbar";
    } else if (points < 1.5) {
      skala = "sehr schwach";
    } else if (points < 2.5) {
      skala = "schwach";
    } else if (points < 3.5) {
      skala = "deutlich";
    } else if (points < 4.5) {
      skala = "stark";
    } else if (points < 5.5) {
      skala = "sehr stark";
    } else {
      skala = "extrem stark";
    }
    text(skala, Stoff2.x + 70, 260);
    float r = 255*(Stoff2.x - 360)/700;
    float g = 255 - r;
    strokeWeight(4);
    stroke(r, g, 0);
    line(Stoff2.x, 310, Stoff2.x, 350);
    line(Stoff2.x - 20, 330, Stoff2.x, 350);
    line(Stoff2.x, 350, Stoff2.x + 20, 330);
  } else if (tvoc_stoff == 3) {
    text(nf(tvoc_duelle_werte_mensch[2], 0, 1), Stoff3.x - 90, 250);
    image(Stoff3_bild, Stoff3.x - 50, 210);
    float points = tvoc_duelle_werte_mensch[2];
    String skala = "";
    if (points < 0.5) {
      skala = "nicht wahrnehmbar";
    } else if (points < 1.5) {
      skala = "sehr schwach";
    } else if (points < 2.5) {
      skala = "schwach";
    } else if (points < 3.5) {
      skala = "deutlich";
    } else if (points < 4.5) {
      skala = "stark";
    } else if (points < 5.5) {
      skala = "sehr stark";
    } else {
      skala = "extrem stark";
    }
    text(skala, Stoff3.x + 70, 260);
    float r = 255*(Stoff3.x - 360)/700;
    float g = 255 - r;
    strokeWeight(4);
    stroke(r, g, 0);
    line(Stoff3.x, 310, Stoff3.x, 350);
    line(Stoff3.x - 20, 330, Stoff3.x, 350);
    line(Stoff3.x, 350, Stoff3.x + 20, 330);
  } else if (tvoc_stoff == 4) {
    text(nf(tvoc_duelle_werte_mensch[3], 0, 1), Stoff4.x - 90, 250);
    image(Stoff4_bild, Stoff4.x - 50, 210);
    float points = tvoc_duelle_werte_mensch[3];
    String skala = "";
    if (points < 0.5) {
      skala = "nicht wahrnehmbar";
    } else if (points < 1.5) {
      skala = "sehr schwach";
    } else if (points < 2.5) {
      skala = "schwach";
    } else if (points < 3.5) {
      skala = "deutlich";
    } else if (points < 4.5) {
      skala = "stark";
    } else if (points < 5.5) {
      skala = "sehr stark";
    } else {
      skala = "extrem stark";
    }
    text(skala, Stoff4.x + 70, 260);
    float r = 255*(Stoff4.x - 360)/700;
    float g = 255 - r;
    strokeWeight(4);
    stroke(r, g, 0);
    line(Stoff4.x, 310, Stoff4.x, 350);
    line(Stoff4.x - 20, 330, Stoff4.x, 350);
    line(Stoff4.x, 350, Stoff4.x + 20, 330);
  } else if (tvoc_stoff == 5) {
    text(nf(tvoc_duelle_werte_mensch[4], 0, 1), Stoff5.x - 90, 250);
    image(Stoff5_bild, Stoff5.x - 50, 210);
    float points = tvoc_duelle_werte_mensch[4];
    String skala = "";
    if (points < 0.5) {
      skala = "nicht wahrnehmbar";
    } else if (points < 1.5) {
      skala = "sehr schwach";
    } else if (points < 2.5) {
      skala = "schwach";
    } else if (points < 3.5) {
      skala = "deutlich";
    } else if (points < 4.5) {
      skala = "stark";
    } else if (points < 5.5) {
      skala = "sehr stark";
    } else {
      skala = "extrem stark";
    }
    text(skala, Stoff5.x + 70, 260);
    float r = 255*(Stoff5.x - 360)/700;
    float g = 255 - r;
    strokeWeight(4);
    stroke(r, g, 0);
    line(Stoff5.x, 310, Stoff5.x, 350);
    line(Stoff5.x - 20, 330, Stoff5.x, 350);
    line(Stoff5.x, 350, Stoff5.x + 20, 330);
  } else if (tvoc_stoff == 6) {
    text(nf(tvoc_duelle_werte_mensch[5], 0, 1), Stoff6.x - 90, 250);
    image(Stoff6_bild, Stoff6.x - 50, 210);
    float points = tvoc_duelle_werte_mensch[5];
    String skala = "";
    if (points < 0.5) {
      skala = "nicht wahrnehmbar";
    } else if (points < 1.5) {
      skala = "sehr schwach";
    } else if (points < 2.5) {
      skala = "schwach";
    } else if (points < 3.5) {
      skala = "deutlich";
    } else if (points < 4.5) {
      skala = "stark";
    } else if (points < 5.5) {
      skala = "sehr stark";
    } else {
      skala = "extrem stark";
    }
    text(skala, Stoff6.x + 70, 260);
    float r = 255*(Stoff6.x - 360)/700;
    float g = 255 - r;
    strokeWeight(4);
    stroke(r, g, 0);
    line(Stoff6.x, 310, Stoff6.x, 350);
    line(Stoff6.x - 20, 330, Stoff6.x, 350);
    line(Stoff6.x, 350, Stoff6.x + 20, 330);
  } else if (tvoc_stoff == 7) {
    text(nf(tvoc_duelle_werte_mensch[6], 0, 1), Stoff7.x - 90, 250);
    image(Stoff7_bild, Stoff7.x - 50, 210);
    float points = tvoc_duelle_werte_mensch[6];
    String skala = "";
    if (points < 0.5) {
      skala = "nicht wahrnehmbar";
    } else if (points < 1.5) {
      skala = "sehr schwach";
    } else if (points < 2.5) {
      skala = "schwach";
    } else if (points < 3.5) {
      skala = "deutlich";
    } else if (points < 4.5) {
      skala = "stark";
    } else if (points < 5.5) {
      skala = "sehr stark";
    } else {
      skala = "extrem stark";
    }
    text(skala, Stoff7.x + 70, 260);
    float r = 255*(Stoff7.x - 360)/700;
    float g = 255 - r;
    strokeWeight(4);
    stroke(r, g, 0);
    line(Stoff7.x, 310, Stoff7.x, 350);
    line(Stoff7.x - 20, 330, Stoff7.x, 350);
    line(Stoff7.x, 350, Stoff7.x + 20, 330);
  } else if (tvoc_stoff == 8) {
    text(nf(tvoc_duelle_werte_mensch[7], 0, 1), Stoff8.x - 90, 250);
    image(Stoff8_bild, Stoff8.x - 50, 210);
    float points = tvoc_duelle_werte_mensch[7];
    String skala = "";
    if (points < 0.5) {
      skala = "nicht wahrnehmbar";
    } else if (points < 1.5) {
      skala = "sehr schwach";
    } else if (points < 2.5) {
      skala = "schwach";
    } else if (points < 3.5) {
      skala = "deutlich";
    } else if (points < 4.5) {
      skala = "stark";
    } else if (points < 5.5) {
      skala = "sehr stark";
    } else {
      skala = "extrem stark";
    }
    text(skala, Stoff1.x + 70, 260);
    float r = 255*(Stoff8.x - 360)/700;
    float g = 255 - r;
    strokeWeight(4);
    stroke(r, g, 0);
    line(Stoff8.x, 310, Stoff8.x, 350);
    line(Stoff8.x - 20, 330, Stoff8.x, 350);
    line(Stoff8.x, 350, Stoff8.x + 20, 330);
  } 
  //Messung des Sensors
  if (index > 1) {
    float x = sgp_tvoc_data[index - 1];
    x = (x * float(Kalibrierung_Station2_2.replace(',', '.')) + 290)*scale_factor;
    if (x > 990*scale_factor) {
      x = 990*scale_factor;
    }
    imageMode(CENTER);
    if (tvoc_stoff == 1) {
      image(Stoff1_bild, x, 510);
      tvoc_duelle_werte_sensor[0] = 6*(x - 290)/700;
      text(nf(tvoc_duelle_werte_sensor[0], 0, 1), x - 90, 520);

      float points = 6*(x-290)/700;
      String skala = "";
      if (points < 0.5) {
        skala = "nicht wahrnehmbar";
      } else if (points < 1.5) {
        skala = "sehr schwach";
      } else if (points < 2.5) {
        skala = "schwach";
      } else if (points < 3.5) {
        skala = "deutlich";
      } else if (points < 4.5) {
        skala = "stark";
      } else if (points < 5.5) {
        skala = "sehr stark";
      } else {
        skala = "extrem stark";
      }
      textAlign(CENTER);
      text(skala +  "\n(in ppb: " + sgp_tvoc_data[index - 1] + ")", x + 170, 520);
      textAlign(CORNER);
    } else if (tvoc_stoff == 2) {
      image(Stoff2_bild, x, 510);
      tvoc_duelle_werte_sensor[1] = 6*(x - 290)/700;
      text(nf(tvoc_duelle_werte_sensor[1], 0, 1), x - 90, 520);
      float points = 6*(x-290)/700;
      String skala = "";
      if (points < 0.5) {
        skala = "nicht wahrnehmbar";
      } else if (points < 1.5) {
        skala = "sehr schwach";
      } else if (points < 2.5) {
        skala = "schwach";
      } else if (points < 3.5) {
        skala = "deutlich";
      } else if (points < 4.5) {
        skala = "stark";
      } else if (points < 5.5) {
        skala = "sehr stark";
      } else {
        skala = "extrem stark";
      }
      textAlign(CENTER);
      text(skala +  "\n(in ppb: " + sgp_tvoc_data[index - 1] + ")", x + 170, 520);
      textAlign(CORNER);
    } else if (tvoc_stoff == 3) {
      image(Stoff3_bild, x, 510);
      tvoc_duelle_werte_sensor[2] =  6*(x - 290)/700;
      text(nf(tvoc_duelle_werte_sensor[2], 0, 1), x - 90, 520);
      float points = 6*(x-290)/700;
      String skala = "";
      if (points < 0.5) {
        skala = "nicht wahrnehmbar";
      } else if (points < 1.5) {
        skala = "sehr schwach";
      } else if (points < 2.5) {
        skala = "schwach";
      } else if (points < 3.5) {
        skala = "deutlich";
      } else if (points < 4.5) {
        skala = "stark";
      } else if (points < 5.5) {
        skala = "sehr stark";
      } else {
        skala = "extrem stark";
      }
      textAlign(CENTER);
      text(skala +  "\n(in ppb: " + sgp_tvoc_data[index - 1] + ")", x + 170, 520);
      textAlign(CORNER);
    } else if (tvoc_stoff == 4) {
      image(Stoff4_bild, x, 510);
      tvoc_duelle_werte_sensor[3] =  6*(x - 290)/700;
      text(nf(tvoc_duelle_werte_sensor[3], 0, 1), x - 90, 520);
      float points = 6*(x-290)/700;
      String skala = "";
      if (points < 0.5) {
        skala = "nicht wahrnehmbar";
      } else if (points < 1.5) {
        skala = "sehr schwach";
      } else if (points < 2.5) {
        skala = "schwach";
      } else if (points < 3.5) {
        skala = "deutlich";
      } else if (points < 4.5) {
        skala = "stark";
      } else if (points < 5.5) {
        skala = "sehr stark";
      } else {
        skala = "extrem stark";
      }
      textAlign(CENTER);
      text(skala +  "\n(in ppb: " + sgp_tvoc_data[index - 1] + ")", x + 170, 520);
      textAlign(CORNER);
    } else if (tvoc_stoff == 5) {
      image(Stoff5_bild, x, 510);
      tvoc_duelle_werte_sensor[4] =  6*(x - 290)/700;
      text(nf(tvoc_duelle_werte_sensor[4], 0, 1), x - 90, 520);
      float points = 6*(x-290)/700;
      String skala = "";
      if (points < 0.5) {
        skala = "nicht wahrnehmbar";
      } else if (points < 1.5) {
        skala = "sehr schwach";
      } else if (points < 2.5) {
        skala = "schwach";
      } else if (points < 3.5) {
        skala = "deutlich";
      } else if (points < 4.5) {
        skala = "stark";
      } else if (points < 5.5) {
        skala = "sehr stark";
      } else {
        skala = "extrem stark";
      }
      textAlign(CENTER);
      text(skala +  "\n(in ppb: " + sgp_tvoc_data[index - 1] + ")", x + 170, 520);
      textAlign(CORNER);
    } else if (tvoc_stoff == 6) {
      image(Stoff6_bild, x, 510);
      tvoc_duelle_werte_sensor[5] =  6*(x - 290)/700;
      text(nf(tvoc_duelle_werte_sensor[5], 0, 1), x - 90, 520);
      float points = 6*(x-290)/700;
      String skala = "";
      if (points < 0.5) {
        skala = "nicht wahrnehmbar";
      } else if (points < 1.5) {
        skala = "sehr schwach";
      } else if (points < 2.5) {
        skala = "schwach";
      } else if (points < 3.5) {
        skala = "deutlich";
      } else if (points < 4.5) {
        skala = "stark";
      } else if (points < 5.5) {
        skala = "sehr stark";
      } else {
        skala = "extrem stark";
      }
      textAlign(CENTER);
      text(skala +  "\n(in ppb: " + sgp_tvoc_data[index - 1] + ")", x + 170, 520);
      textAlign(CORNER);
    } else if (tvoc_stoff == 7) {
      image(Stoff7_bild, x, 510);
      tvoc_duelle_werte_sensor[6] =  6*(x - 290)/700;
      text(nf(tvoc_duelle_werte_sensor[6], 0, 1), x - 90, 520);
      float points = 6*(x-290)/700;
      String skala = "";
      if (points < 0.5) {
        skala = "nicht wahrnehmbar";
      } else if (points < 1.5) {
        skala = "sehr schwach";
      } else if (points < 2.5) {
        skala = "schwach";
      } else if (points < 3.5) {
        skala = "deutlich";
      } else if (points < 4.5) {
        skala = "stark";
      } else if (points < 5.5) {
        skala = "sehr stark";
      } else {
        skala = "extrem stark";
      }
      textAlign(CENTER);
      text(skala +  "\n(in ppb: " + sgp_tvoc_data[index - 1] + ")", x + 170, 520);
      textAlign(CORNER);
    } else if (tvoc_stoff == 8) {
      image(Stoff8_bild, x, 510);
      tvoc_duelle_werte_sensor[7] =  6*(x - 290)/700;
      text(nf(tvoc_duelle_werte_sensor[7], 0, 1), x - 90, 520);
      float points = 6*(x-290)/700;
      String skala = "";
      if (points < 0.5) {
        skala = "nicht wahrnehmbar";
      } else if (points < 1.5) {
        skala = "sehr schwach";
      } else if (points < 2.5) {
        skala = "schwach";
      } else if (points < 3.5) {
        skala = "deutlich";
      } else if (points < 4.5) {
        skala = "stark";
      } else if (points < 5.5) {
        skala = "sehr stark";
      } else {
        skala = "extrem stark";
      }
      textAlign(CENTER);
      text(skala +  "\n(in ppb: " + sgp_tvoc_data[index - 1] + ")", x + 170, 520);
      textAlign(CORNER);
    }
    imageMode(CORNER);
    float r_sensor = 255*(x - 290)/700;
    float g_sensor = 255 - r_sensor;
    strokeWeight(4);
    stroke(r_sensor, g_sensor, 0);
    line(x, 560, x, 600);
    line(x - 20, 580, x, 600);
    line(x, 600, x + 20, 580);
  }
  strokeWeight(1);

  zur_Auswertung.y = 470;
}


void Auswertung_Station3() {
  textFont(normal);

  fill(255);
  // noStroke();
  //size(1280, 720);
  stroke(0);
  rect(50, 20, 500, 330); 
  rect(590, 20, 500, 330); 
  rect(50, 370, 500, 330); 
  rect(590, 370, 500, 330); 


  noStroke();
  fill(100);
  text("Geruch", 150, 330);
  text("Sensor", 280, 330);

  text("Geruch", 150, 680);
  text("Sensor", 280, 680);

  text("Geruch", 690, 330);
  text("Sensor", 820, 330);

  text("Geruch", 690, 680);
  text("Sensor", 820, 680);


  image(Stoff1_bild, 435, 80);
  image(Stoff2_bild, 435, 240);

  image(Stoff3_bild, 975, 80);
  image(Stoff4_bild, 975, 240);

  image(Stoff5_bild, 435, 595);
  image(Stoff6_bild, 435, 430);

  image(Stoff7_bild, 975, 595);
  image(Stoff8_bild, 975, 430);

  fill(255, 100, 100);
  rect(430, 25, 110, 50);
  rect(430, 375, 110, 50);
  rect(970, 25, 110, 50);
  rect(970, 375, 110, 50);
  fill(100, 255, 100);
  rect(430, 190, 110, 50);
  rect(430, 540, 110, 50);
  rect(970, 190, 110, 50);
  rect(970, 540, 110, 50);

  fill(0);
  textSize(14);
  textAlign(CENTER);
  text("mit Lösungs-\nmitteln", 485, 45);
  text("ohne Lösungs-\nmitteln", 485, 210);

  text("herkömmlich", 1025, 52);
  text("VOC-frei", 1025, 218);

  text("mit Lösungs-\nmitteln", 485, 395);
  text("VOC-frei", 485, 570);

  text("Eco-Boden", 1025, 405);
  text("Kork", 1025, 570);
  TVOC_Geruch_Absolviert = true;


  stroke(200);
  fill(255);
  rect(125, 75, 250, 225);
  rect(665, 75, 250, 225);
  rect(125, 425, 250, 225);
  rect(665, 425, 250, 225);
  for (int i = 1; i < 6; i++) {
    line(125, 75 + 37.5*i, 375, 75 + 37.5*i);
    line(665, 75 + 37.5*i, 915, 75 + 37.5*i);
    line(125, 425 + 37.5*i, 375, 425 + 37.5*i);
    line(665, 425 + 37.5*i, 915, 425 + 37.5*i);
  }
  fill(0);
  for (int i = 0; i < 7; i++) {
    text(6-i, 100, 80 + 37.5*i);
    text(6-i, 640, 80 + 37.5*i);
    text(6-i, 100, 430 + 37.5*i);
    text(6-i, 640, 430 + 37.5*i);
  }

  textSize(26);
  text("Lacke", 250, 60);
  text("Filzstifte", 800, 60);
  text("Kleber", 250, 400);
  text("Böden", 800, 400);

  textSize(20);
  pushMatrix();
  translate(width/2, height/2);
  rotate(3*PI/2);
  text("Riechskala", height/2 -180, -width/2 +80);
  text("Riechskala", height/2 -180, -width/2 +620);
  text("Riechskala", height/2 -525, -width/2 +620);
  text("Riechskala", height/2 -525, -width/2 +80);
  popMatrix();


  textSize(20);
  text("Legende", 1190, 30);
  textSize(16);
  textAlign(LEFT);
  text("0: nicht wahrnehmbar", 1100, 60);
  text("1: sehr schwach", 1100, 80);
  text("2: schwach", 1100, 100);
  text("3: deutlich", 1100, 120);
  text("4: stark", 1100, 140);
  text("5: sehr stark", 1100, 160);
  text("6: extrem stark", 1100, 180);

  fill(255, 100, 100);
  stroke(0);
  rect(150, 300, 30, - 37.5*tvoc_duelle_werte_mensch[0]);
  rect(280, 300, 30, -37.5*tvoc_duelle_werte_sensor[0]);

  rect(690, 300, 30, - 37.5*tvoc_duelle_werte_mensch[2]);
  rect(820, 300, 30, -37.5*tvoc_duelle_werte_sensor[2]);

  rect(150, 650, 30, - 37.5*tvoc_duelle_werte_mensch[4]);
  rect(280, 650, 30, -37.5*tvoc_duelle_werte_sensor[4]);

  rect(690, 650, 30, - 37.5*tvoc_duelle_werte_mensch[6]);
  rect(820, 650, 30, -37.5*tvoc_duelle_werte_sensor[6]);

  fill(100, 255, 100);

  rect(190, 300, 30, - 37.5*tvoc_duelle_werte_mensch[1]);
  rect(320, 300, 30, -37.5*tvoc_duelle_werte_sensor[1]);

  rect(730, 300, 30, - 37.5*tvoc_duelle_werte_mensch[3]);
  rect(860, 300, 30, -37.5*tvoc_duelle_werte_sensor[3]);

  rect(190, 650, 30, - 37.5*tvoc_duelle_werte_mensch[5]);
  rect(320, 650, 30, -37.5*tvoc_duelle_werte_sensor[5]);

  rect(730, 650, 30, - 37.5*tvoc_duelle_werte_mensch[7]);
  rect(860, 650, 30, -37.5*tvoc_duelle_werte_sensor[7]);

  //TVOC_analyse.show();
  zumObermenu2.show();
  zumObermenu2.y = 605;
  if (zumObermenu2.isClicked()) {
    delay(200);
    page = 2.5;
  }
}



void Analyse() {
  textFont(normal);
  TVOC_Duelle_Analyse.show();

  image(Stoff1_bild, 150, 200);
  image(Stoff2_bild, 450, 200);
  image(Stoff3_bild, 830, 200);
  image(Stoff4_bild, 1130, 200);
  image(Stoff6_bild, 150, 450);
  image(Stoff5_bild, 450, 450);
  image(Stoff7_bild, 825, 450);
  image(Stoff8_bild, 1135, 450);

  textAlign(CENTER);
  Geruchstest.hide();
  Duell1.show();
  Duell2.show();
  Duell3.show();
  Duell4.show();
  skalierung_angleichen.checked = false;
  if (Duell1.isClicked()) {
    delay(200);
    page = 3.2;
  }
  if (Duell2.isClicked()) {
    delay(200);
    page = 3.3;
  }
  if (Duell3.isClicked()) {
    delay(200);
    page = 3.4;
  }
  if (Duell4.isClicked()) {
    delay(200);
    page = 3.5;
  }
}




void GCMS_Peak(float x, float y, String left_right, String title, String was, String Verwendung, int anzahlGefahren, PImage[] p) {
  textAlign(CORNER);
  if (mouseX > x*scale_factor && mouseX < (x+50)*scale_factor && mouseY > y*scale_factor && mouseY < (y+50)*scale_factor) {
    if (left_right == "left") {
      fill(255);
      rect(680, 150, 580, 500);
      fill(0);
      textSize(20);
      textFont(bold);
      text(title, 700, 180);
      text("Verwendung", 700, 330);
      text("Gefahrenhinweise", 700, 490);
      textFont(normal);
      text(was, 700, 220);
      text(Verwendung, 700, 380);
      if (anzahlGefahren == 1) {
        image(p[0], 950, 520);
      }
      if (anzahlGefahren == 2) {
        image(p[0], 875, 520);
        image(p[1], 1025, 520);
      }
      if (anzahlGefahren == 3) {
        image(p[0], 800, 520);
        image(p[1], 950, 520);
        image(p[2], 1100, 520);
      }
      if (anzahlGefahren == 4) {
        image(p[0], 725, 520);
        image(p[1], 875, 520);
        image(p[2], 1025, 520);
        image(p[3], 1175, 520);
      }
    } else {
      fill(255);
      rect(20, 150, 580, 500);
      fill(0);
      textSize(20);
      textFont(bold);
      text(title, 40, 180);
      text("Verwendung", 40, 330);
      text("Gefahrenhinweise", 40, 490);
      textFont(normal);
      text(was, 40, 220);
      text(Verwendung, 40, 380);



      if (anzahlGefahren == 1) {
        image(p[0], 275, 520);
      }
      if (anzahlGefahren == 2) {
        image(p[0], 200, 520);
        image(p[1], 350, 520);
      }
      if (anzahlGefahren == 3) {
        image(p[0], 125, 520);
        image(p[1], 275, 520);
        image(p[2], 425, 520);
      }
      if (anzahlGefahren == 4) {
        image(p[0], 50, 520);
        image(p[1], 200, 520);
        image(p[2], 350, 520);
        image(p[3], 500, 520);
      }
    }
  }
  textAlign(CENTER);
}



// Farben
void Duell1_() {
  Duell_Aufgabentext.show();
  image(Stoff1_bild, 250, 150);
  image(Stoff2_bild, 950, 150);
  image(blauer_engel, 1050, 150);

  fill(255);
  stroke(200);
  rect(100, 300, 500, 300);
  rect(740, 300, 500, 300);


  stroke(0);
  line(100, 300, 100, 605);
  line(95, 600, 600, 600);

  line(95, 305, 100, 300);
  line(100, 300, 105, 305);

  line(595, 595, 600, 600);
  line(600, 600, 595, 605);

  line(740, 300, 740, 605);
  line(735, 600, 1240, 600);

  line(735, 305, 740, 300);
  line(740, 300, 745, 305);

  line(1235, 595, 1240, 600);
  line(1240, 600, 1235, 605);

  noStroke();

  textAlign(CENTER);
  fill(0);
  text("Retentionszeit", 350, 645);
  text("Retentionszeit", 1010, 645);
  pushMatrix();
  translate(width/2, height/2);
  rotate(3*PI/2);
  popMatrix();

  stroke(200);
  for (int i = 0; i < 13; i++) {
    line(100, 300 + 300*i/13, 600, 300 + 300*i/13);
    line(740, 300 + 300*i/13, 1240, 300 + 300*i/13);
  }
  for (int i = 1; i < 10; i++) {
    line(100 + 50*i, 300, 100 + 50*i, 600);
    line(740 + 50*i, 300, 740 + 50*i, 600);
  }



  float maxLack = 13.1;
  float maxLack_Eco = 1.31;
  text("Skalierung angleichen", 600, 700);
  skalierung_angleichen.show();

  if (skalierung_angleichen.checked) {
    maxLack_Eco = 13;
  }

  fill(0);
  textSize(16);
  for (int i = 0; i < 14; i++) {
    text(i, 700, 605 - 300*i/13);
    text(i, 60, 605 - 300*i/13);
  }
  textSize(20);
  text("Counts in " + 10, 750, 280);
  text("Counts in " + 10, 110, 280);
  text(9, 175, 265);
  if (skalierung_angleichen.checked) {
    text(9, 815, 265);
  } else {
    text("8", 815, 265);
  }


  stroke(0);
  for (int i = 1; i < Stinkelack_data.length; i++) {
    float x1 = 100 + 500*(i-1)/Stinkelack_data.length;
    float x2 = 100 + 500*i/Stinkelack_data.length;
    float y1 = 600 - 300*Stinkelack_data[i-1]/maxLack;
    float y2 = 600 - 300*Stinkelack_data[i]/maxLack;
    if (y2 > 300 && y1 > 300) {
      line(x1, y1, x2, y2);
    }
  }


  stroke(0);


  for (int i = 1; i < GuterLack_data.length; i++) {
    float x1 = 740 + 500*(i-1)/GuterLack_data.length;
    float x2 = 740 + 500*i/GuterLack_data.length;
    float y1 = 600 - 300*GuterLack_data[i-1]/maxLack_Eco;
    float y2 = 600 - 300*GuterLack_data[i]/maxLack_Eco;
    if (y2 > 300 && y1 > 300) {
      line(x1, y1, x2, y2);
    }
  }
  println(page);

  ///////////////////////////////////////
  fill(255);
  stroke(0);
  rect(120, 500 - 0.6*220/maxLack, 50, 50);
  rect(240, 320 - 0.6*220/maxLack, 50, 50);
  rect(340, 280 - 0.6*220/maxLack, 50, 50);
  rect(430, 370 - 0.6*220/maxLack, 50, 50);
  fill(0);
  textAlign(CENTER);
  textSize(30);
  text("?", 145, 535 - 0.6*220/maxLack);
  text("?", 265, 355 - 0.6*220/maxLack);
  text("?", 365, 315 - 0.6*220/maxLack);
  text("?", 455, 405 - 0.6*220/maxLack);


  fill(255);
  stroke(0);
  rect(785, 510 - 0.6*220/maxLack_Eco, 50, 50);
  rect(950, 420 - 0.6*220/maxLack_Eco, 50, 50);
  rect(1030, 440 - 0.6*220/maxLack_Eco, 50, 50);
  rect(1090, 510 - 0.6*220/maxLack_Eco, 50, 50);
  rect(1160, 540 - 0.6*220/maxLack_Eco, 50, 50);
  fill(0);
  textAlign(CENTER);
  textSize(30);
  text("?", 785 + 25, 545 - 0.6*220/maxLack_Eco);
  text("?", 950 + 25, 420 + 35 - 0.6*220/maxLack_Eco);
  text("?", 1030 + 25, 440 + 35 - 0.6*220/maxLack_Eco);
  text("?", 1090 + 25, 510 + 35 - 0.6*220/maxLack_Eco);
  text("?", 1160 + 25, 540 + 35 - 0.6*220/maxLack_Eco);
  //////////////////////////////////////
  PImage[] Hexamethyldisiloxan = {entzuendlich, umweltschaedlich};
  PImage[] Octamethylcyclotetrasiloxan = {entzuendlich, gesundheitsschaedlich};
  PImage[] Ethylhexanol = {reizend};
  PImage[] Essigsaeure = {entzuendlich, aetzend};
  PImage[] Ameisensaeure = {entzuendlich, giftig, aetzend};


  PImage[] Methylpentanol = {entzuendlich, reizend};
  PImage[] SchwefligeSaeure = {aetzend, reizend};
  PImage[] Cyclohexan = {entzuendlich, gesundheitsschaedlich, reizend, umweltschaedlich};
  PImage[] Naphtalin = {entzuendlich, gesundheitsschaedlich, reizend, umweltschaedlich};

  GCMS_Peak(120, 500 - 0.6*220/maxLack, "left", "4-Methyl-2-pentanol", "4-Methyl-2-pentanol ist farblose Flüssigkeit mit süßlich-\nem Geruch.", "Es wird hauptsächlich für die Herstellung von Schmieröl-\nadditiven und als Aufschäumer für die Flotation von\nMetallerzeneingesetzt.", 2, Methylpentanol);
  GCMS_Peak(240, 320 - 0.6*220/maxLack, "left", "Cyclohexan", "Cyclohexan ist eine farblose Flüssigkeit, die bei der kata-\nlytischen Hydrierung von Benzol entsteht. Inhalation\nführt zu Kopfschmerzen, Übelkeit und Schwindel.", "Es wird zur Produktion von Kunstfasern wie Nylon oder\nals Lösungsmittel verwendet.", 4, Cyclohexan);
  GCMS_Peak(340, 280 - 0.6*220/maxLack, "left", "Naphthalin", "Naphthalin ist ein bicyclischer Kohlenwasserstoff mit\ncharakteristischen Geruch nach Mottenpulver oder Teer.", "Früher war es Hauptbestandteil von Mottenkugeln.\nEs wird zur Synthese von Holzschutzmittel verwendet.", 4, Naphtalin);
  GCMS_Peak(430, 370 - 0.6*220/maxLack, "left", "Schwefelige Säure (verdünnte Schwefelsäure)", "Schwefelige Säure ist eine unbeständige, nur in wässriger\nLösung existierende, zweiprotonige Säure, die beim\nLösen von Schwefeldioxid in Wasser entsteht.", "Es eignet sich  als Bleich- und Desinfektionsmittel,\nsowie zum Schwefeln von Fässern gegen Schädlinge.", 2, SchwefligeSaeure);

  GCMS_Peak(785, 510 - 0.6*220/maxLack_Eco, "right", "Hexamethyldisiloxan", "Hexamethyldisiloxan ist eine farblose Flüssigkeit mit\ncharakteristischem Geruch.", "Herstellung von quarzähnlichen Schichten oder Flamm-\nbeschichtung.", 2, Hexamethyldisiloxan);
  GCMS_Peak(950, 420 - 0.6*220/maxLack_Eco, "right", "Octamethylcyclotetrasiloxan", "Octamethylcyclotetrasiloxan ist eine farblose Flüssigkeit\nmit schwachem Geruch.", "Ausgangsstoff bei der Herstellung von Gummi, Fahr-\nzeugpflegeprodukten, Entschäumern und Abdichtungen.", 2, Octamethylcyclotetrasiloxan);
  GCMS_Peak(1030, 440 - 0.6*220/maxLack_Eco, "right", "2-Ethylhexanol", "2-Ethylhexanol ist farblose Flüssigkeit mit alkohol-\nartigem Geruch.", "Durch Reaktion mit Phthalsäure entsteht ein Weich-\nmacher, der häufig in PVC zu finden ist. Selten wird es\nals Lösungsmittel verwendet.", 1, Ethylhexanol);
  GCMS_Peak(1090, 510 - 0.6*220/maxLack_Eco, "right", "Essigsäure", "Essigsäure ist stechend riechende Flüssigkeit mit charak-\nteristischem Geruch.", "Es hat eine große Bedeutung als Geschmacksstoff,\nwird aber auch aufgrund ihres abtötenden Effekts gegen-\nüber Bakterien eingesetzt.", 2, Essigsaeure);
  GCMS_Peak(1160, 540 - 0.6*220/maxLack_Eco, "right", "Ameisensäure", "Ameisensäure ist eine farblose, ätzende und in Wasser\nlösliche Flüssigkeit, die in der Natur vielfach von Lebe-\nwesen zu Verteidigungszwecken genutzt wird.", "Sie tötet zudem Bakterien gut ab und wird in der che-\nmischen Industrie zur Neutralisation von alkalischen\nReaktionsgemischen genutzt.", 3, Ameisensaeure);
}

// Filzstifte
void Duell2_() {
  Duell_Aufgabentext.show();
  image(Stoff3_bild, 250, 150);
  image(Stoff4_bild, 950, 150);
  image(blauer_engel, 1050, 150);


  fill(255);
  stroke(200);
  rect(100, 300, 500, 300);
  rect(740, 300, 500, 300);


  stroke(0);
  line(100, 300, 100, 605);
  line(95, 600, 600, 600);

  line(95, 305, 100, 300);
  line(100, 300, 105, 305);

  line(595, 595, 600, 600);
  line(600, 600, 595, 605);

  line(740, 300, 740, 605);
  line(735, 600, 1240, 600);

  line(735, 305, 740, 300);
  line(740, 300, 745, 305);

  line(1235, 595, 1240, 600);
  line(1240, 600, 1235, 605);

  noStroke();

  textAlign(CENTER);
  fill(0);
  text("Retentionszeit", 350, 645);
  text("Retentionszeit", 1010, 645);
  pushMatrix();
  translate(width/2, height/2);
  rotate(3*PI/2);
  popMatrix();
  stroke(200);
  for (int i = 0; i < 7; i++) {
    line(100, 300 + 300*i/7, 600, 300 + 300*i/7);
    line(740, 300 + 300*i/7, 1240, 300 + 300*i/7);
  }
  for (int i = 1; i < 10; i++) {
    line(100 + 50*i, 300, 100 + 50*i, 600);
    line(740 + 50*i, 300, 740 + 50*i, 600);
  }

  stroke(0);


  float maxEdding = 6;
  float maxEdding_Eco = 0.6;



  text("Skalierung angleichen", 600, 700);
  skalierung_angleichen.show();

  if (skalierung_angleichen.checked) {
    maxEdding_Eco = 6;
  }

  fill(0);
  textSize(16);
  for (int i = 0; i < 7; i++) {
    text(i, 700, 605 - 300*i/6);
    text(i, 60, 605 - 300*i/6);
  }
  textSize(20);
  text("Counts in " + 10, 750, 280);
  text("Counts in " + 10, 110, 280);
  text(9, 175, 265);
  if (skalierung_angleichen.checked) {
    text(9, 815, 265);
  } else {
    text("8", 815, 265);
  }


  stroke(0);
  for (int i = 1; i < Edding_data.length; i++) {
    float x1 = 100 + 500*(i-1)/Edding_data.length;
    float x2 = 100 + 500*i/Edding_data.length;
    float y1 = 600 - 300*Edding_data[i-1]/maxEdding;
    float y2 = 600 - 300*Edding_data[i]/maxEdding;

    line(x1, y1, x2, y2);
  }

  for (int i = 1; i < Eco_Edding_data.length; i++) {
    float x1 = 740 + 500*(i-1)/Eco_Edding_data.length;
    float x2 = 740 + 500*i/Eco_Edding_data.length;
    float y1 = 600 - 300*Eco_Edding_data[i-1]/maxEdding_Eco;
    float y2 = 600 - 300*Eco_Edding_data[i]/maxEdding_Eco;

    line(x1, y1, x2, y2);
  }

  ///////////////////////////////////////
  fill(255);
  stroke(0);
  rect(110, 300, 50, 50);
  rect(200, 350, 50, 50);
  rect(300, 520, 50, 50);
  rect(420, 520, 50, 50);
  fill(0);
  textAlign(CENTER);
  textSize(30);
  text("?", 110 + 25, 300 + 35);
  text("?", 200 + 25, 350 + 35);
  text("?", 300 + 25, 520 + 35);
  text("?", 420 + 25, 520 + 35);
  fill(255);
  stroke(0);
  rect(785, 530 - 0.6*220/maxEdding_Eco, 50, 50);
  rect(890, 520 + 2*maxEdding_Eco, 50, 50);
  rect(1160, 480 + 8*maxEdding_Eco, 50, 50);
  fill(0);
  textAlign(CENTER);
  textSize(30);
  text("?", 785 + 25, 565 - 0.6*220/maxEdding_Eco);
  text("?", 890 + 25, 520 + 35 + 2*maxEdding_Eco);
  text("?", 1160 + 25, 515 + 8*maxEdding_Eco);
  //////////////////////////////////////
  PImage[] Formamid = {gesundheitsschaedlich};
  PImage[] n_Dodecan = {gesundheitsschaedlich};
  ///
  PImage[] Isopropanol = {entzuendlich, reizend};
  PImage[] Ethylbenzol = {entzuendlich, gesundheitsschaedlich, reizend};
  PImage[] Acrylsaeure = {entzuendlich, aetzend, reizend, umweltschaedlich};

  GCMS_Peak(110, 300, "left", "N-methoxy-Formamid", "Formamid ist das Amid der Ameisensäure und das\neinfachste Carbonsäureamid.", "Es ist ein häufig verwendetes Lösungsmittel, etwa für\nLacke, bestimmte Polymere und Beize sowie Tinte\nin Filzstiften.", 1, Formamid);
  GCMS_Peak(200, 350, "left", "Isopropanol", "Isopropanol (manchmal auch 2-Propanol) ist eine farb-\nlose Flüssigkeit mit charakteristischem, alkoholartigem\nGeruch.", "Es wird als Lösungsmittel für Fette, Lacke, Harze und\nTinte eingesetzt.", 2, Isopropanol);
  GCMS_Peak(300, 520, "left", "Ethylbenzol", "Ethylbenzol ist eine farblose, benzolähnlich riechende\nFlüssigkeit und ein aromatischer Kohlenwasserstoff.", "Es ist Lösungsmittel für Farben und findet sich in Kunst-\nstoffen. Neben Benzol und Toluol gehört Ethylbenzol zu\nden technisch wichtigen Aromaten.", 3, Ethylbenzol);
  GCMS_Peak(420, 520, "left", "n-Dodekan", "n-Dodekan ist eine farblose, brennbare, mild riechende\nFlüssigkeit", "Es wird bei der Wiederaufarbeitung abgebrannter Brenn-\nelemente als Lösungsmittel bei der Extraktion von Uran\nund Plutonium eingesetzt und ist Bestandteil von Diesel.", 1, n_Dodecan);
  //////
  GCMS_Peak(785, 530 - 0.6*220/maxEdding_Eco, "right", "Isopropanol", "Isopropanol (manchmal auch 2-Propanol) ist eine farb-\nlose Flüssigkeit mit charakteristischem, alkoholartigem\nGeruch.", "Es wird als Lösungsmittel für Fette, Lacke, Harze und\nTinte eingesetzt.", 2, Isopropanol);
  GCMS_Peak(890, 520 + 2*maxEdding_Eco, "right", "Ethylbenzol", "Ethylbenzol ist eine farblose, benzolähnlich riechende\nFlüssigkeit und ein aromatischer Kohlenwasserstoff.", "Es ist Lösungsmittel für Farben und findet sich in Kunst-\nstoffen. Neben Benzol und Toluol gehört Ethylbenzol zu\nden technisch wichtigen Aromaten.", 3, Ethylbenzol);
  GCMS_Peak(1160, 480 + 8*maxEdding_Eco, "right", "Acrylsäure", "Acrylsäure ist eine farblose Flüssigkeit mit penetrantem,\nekelerregenden Geruch.", "Ihre Hauptverwendung ist die Polymerisation zu\nSuperabsorbern (Anwendung z. B. in Windeln).", 4, Acrylsaeure);
}


// Kleber
void Duell3_() {
  Duell_Aufgabentext.show();
  image(Stoff5_bild, 950, 150);
  image(Stoff6_bild, 250, 150);
  image(blauer_engel, 1050, 150);

  fill(255);
  stroke(200);
  rect(100, 300, 500, 300);
  rect(740, 300, 500, 300);


  stroke(0);
  line(100, 300, 100, 605);
  line(95, 600, 600, 600);

  line(95, 305, 100, 300);
  line(100, 300, 105, 305);

  line(595, 595, 600, 600);
  line(600, 600, 595, 605);

  line(740, 300, 740, 605);
  line(735, 600, 1240, 600);

  line(735, 305, 740, 300);
  line(740, 300, 745, 305);

  line(1235, 595, 1240, 600);
  line(1240, 600, 1235, 605);

  noStroke();

  textAlign(CENTER);
  fill(0);
  text("Retentionszeit", 350, 645);
  text("Retentionszeit", 1010, 645);
  pushMatrix();
  translate(width/2, height/2);
  rotate(3*PI/2);
  // text("Counts / a.u.", -height/2 + (270)*scale_factor, -width/2+(50*scale_factor));
  // text("Counts / a.u.", -height/2 + (270)*scale_factor, -width/2+(700*scale_factor));
  popMatrix();

  stroke(200);
  for (int i = 0; i < 12; i++) {
    line(100, 300 + 300*i/12, 600, 300 + 300*i/12);
    line(740, 300 + 300*i/12, 1240, 300 + 300*i/12);
  }
  for (int i = 1; i < 10; i++) {
    line(100 + 50*i, 300, 100 + 50*i, 600);
    line(740 + 50*i, 300, 740 + 50*i, 600);
  }



  float maxBastelkleber = 0.22;
  float maxSekundenkleber = 4.4;



  text("Skalierung angleichen", 600, 700);
  skalierung_angleichen.show();

  if (skalierung_angleichen.checked) {
    maxBastelkleber = 44;
  }


  fill(0);
  textSize(16);
  stroke(200);
  for (int i = 0; i < 12; i++) {
    if (skalierung_angleichen.checked) {
      text(nf(0.4*i, 0, 1), 700, 605 - 300*i/11);
    } else {
      text(nf(0.2*i, 0, 1), 700, 605 - 300*i/11);
    }
    text(nf(0.4*i, 0, 1), 60, 605 - 300*i/11);
  }
  textSize(20);
  text("Counts in " + 10, 750, 280);
  text("Counts in " + 10, 110, 280);
  text(9, 175, 265);
  if (skalierung_angleichen.checked) {
    text(9, 815, 265);
  } else {
    text(7, 815, 265);
  }
  stroke(0);

  for (int i = 1; i < Sekundenkleber_data.length; i++) {
    float x1 = 100 + 500*(i-1)/Sekundenkleber_data.length;
    float x2 = 100 + 500*i/Sekundenkleber_data.length;
    float y1 = 600 - 300*Sekundenkleber_data[i-1]/maxSekundenkleber;
    float y2 = 600 - 300*Sekundenkleber_data[i]/maxSekundenkleber;

    line(x1, y1, x2, y2);
  }

  for (int i = 1; i < Bastelkleber_data.length; i++) {
    float x1 = 740 + 500*(i-1)/Bastelkleber_data.length;
    float x2 = 740 + 500*i/Bastelkleber_data.length;
    float y1 = 600 - 300*Bastelkleber_data[i-1]/maxBastelkleber;
    float y2 = 600 - 300*Bastelkleber_data[i]/maxBastelkleber;

    line(x1, y1, x2, y2);
  }

  ///////////////////////////////////////
  fill(255);
  stroke(0);
  rect(750, 300 + maxBastelkleber*5, 50, 50);
  rect(940, 440+ maxBastelkleber*2, 50, 50);
  rect(1125, 390+ maxBastelkleber*3, 50, 50);

  fill(0);
  textAlign(CENTER);
  textSize(30);
  text("?", 750 + 25, 300 + maxBastelkleber*5 + 35);
  text("?", 940 + 25, 440+ maxBastelkleber*2 + 35);
  text("?", 1125 + 25, 390+ maxBastelkleber*3 + 35);

  fill(255);
  stroke(0);


  rect(110, 500, 50, 50);
  rect(300, 330, 50, 50);
  rect(420, 500, 50, 50);
  fill(0);
  textAlign(CENTER);
  textSize(30);
  text("?", 110 + 25, 535);
  text("?", 300 + 25, 365);
  text("?", 420 + 25, 535);
  //////////////////////////////////////
  PImage[] Butanol = {entzuendlich, aetzend, gesundheitsschaedlich};
  PImage[] n_Butyl_Ester = {entzuendlich, reizend};
  PImage[] buttersaeure = {aetzend, reizend};
  ///
  PImage[] Methacrylsaeuremethylester = {entzuendlich, reizend};
  PImage[] Cyanacrylate = {reizend};
  PImage[] Undecane = {gesundheitsschaedlich};

  GCMS_Peak(750, 300 + maxBastelkleber*5, "right", "1-Butanol", "1-Butanol ist eine farblose Flüssigkeit mit ethanolartigem\nGeruch.", "Es wird als Lösungsmittel bei der Herstellung von Lacken\nverwendet. Es verhindert das Weißanlaufen beim Trock-\nnen der Lacke in feuchter Umgebung.", 3, Butanol);
  GCMS_Peak(940, 440 + maxBastelkleber*2, "right", "Essigsäure-N-Butylester", "Essigsäure-N-Butylester ist ein klares, farbloses Lösungs-\nmittel mit eher angennehmem, fruchtartigem Geruch.", "Es ist ein weitverbreitetes Lacklösungsmittel. Aufgrund\nseiner starken Lösungskraft findet es auch als Bestandteil\nvon Nagellackentfernern und Verdünnern Verwendung. ", 2, n_Butyl_Ester);
  GCMS_Peak(1130, 390+ maxBastelkleber*3, "right", "Buttersäure", "Buttersäure ist eine farblose, unangenehm riechende\nFlüssigkeit. Sie entsteht in der Natur durch Butter-\nsäuregärung.", "Sie findet Anwendung in Biokraftstoffen, sowie in der\npharmazeutischen und chemischen Industrie.", 2, buttersaeure);


  //////
  GCMS_Peak(110, 500, "left", "Methacrylsäuremethylester", "Methacrylsäuremethylester ist eine farblose Flüssigkeit\nmit unangenehm esterartigem Geruch. Es ist leicht\nentzündlich und verdunstet leicht.", "Es wird vornehmlich zur Herstellung von Acrylglas ver-\nwendet. Weiterhin ist es, in der Regel, der Hauptbestand-\nteil jeder Dentalprothese aus Kunststoff.", 2, Methacrylsaeuremethylester);
  GCMS_Peak(300, 330, "left", "Cyanacrylate", "Das sind polymerisierbare, bei Raumtemperatur flüssige\nchemische Verbindungen (Monomere), die häufig als\nKlebstoffe verwendet werden.", "Früher wurden sie verwendet, um menschliche Wunden\nzu kleben. Heute finden sie hauptsächlich Einsatz in\nSekundenklebern.", 1, Cyanacrylate);
  GCMS_Peak(420, 500, "left", "Undecane", "Die Stoffgruppe der Undecane umfasst insgesamt\n159 weitere, verzweigte Konstitutionsisomere.", "n-Undecan ist unter anderem ein Bestandteil von Benzin\nund Dieselkraftstoff. ", 1, Undecane);
}


// Böden
void Duell4_() {
  Duell_Aufgabentext.show();
  image(Stoff7_bild, 250, 150);
  image(Stoff8_bild, 950, 150);

  fill(255);
  stroke(200);
  rect(100, 300, 500, 300);
  rect(740, 300, 500, 300);


  stroke(0);
  line(100, 300, 100, 605);
  line(95, 600, 600, 600);

  line(95, 305, 100, 300);
  line(100, 300, 105, 305);

  line(595, 595, 600, 600);
  line(600, 600, 595, 605);

  line(740, 300, 740, 605);
  line(735, 600, 1240, 600);

  line(735, 305, 740, 300);
  line(740, 300, 745, 305);

  line(1235, 595, 1240, 600);
  line(1240, 600, 1235, 605);

  noStroke();

  textAlign(CENTER);
  fill(0);
  text("Retentionszeit", 350, 645);
  text("Retentionszeit", 1010, 645);
  pushMatrix();
  translate(width/2, height/2);
  rotate(3*PI/2);
  //text("Counts / a.u.", -height/2 + (270)*scale_factor, -width/2+(50*scale_factor));
  //text("Counts / a.u.", -height/2 + (270)*scale_factor, -width/2+(700*scale_factor));


  popMatrix();
  float max_Eco_Boden = 0.25;
  float max_Kork = 0.1;
  text("Skalierung angleichen", 600, 700);
  skalierung_angleichen.show();

  if (skalierung_angleichen.checked) {
    max_Kork = 0.25;
  }

  fill(0);
  textSize(16);
  stroke(200);
  for (int i = 0; i < 11; i++) {
    if (skalierung_angleichen.checked) {
      text(nf(0.25*i, 0, 2), 60, 605 - 300*i/10);
    } else {
      text(i, 60, 605 - 300*i/10);
    }
    text(nf(0.25*i, 0, 2), 700, 605 - 300*i/10);
  }
  textSize(20);
  text("Counts in " + 10, 750, 280);
  text("Counts in " + 10, 110, 280);
  text(8, 815, 265);
  if (skalierung_angleichen.checked) {
    text(8, 175, 265);
  } else {
    text("7", 175, 265);
  }



  stroke(200);
  for (int i = 0; i < 10; i++) {
    line(100, 300 + 30*i, 600, 300 + 30*i);
    line(740, 300 + 30*i, 1240, 300 + 30*i);
    if (i!=0) {
      line(100 + 50*i, 300, 100 + 50*i, 600);
      line(740 + 50*i, 300, 740 + 50*i, 600);
    }
  }


  stroke(0);
  for (int i = 1; i < Kork_Boden_data.length; i++) {
    float x1 = 100 + 500*(i-1)/Kork_Boden_data.length;
    float x2 = 100 + 500*i/Kork_Boden_data.length;
    float y1 = 600 - 300*Kork_Boden_data[i-1]/max_Kork;
    float y2 = 600 - 300*Kork_Boden_data[i]/max_Kork;

    line(x1, y1, x2, y2);
  }


  for (int i = 1; i < Eco_Boden_data.length; i++) {
    float x1 = 740 + 500*(i-1)/Eco_Boden_data.length;
    float x2 = 740 + 500*i/Eco_Boden_data.length;
    float y1 = 600 - 300*Eco_Boden_data[i-1]/max_Eco_Boden;
    float y2 = 600 - 300*Eco_Boden_data[i]/max_Eco_Boden;

    line(x1, y1, x2, y2);
  }





  ///////////////////////////////////////
  fill(255);
  stroke(0);
  rect(145, 360 + max_Kork*500, 50, 50);
  rect(270, 280+ max_Kork*700, 50, 50);
  rect(420, 320+ max_Kork*500, 50, 50);

  fill(0);
  textAlign(CENTER);
  textSize(30);
  text("?", 145 + 25, 360 + max_Kork*500 + 35);
  text("?", 270 + 25, 280+ max_Kork*700 + 35);
  text("?", 420 + 25, 320+ max_Kork*500 + 35);

  fill(255);
  stroke(0);
  rect(770, 500, 50, 50);
  rect(940, 330, 50, 50);
  rect(1070, 330, 50, 50);
  fill(0);
  textAlign(CENTER);
  textSize(30);
  text("?", 770 + 25, 535);
  text("?", 940 + 25, 365);
  text("?", 1070 + 25, 365);
  //////////////////////////////////////
  PImage[] Ethylenglycolmonobutylether = {giftig};  ////////?????????????????????????????????
  PImage[] n_Decan = {entzuendlich, gesundheitsschaedlich};
  ///
  PImage[] Isopropanol = {entzuendlich, reizend};
  PImage[] Cyclopentanon = {entzuendlich, reizend};
  PImage[] Hexanol = {entzuendlich, gesundheitsschaedlich};

  GCMS_Peak(145, 360 + max_Kork*500, "left", "Isopropanol", "Isopropanol (manchmal auch 2-Propanol) ist eine farb-\nlose Flüssigkeit mit charakteristischem, alkoholartigem\nGeruch.", "Es wird als Lösungsmittel für Fette, Lacke, Harze und\nTinte eingesetzt.",2, Isopropanol);
  GCMS_Peak(270, 280 + max_Kork*700, "left", "Ethylenglycolmonobutylether", "Ethylenglycolmonobutylether ist eine farblose Flüssig-\nkeit mit schwach etherischem Geruch.", "Es wird als Lösungsmittel für Druckfarben, Verdünn-\nungsmittel, Veredelungsmittel und zur Herstellung von\nLacken verwendet", 1, Ethylenglycolmonobutylether);
  GCMS_Peak(420, 320+ max_Kork*500, "left", "n-Decan", "n-Decan ist eine farblose Flüssigkeit und eine\norganische chemische Verbindung aus der Gruppe der\nhöheren Alkane.", "Decane sind Bestandteil von Kraftstoffen, zum Beispiel\nfür Autos und Flugzeuge.", 2, n_Decan);


  //////
  GCMS_Peak(770, 500, "right", "Isopropanol", "Isopropanol (manchmal auch 2-Propanol) ist eine farb-\nlose Flüssigkeit mit charakteristischem, alkoholartigem\nGeruch.", "Es wird als Lösungsmittel für Fette, Lacke, Harze und\nTinte eingesetzt.", 2, Isopropanol);
  GCMS_Peak(940, 330, "right", "Cyclopentanon", "Cyclopentanon ist eine farblose Flüssigkeit mit schwach-\nem pfefferminzartigem Geruch.", "In der Mikroelektronik wird Cyclopentanon als Lösungs-\nmittel für Fotolacke und Polyimide verwendet.", 2, Cyclopentanon);
  GCMS_Peak(1070, 330, "right", "1-Hexanol", "1-Hexanol ist eine farblose Flüssigkeit mit süßlichem\nGeruch.", "Es wird zuweilen in der organischen Chemie als Lösungs-\nmittel für Kohlenwasserstoffe, Schellack, Leinöl,\nHormone und viele Harze eingesetzt.", 2, Hexanol);
}








void Zusammenfassung_Mensch_Sensor() {
  TVOC_Duelle_uebertragen.show();
  translate(0, 40);

  noFill();
  stroke(0);
  rect(200, 50, 400, 550);  
  rect(50, 150, 550, 450);
  rect(350, 600, 250, 70);

  rect(680, 50, 400, 550);
  rect(680, 150, 400, 450);
  rect(680, 600, 250, 70);


  for (int i = 0; i < 2; i++) {
    for (int j = 0; j < 4; j++) {
      rect(360 + 130*i, 170 + 105*j, 90, 90); 
      rect(700 + 130*i, 170 + 105*j, 90, 90);
    }
  }


  textFont(bold);
  textSize(30);
  textAlign(CENTER);
  text("herkömmliche\nProdukte", 400, 90);
  text("emissionsarme\nVergleichsprodukte", 880, 90);

  text("Nase     Sensor", 485, 645);
  text("Nase     Sensor", 810, 645);
  textFont(normal);
  textSize(35);
  text("Farben", 125, 215);
  text("Filzstifte", 125, 320);
  text("Kleber", 125, 425);
  text("Böden", 125, 530);

  for (int i = 0; i < 5; i++) {
    text("vs.", 645, 120 + 105*i);
  }


  text(nf(tvoc_duelle_werte_mensch[0], 0, 1), 405, 225 + 105*0); 
  text(nf(tvoc_duelle_werte_mensch[1], 0, 1), 745, 225 + 105*0);
  text(nf(tvoc_duelle_werte_mensch[2], 0, 1), 405, 225 + 105*1); 
  text(nf(tvoc_duelle_werte_mensch[3], 0, 1), 745, 225 + 105*1); 
  text(nf(tvoc_duelle_werte_mensch[4], 0, 1), 745, 225 + 105*2); 
  text(nf(tvoc_duelle_werte_mensch[5], 0, 1), 405, 225 + 105*2); 
  text(nf(tvoc_duelle_werte_mensch[6], 0, 1), 405, 225 + 105*3); 
  text(nf(tvoc_duelle_werte_mensch[7], 0, 1), 745, 225 + 105*3); 


  text(nf(tvoc_duelle_werte_sensor[0], 0, 1), 535, 225 + 105*0); 
  text(nf(tvoc_duelle_werte_sensor[1], 0, 1), 875, 225 + 105*0);
  text(nf(tvoc_duelle_werte_sensor[2], 0, 1), 535, 225 + 105*1); 
  text(nf(tvoc_duelle_werte_sensor[3], 0, 1), 875, 225 + 105*1); 
  text(nf(tvoc_duelle_werte_sensor[4], 0, 1), 535, 225 + 105*2); 
  text(nf(tvoc_duelle_werte_sensor[5], 0, 1), 875, 225 + 105*2); 
  text(nf(tvoc_duelle_werte_sensor[6], 0, 1), 535, 225 + 105*3); 
  text(nf(tvoc_duelle_werte_sensor[7], 0, 1), 875, 225 + 105*3); 

  textSize(20);
  text("Legende", 1190, 30);
  textSize(16);
  textAlign(LEFT);
  text("0: nicht wahrnehmbar", 1100, 60);
  text("1: sehr schwach", 1100, 80);
  text("2: schwach", 1100, 100);
  text("3: deutlich", 1100, 120);
  text("4: stark", 1100, 140);
  text("5: sehr stark", 1100, 160);
  text("6: extrem stark", 1100, 180);


  textAlign(CORNER);
  image(Stoff1_bild, 230, 170);
  image(Stoff2_bild, 950, 170);
  image(Stoff3_bild, 230, 275);
  image(Stoff4_bild, 950, 275);
  image(Stoff5_bild, 950, 380);
  image(Stoff6_bild, 230, 380);
  image(Stoff7_bild, 230, 485);
  image(Stoff8_bild, 950, 485);
  zur_Auswertung.y = 530;
  zur_Auswertung.show();  

  if (zur_Auswertung.isClicked()) {
    delay(200);
    page = 3.1111;
  }
  translate(0, -40);
}








float[] Stinkelack_time = {4.731845, 4.765857, 4.799868, 4.833878, 4.86789, 4.901902, 4.935913, 4.969923, 5.003935, 5.037947, 5.071957, 5.105968, 5.13998, 5.17399, 5.208002, 5.242013, 5.276025, 5.310035, 5.344047, 5.378058, 5.412068, 5.44608, 5.480092, 5.514102, 5.548113, 5.582125, 5.616135, 5.650147, 5.684158, 5.71817, 5.75218, 5.786192, 5.820203, 5.854213, 5.888225, 5.922237, 5.956247, 
  5.990258, 6.02427, 6.058282, 6.092292, 6.126303, 6.160315, 6.194325, 6.228337, 6.262348, 6.296358, 6.33037, 6.364382, 6.398393, 6.432403, 6.466415, 6.500427, 6.534437, 6.568448, 6.60246, 6.63647, 6.670482, 6.704493, 6.738505, 6.772515, 6.806527, 6.84058, 6.874548, 6.90856, 6.942572, 6.976582, 7.010593, 7.044605, 7.078617, 7.112627, 7.146638, 7.18065, 7.21466, 7.248672, 7.282683, 7.316693, 7.350705, 7.384717, 7.418728, 7.452738, 7.48675, 7.520762, 7.554772, 7.588783, 7.622795, 7.656805, 7.690817, 7.724828, 7.758838, 7.79285, 7.826862, 7.860873, 7.894883, 7.928895, 7.962907, 7.996917, 8.030928, 8.06494, 8.09895, 8.132962, 8.166973, 8.200985, 8.234995, 8.269007, 8.303018, 8.337028, 8.37104, 8.405052, 8.439062, 8.473073, 8.507085, 8.541097, 8.575107, 8.609118, 8.64313, 8.67714, 8.711152, 8.745163, 8.779173, 8.813185, 8.847197, 8.881208, 8.915218, 8.94923, 8.983242, 9.017252, 9.051263, 9.085275, 9.119285, 
  9.153297, 9.187308, 9.221318, 9.25533, 9.289342, 9.323353, 9.357363, 9.391375, 9.425387, 9.459397, 9.493408, 9.52742, 9.56143, 9.595442, 9.629453, 9.663465, 9.697475, 9.731487, 9.765498, 9.799508, 9.83352, 9.867532, 9.901542, 9.935553, 9.969565, 10.003577, 10.037587, 10.071598, 10.10561, 10.13962, 10.173632, 10.207643, 10.241653, 10.275665, 10.309677, 10.343688, 10.377698, 10.41171, 10.445722, 10.479732, 10.513743, 10.547755, 10.581765, 10.615777, 10.649788, 10.683798, 10.71781, 10.751822, 10.785833, 10.819843, 10.853855, 10.887867, 10.921877, 10.955888, 10.9899, 11.02391, 11.057922, 11.091933, 11.125945, 11.159955, 11.193967, 11.227978, 11.261988, 11.296, 11.330012, 11.364022, 11.398033, 11.432045, 11.466057, 11.500067, 11.534078, 11.56809, 11.6021, 11.636112, 11.670123, 11.704133, 11.738145, 11.772157, 11.806168, 11.840178, 11.87419, 11.908202, 11.942212, 11.976223, 12.010235, 12.044245, 12.078257, 12.112268, 12.14628, 12.18029, 12.214302, 12.248313, 12.282323, 12.316335, 12.350347, 12.384357, 12.418368, 12.45238, 12.486392, 12.520402, 12.554413, 12.588425, 12.622435, 12.656447, 12.690458, 12.724468, 12.75848, 12.792492, 12.826503, 12.860513, 12.894525, 12.928537, 12.962547, 12.996558, 13.03057, 13.06458, 13.098592, 13.132603, 13.166615, 13.200625, 13.234637, 13.268648, 13.302658, 13.33667, 13.370682, 13.404692, 13.438703, 13.472715, 13.506725, 13.540737, 13.574748, 13.60876, 13.64277, 13.676782};

// Faktor 10^9
float[] Stinkelack_data = {0.29857860587, 0.2804835746, 0.25861355494, 0.2256592896, 0.19095247462, 0.16449435395, 0.142708873, 0.1287138391, 0.12135603468, 0.12445999485, 0.13381519396, 0.14545786155, 0.21131845609, 0.36415062354, 0.57209938816, 0.7589633477, 0.95276387389, 1.04592421084, 1.11811701876, 1.15112653896, 1.1175639533, 1.04936952423, 0.92845175642, 0.76489174157, 0.61330665911, 0.49355976805, 0.43216438664, 0.39524662679, 0.37731262213, 0.33956702914, 0.28174416492, 0.21409036197, 0.16310179797, 0.14555160448, 0.18359504125, 0.27163615901, 0.43633827594, 0.73374548904, 1.0876036, 1.38598261699, 1.57990531608, 1.68098966, 1.63536099636, 1.43084454779, 1.17099873648, 1.01924214987, 0.95971924227, 1.336315128, 0.98935728741, 0.9413788995, 0.71254524351, 0.44569734278, 0.2117483173, 0.09673498382, 0.05899137706, 0.1225231108, 0.397, 0.701569, 0.85269673151, 1.35976018126, 1.90149597713, 2.28755549073, 2.2266198, 1.63416032064, 0.95748339375, 0.60931338977, 0.50711745304, 0.41344022622, 0.36696251909, 0.39845531, 0.56445537412, 0.75912248887, 1.437794957, 1.28972172532, 1.36492617923, 1.15480728139, 0.98367305473, 0.89429037648, 1.3514121354, 2.66368891187, 4.17830515969, 5.283983644, 5.85804552745, 5.87263308046, 5.46032606886, 5.63565537716, 3.62054792, 7, 3.19275732706, 2.25234953366, 2.59383144164, 3.34283590298, 3.16408226797, 2.85338140657, 1.69617656287, 0.90257986511, 0.955899736, 1.05976783517, 1.30247364182, 1.28141173973, 2.3590132493, 3.98235612015, 5.52275043496, 6.05755694296, 5.393013276, 4.02326274672, 2.47845267225, 1.84752181621, 2.15252590838, 5.06230144475, 7.41167032555, 8.53782570463, 8.79030409323, 6.66976757107, 7.12395382025, 6.06480877755, 6.13921930207, 7.14571063832, 6.27677208389, 4.36383892975, 7.26238751115, 8.89284807939, 10.47959426157, 11.48226177995, 11.20166188779, 12.549220633, 8.81310356624, 4.47256418915, 2.14586426498, 2.54158258571, 7.91663149473, 9.68249884975, 10.1128931719, 7.29964757802, 4.48033904807, 6.05595083346, 10.05818685534, 9.62102307944, 10.13604667792, 12.01939979323, 8.35710889784, 6.53177628088, 4.76394708684, 7.31338676204, 5.5569901497, 7.72752398112, 8.70690782199, 
  9.24891599587, 5.54847021716, 9.22537748542, 8.98467852761, 6.1882828198, 2.31082618951, 4.97654216065, 5.42858216868, 6.17874464944, 9.04581330461, 9.06316525465, 10.12776789807, 10.31078229833, 5.28756129284, 4.45316196556, 5.93018776873, 7.83840407362, 4.98601625724, 4.69565320544, 8.93948433645, 4.34348883808, 5.3625343374, 2.69449297536, 6.12561480235, 5.09474150533, 4.887919708, 5.97049023189, 5.87638312786, 2.54735472668, 3.77356593639, 3.25964692014, 5.02931512703, 6.50551631242, 3.88245189383, 3.05363340249, 2.2776237399, 2.37057718951, 1.97582212091, 2.21865326585, 6.12882516877, 2.09272860779, 2.049274701, 2.81563603531, 6.45469206806, 7.60354513191, 1.540162216, 1.9357435773, 2.53730896972, 2.82851459642, 1.05875526183, 1.62984592768, 1.54920321561, 1.39527871651, 1.64501465231, 1.45305466163, 0.9179452682, 2.23549931765, 0.74215804171, 1.96096164131, 1.30603397165, 0.79982901356, 1.75263771776, 1.235944674, 0.8274412132, 0.83877747768, 0.65949736535, 0.41371499984, 0.47079602862, 0.5765535325, 0.39180440669, 0.51785338076, 0.40771053787, 0.63056693476, 1.53377994211, 0.35144845541, 0.26551215742, 0.67323701373, 0.34196340471, 0.23424885943, 0.27694678489, 0.16603917028, 0.12440706774, 0.14209887296, 0.13604282515, 0.12255403802, 0.17892217298, 0.07976021746, 0.10910664204, 0.15608468662, 0.10294853175, 0.07916288565, 0.05934746965, 0.091616663, 0.085105751, 0.05452221947, 0.04274051731, 0.04327440499, 0.03644752793, 0.03723724183, 0.0336890245, 0.06686060638, 
  0.03044382649, 0.0321237128, 0.02608560852, 0.02480423136, 0.02388826049, 0.0222640838, 0.02069639653, 0.01939339258, 0.01908626797, 0.01893564523, 0.01837765419, 0.02093381575, 0.017312743, 0.01649422099, 0.01624405123, 0.01634059953, 0.01587222115, 0.01548036106};


float[] GuterLack_data = {0.21856698759, 0.18862785973, 
  0.15765226153, 0.13274345692, 0.10726057401, 
  0.10096650493, 0.1131826901, 
  0.13885249377, 0.16214625203, 
  0.17789892425, 0.19818014971, 
  0.20604306646, 0.21843800638, 
  0.20322185486, 0.18867729748, 
  0.16150645183, 0.12813254634, 
  0.09416370797, 0.06325159636, 
  0.04383267275, 0.03188786886, 
  0.02466797608, 0.0208171224, 
  0.0180540769, 0.01590828481, 
  0.01502944559, 0.01382155964, 
  0.01309997762, 0.01271918222, 
  0.01209066178, 0.01171411843, 
  0.01100359199, 0.01716928524, 
  0.07047320188, 0.16428615007, 
  0.27742068756, 0.3727264255, 
  0.44959442141, 0.48735067537, 
  0.48603222102, 0.43467667612, 
  0.35946026355, 0.22384298028, 
  0.12983025285, 0.08018854916, 
  0.05124331005, 0.03401583965, 
  0.14234546816, 0.11450552093, 
  0.08961926879, 
  0.0694136403, 
  0.05456817258, 
  0.04422357836, 
  0.03547448451, 
  0.02899730093, 
  0.02528693421, 
  0.02165308647, 
  0.01950390866, 
  0.01734251385, 
  0.0158442337, 
  0.01454514774, 
  0.01523909343, 
  0.01764229984, 
  0.02046476945, 
  0.02187403107, 
  0.02132037998, 
  0.01897069591, 
  0.01616355951, 
  0.01427687319, 
  0.01266787106, 
  0.01152454528, 
  0.01065568435, 
  0.01120256782, 
  0.01211507694, 
  0.01314735837, 
  0.01951077427, 
  0.03337486292, 
  0.04879458795, 
  0.05411142957, 
  0.04821600916, 
  0.0413661434, 
  0.03126678044, 
  0.02181270487, 
  0.01856406259, 
  0.01917389589, 
  0.02432602404, 
  0.02614904392, 
  0.02271206071, 
  0.01768656928, 
  0.01658278006, 
  0.01585761275, 
  0.01321018888, 
  0.0095778909, 
  0.00812462734, 
  0.007755022, 
  0.00740778557, 
  0.00742063676, 
  0.00757069746, 
  0.00847603705, 
  0.00916697814, 
  0.00950257802, 
  0.00894574567, 
  0.00833083866, 
  0.00793051011, 
  0.0074494015, 
  0.01139603235, 
  0.05160874663, 
  0.05407051682, 
  0.01771604506, 
  0.01071988929, 
  0.01681855839, 
  0.01912555975, 
  0.01240888843, 
  0.03174782326, 
  0.05984873351, 
  0.0423018089, 
  0.01410528304, 
  0.01132351525, 
  0.0131070795, 
  0.01226014219, 
  0.0165569234, 
  0.03111245941, 
  0.02882888809, 
  0.0285065805, 
  0.01772594168, 
  0.02758738993, 
  0.01449639707, 
  0.01111422258, 
  0.01327479906, 
  0.01235757215, 
  0.00961192082, 
  0.00825909643, 
  0.00841083538, 
  0.01493815053, 
  0.01182977035, 
  0.01117397318, 
  0.01762215216, 
  0.01045949277, 
  0.01096983107, 
  0.00943704059, 
  0.0131902739, 
  0.01128757285, 
  0.01744147056, 
  0.071563707, 
  1.3096252718, 
  0.02651209408, 
  0.01627115448, 
  0.01322860882, 
  0.01057101366, 
  0.00781030557, 
  0.00911419003, 
  0.00998143853, 
  0.01035970243, 
  0.01272196574, 
  0.0186777822, 
  0.01700817084, 
  0.04782609808, 
  0.00984431708, 
  0.00941871821, 
  0.01034939762, 
  0.0232740613, 
  0.18137817065, 
  0.01259869462, 
  0.01540779839, 
  0.00837432042, 
  0.01170612864, 
  0.03301567902, 
  0.87497241563, 
  0.045080746, 
  0.02426136991, 
  0.01531092253, 
  0.01839993624, 
  0.01106169224, 
  0.00982387158, 
  0.01283598739, 
  0.01083322565, 
  0.00971959502, 
  0.01279236524, 
  0.0078417431, 
  0.01224177537, 
  0.02617629383, 
  0.01212789255, 
  0.00873468823, 
  0.01123303548, 
  0.00944044088, 
  0.00878952759, 
  0.00929651211, 
  0.01142892312, 
  0.04062334001, 
  0.00954687751, 
  0.00752691584, 
  0.00783340841, 
  0.56052589977, 
  0.02605024905, 
  0.00767627071, 
  0.00772177114, 
  0.00794853548, 
  0.00659624037, 
  0.00825594658, 
  0.00767683272, 
  0.00910594955, 
  0.0075205205, 
  0.53245674999, 
  0.06101430051, 
  0.01231880809, 
  0.00971830604, 
  0.00828344969, 
  0.00847822897, 
  0.00845063874, 
  0.00724348935, 
  0.006325451, 
  0.00633478033, 
  0.00810321238, 
  0.0060652021, 
  0.00559444381, 
  0.01180536058, 
  0.01043216442, 
  0.0273604597, 
  0.01841146103, 
  0.01338913932, 
  0.00740589078, 
  0.05469427539, 
  0.02194301941, 
  0.00681051207, 
  0.00732646839, 
  0.00600768143, 
  0.00897027367, 
  0.008397356, 
  0.25543628197, 
  0.00966689962, 
  0.01265047508, 
  0.02580061873, 
  0.02238417998, 
  0.01248593931, 
  0.01073056141, 
  0.00547904811, 
  0.00716145738, 
  0.00661427101, 
  0.00570185219, 
  0.01394219092, 
  0.03293225379, 
  0.00539286016, 
  0.00511091664, 
  0.00659623109, 
  0.00591820549, 
  0.00725564403, 
  0.00499251599, 
  0.00495750397, 
  0.0062505944, 
  0.00568658177, 
  0.00512340959, 
  0.01272262562, 
  0.00674291104, 
  0.0048441746, 
  0.00480406766, 
  0.00469114784, 
  0.0047080494, 
  0.0051787985, 
  0.00546039428, 
  0.00541147768, 
  0.00628722972, 
  0.00473459538, 
  0.00474689102, 
  0.00460431174, 
};


float[] Eco_Edding_data = {0.05568973517, 0.04493092023, 0.0376540901, 0.03167088304, 0.02793543837, 0.02560574616, 0.02376969548, 0.02234846909, 0.02071739604, 0.02036679122, 0.01921604913, 0.01886191616, 0.01827639475, 0.01777699127, 0.01682418449, 0.01667126699, 0.01603495443, 0.01549717971, 0.01450571898, 0.01462529212, 0.01415924486, 0.01417029912, 0.01417499535, 0.01379627829, 0.01402757899, 0.01375863714, 0.0138667756, 0.01358931866, 0.02276337152, 0.1092004429, 0.20535567243, 0.29449091423, 0.37333405206, 0.41816503216, 0.44319008297, 0.39670314692, 0.28860073738, 0.18001914821, 0.10723858432, 0.06640719875, 0.0427345366, 0.0318362807, 0.02618297918, 0.02367118273, 0.02228556508, 0.02097337737, 0.01974653455, 0.01780966467, 0.0161279674, 0.01404596139, 0.01305535065, 0.01200640415, 0.01161687264, 0.01176602839, 0.01179605468, 
  0.01201197283, 0.01156554342, 0.01138809809, 0.01070724301, 0.01021756703, 0.00978852286, 0.00984111485, 0.00936319315, 0.00945138976, 0.00926492962, 0.00956224602, 0.00966081167, 0.00948973806, 0.00935708043, 0.00862040145, 0.0082678798, 0.00812047772, 0.00785167019, 0.00797263957, 0.00798392726, 0.00772750361, 0.00904417141, 0.01100861425, 0.01096136441, 0.01006120443, 0.00856397491, 0.00754801286, 0.00755530438, 0.00746603719, 0.0075747097, 0.00712005256, 0.00684910364, 0.00662319648, 0.00642570075, 0.00647215903, 0.00648707778, 0.00671603866, 0.00689465434, 0.00649349758, 0.00619971989, 0.0062686142, 0.00601548536, 0.00603112787, 0.00604749139, 0.00630235421, 0.006601561, 0.00685135531, 0.00867454201, 0.00934051814, 0.00729671402, 0.01070054669, 0.01426410433, 0.00991259262, 0.0061807237, 0.00587443967, 0.0057039031, 0.00593356315, 0.0062473216, 0.00609793035, 0.00691172731, 0.0074235998, 0.00674184065, 0.00861129815, 0.00853076012, 0.00578267328, 0.00530399136, 0.00548288723, 0.00524035955, 0.00513190362, 0.00516121564, 0.00514715201, 0.00528548701, 0.005186284, 0.00582170802, 0.00588599711, 0.00556282108, 0.00494640283, 0.0051249571, 0.00511603976, 0.00536383654, 0.00498161561, 0.00540775177, 0.00514476272, 0.00919011945, 0.00889311291, 0.00692233567, 0.00731787002, 0.00764700334, 0.0055757505, 0.00522085268, 0.00665970459, 0.00869119695, 0.00619973375, 0.00528779889, 0.00943187722, 0.00776030922, 0.0110734448, 0.00566065774, 0.00589103419, 0.00522163709, 0.00524743763, 0.00532746908, 0.00502434917, 0.0054390494, 0.00997951483, 0.00580683129, 0.00618219235, 0.00629010577, 0.00515879773, 0.00532541723, 0.00537518227, 0.00836025722, 0.00533309461, 0.00545978381, 0.00503162731, 0.00537682489, 0.00512114104, 0.00510004205, 0.00550746995, 0.00512028882, 0.00477297768, 0.00497295895, 0.00497893274, 
  0.00494467483, 0.00491418211, 0.00743683549, 0.00508035307, 0.00510378576, 0.00499341492, 0.00869530177, 0.00631689447, 0.00477478212, 0.00453075341, 0.0044458099, 0.00465223292, 0.00455197467, 0.00446308716, 0.00473356202, 0.00439191702, 0.00451673461, 0.00457773915, 0.00432904629, 0.0043199235, 0.00433583837, 0.00438116307, 0.00432529518, 0.00442598988, 0.00440384601, 0.00442386636, 0.00475799034, 0.00464490451, 0.00427920696, 0.00435186522, 0.00526908426, 0.00440469964, 0.00440407803, 0.00424808308, 0.00431585365, 0.00435009544, 0.00449812508, 0.00410601557, 0.00428640733, 0.00446723232, 0.00417505341, 0.00422499517, 0.0041392684, 0.00473152648, 0.0045935269, 0.00446545098, 0.0041899349, 0.00449259603, 0.10423951488, 
  0.00422804298, 0.0041884577, 0.00425031928, 0.00529417815, 0.00513471103, 0.00415164931, 0.00480623787, 0.00442459607, 0.00435952256, 0.00427519751, 0.00447117346, 0.00455355171, 0.00408358625, 0.00435422305, 0.00441375266, 0.00453959826, 0.00627436641, 0.00436126654, 0.00440070785, 0.0041590892, 0.00408025656, 0.00463885504, 0.00427797048, 0.00441881459, 0.00458057407, 0.00469750545, 0.00416059769, 0.00418335543, 0.00446936065
};
float[] Edding_data = {
  0.26820091242, 0.24358529566, 0.20508564979, 0.17288549749, 
  0.14299456041, 0.11993591615, 0.1003166816, 0.08558515325, 0.07466378234, 0.06583079313, 0.05925954178, 0.05252427344, 0.0487283052, 0.04465918397, 0.04084444164, 0.03715551439, 
  0.03398367085, 0.03029492779, 0.0278187164, 0.02632150513, 0.02395062098, 0.0228429232, 0.02211649515, 
  0.02049484817, 0.01964064656, 0.01858593949, 0.0172259789, 0.01660725494, 0.01546192764, 0.01462007957, 0.01401677146, 0.01406114639, 0.01628522234, 0.02023917841, 0.02409181256, 1.51135316169, 
  3.17525364463, 4.22302392289, 4.77962357785, 5.08059079678, 5.22547915577, 5.19419020084, 5.03204647505, 4.77339573839, 
  4.49835013104, 4.24349791743, 3.99399121724, 3.73390680119, 3.61055370414, 3.4476296258, 3.34565655744, 3.26745494977, 3.22070379464, 3.20567314679, 
  3.83076007253, 0.78091905877, 0.6460257377, 0.97312495815, 0.31330037692, 0.26473132941, 0.22703316284, 0.20687990966, 0.18563902505, 
  0.16984516742, 0.15500635052, 0.14834584942, 0.13776311244, 0.12540937791, 0.11686784162, 0.110709231, 0.10618670316, 
  0.10371641516, 0.10331362621, 0.10270919762, 0.08755771151, 0.0788395717, 0.07340640748, 0.07053175059, 0.0674533931, 0.06401674568, 0.06367489029, 
  0.06994428803, 
  0.09533096108, 0.08103504837, 
  0.05991277977, 0.05441561152, 
  0.05284854571, 0.05061266979, 
  0.04972197844, 0.05343951517, 
  0.06220079528, 0.09167525722, 
  0.16150961826, 0.15434526095, 
  0.06758998903, 0.04515238366, 
  0.04160909774, 0.04094213064, 
  0.04179133184, 0.05560596322, 
  0.0811294976, 0.05808601688, 
  0.03988302388, 0.03651148901, 0.03668132219, 0.03927270229, 0.04425533388, 
  0.0591348789, 0.1368898026, 
  0.1102994194, 0.14564392427, 
  0.33088069771, 0.12670729405, 0.08855712792, 0.25753194273, 
  0.15874257405, 0.045403887, 0.06384099576, 
  0.07140685433, 0.03380916715, 0.02954860501, 0.02853252977, 0.044253616, 0.11208522657, 
  0.05279297486, 0.03019994876, 0.02965758196, 0.02595032995, 0.02504164846, 0.02400232268, 0.02368476242, 0.02345151071, 
  0.0230833786, 0.02504789152, 
  0.02555822365, 
  0.02425441508, 
  0.02245500634, 0.02221898392, 
  0.02126514253, 
  0.02064643265, 
  0.02174922563, 
  0.02111143812, 
  0.02894181564, 0.02378697789, 
  0.02252087883, 
  0.02115316088, 
  0.020628458, 0.0207475702, 
  0.02018261027, 
  0.01982733966, 
  0.02014006909, 
  0.01974898124, 
  0.01975159165, 0.02054262377, 
  0.03212184607, 
  0.02342779858, 
  0.02151474867, 
  0.01978819126, 
  0.02522213127, 
  0.02193563106, 
  0.02592292119, 
  0.01987008757, 
  0.01928903711, 
  0.02150564372, 
  0.01852476641, 
  0.01804910159, 
  0.01862675724, 
  0.02715931534, 
  0.01914253879, 
  0.01823175699, 
  0.01786882243, 
  0.01708443106, 
  0.02435399677, 
  0.02386738584, 
  0.0963452903, 
  0.02067179949, 
  0.02946216779, 
  0.01919111517, 
  0.01907557669, 
  0.01725175625, 
  0.01817683621, 
  0.02176995455, 
  0.01830716519, 
  0.01757978994, 
  0.01794314073, 
  0.01661656692, 
  0.01968830405, 
  0.01661029231, 
  0.04845928527, 
  0.01709271135, 
  0.02013781854, 
  0.01574993677, 
  0.01951091875, 
  0.01558419567, 
  0.01527015987, 
  0.0150922875, 
  0.01630816938, 
  0.01473461836, 
  0.01526386751, 
  0.0148604639, 
  0.01622141069, 
  0.01561222599, 
  0.0148725497, 
  0.01456541615, 
  0.01466646893, 
  0.0138555015, 
  0.01433021228, 
  0.01424514717, 
  0.01369907839, 
  0.01394372824, 
  0.01381690097, 
  0.01475679026, 
  0.01964720667, 
  0.01508174177, 
  0.01390698366, 
  0.01377804057, 
  0.01402131025, 
  0.01388201371, 
  0.01431104665, 
  0.01386504182, 
  0.01351865667, 
  0.01333325906, 
  0.01331459659, 
  0.01322238809, 
  0.01275169837, 
  0.01322472782, 
  0.01305198065, 
  0.01303039664, 
  0.01314744653, 
  0.01368873023, 
  0.01307935415, 
  0.01333203445, 
  0.01322510178, 
  0.01313134746, 
  0.01257556711, 
  0.01271296268, 
  0.01237847941, 
  0.0130390872, 
  0.01579270287, 
  0.01473917879, 
  0.0123673411, 
  0.01335435262, 
  0.01284919774, 
  0.01252898532, 
  0.01255577848, 
  0.01233708608, 
  0.01289780236, 
  0.012102232, 
  0.01235527984, 
  0.01200642297, 
  0.01274203654, 
  0.01506678417, 
  0.01187221402, 
  0.01228257352, 
  0.0119961952, 
  0.01173119264, 
  0.01213970872, 
  0.01172230998, 
  0.01170547524, 
  0.01162060785, 
  0.01147761288, 
  0.01142093, 
  0.01136932037, 
  0.01133756685, 
};

float[] Bastelkleber_data = {
  0.05599616908, 
  0.04168374023, 
  0.03755302338, 
  0.04017696033, 
  0.04803682896, 
  0.06830821898, 
  0.09822259465, 
  0.13295171197, 
  0.15395473716, 
  0.16780361096, 
  0.16360309661, 
  0.1468367268, 
  0.1149022442, 
  0.08223376137, 
  0.05334774024, 
  0.03582622161, 
  0.02639799027, 
  0.02211266568, 
  0.02043302528, 
  0.02063698197, 
  0.02239779667, 
  0.02558629386, 
  0.03525106193, 
  0.04453347051, 
  0.04848024812, 
  0.04879015626, 
  0.04422952845, 
  0.0378258271, 
  0.02761984325, 
  0.01910350247, 
  0.01440799908, 
  0.01214897158, 
  0.01151716986, 
  0.0106021271, 
  0.01067725531, 
  0.01066993278, 
  0.01102484549, 
  0.01092825124, 
  0.01079112468, 
  0.01071451775, 
  0.01030024059, 
  0.0100463573, 
  0.01006945264, 
  0.00967389905, 
  0.00937934449, 
  0.00933512479, 
  0.00894441197, 
  0.00876106907, 
  0.0087755284, 
  0.00852044346, 
  0.00830156371, 
  0.00847016644, 
  0.00835007482, 
  0.00838323398, 
  0.00820737058, 
  0.00810739519, 
  0.00826768239, 
  0.00850295225, 
  0.00890839145, 
  0.00883756171, 
  0.00934850461, 
  0.01324021718, 
  0.01512948918, 
  0.01259728535, 
  0.00919723822, 
  0.00836670672, 
  0.00796006828, 
  0.01404416466, 
  0.01841051275, 
  0.01396868415, 
  0.0105337089, 
  0.00894390971, 
  0.00910620233, 
  0.01028223178, 
  0.00910635831, 
  0.00779952185, 
  0.00748644206, 
  0.00708515703, 
  0.0079079005, 
  0.00805483645, 
  0.00773049082, 
  0.0067863509, 
  0.00646826981, 
  0.00662338653, 
  0.00742049786, 
  0.00753345789, 
  0.03871574518, 
  0.05740338925, 
  0.01773090824, 
  0.00750394209, 
  0.00707304084, 
  0.00622238072, 
  0.00643704504, 
  0.00624822066, 
  0.0063334751, 
  0.01092992958, 
  0.01717760401, 
  0.00829163744, 
  0.00657967585, 
  0.00613316438, 
  0.0060215995, 
  0.00592407198, 
  0.00580512165, 
  0.00560571216, 
  0.00797755972, 
  0.00758084901, 
  0.00578639654, 
  0.00610164562, 
  0.00587577585, 
  0.00608603755, 
  0.00619701299, 
  0.00624006121, 
  0.0109276063, 
  0.00680936393, 
  0.00782797364, 
  0.00676794339, 
  0.00574195224, 
  0.00591226584, 
  0.00603258463, 
  0.00792476477, 
  0.00725358248, 
  0.02381138108, 
  0.00914876314, 
  0.00721855962, 
  0.00700530479, 
  0.00839194518, 
  0.02902959199, 
  0.10592783442, 
  0.01194302224, 
  0.00817143997, 
  0.00855034137, 
  0.01080942648, 
  0.01815347704, 
  0.01088024022, 
  0.00810016528, 
  0.00801494545, 
  0.0080579064, 
  0.0068762954, 
  0.00676461125, 
  0.00898340589, 
  0.00700935494, 
  0.00679532902, 
  0.00690323755, 
  0.00698675714, 
  0.00769739445, 
  0.00652115953, 
  0.00678547935, 
  0.00985483331, 
  0.00652801509, 
  0.00750355887, 
  0.00781564237, 
  0.0063313518, 
  0.00617344444, 
  0.00599687987, 
  0.00596460131, 
  0.00564261544, 
  0.00596471018, 
  0.00574710467, 
  0.00590105094, 
  0.00562615489, 
  0.00661743657, 
  0.00559909423, 
  0.0057952969, 
  0.00562727875, 
  0.00666941488, 
  0.00573725966, 
  0.00556258839, 
  0.0060746299, 
  0.00552494622, 
  0.0053479089, 
  0.00541811752, 
  0.00567604808, 
  0.00517392116, 
  0.00506576722, 
  0.00590895515, 
  0.0052133811, 
  0.0051419805, 
  0.00507422987, 
  0.00500349018, 
  0.0050398703, 
  0.00509531508, 
  0.00508472917, 
  0.00553779782, 
};

float[] Sekundenkleber_data = {0.62107873032, 
  0.6450156885, 
  0.67232786102, 
  0.68532965717, 
  0.67306429052, 
  0.63948774212, 
  0.60383808049, 
  0.53830666654, 
  0.46546865071, 
  0.37885622436, 
  0.29100778702, 
  0.21254739574, 
  0.1469751471, 
  0.10505312585, 
  0.07846979385, 
  0.05944865506, 
  0.04760774561, 
  0.04202859342, 
  0.03856278096, 
  0.0376825241, 
  0.03808282017, 
  0.03841247711, 
  0.03907514021, 
  0.03949176661, 
  0.03942860013, 
  0.03779556012, 
  0.03691287319, 
  0.03264598328, 
  0.0293678286, 
  0.02666372288, 
  0.02360329676, 
  0.02119534699, 
  0.01894337636, 
  0.01692932958, 
  0.01572798646, 
  0.01568760926, 
  0.0161785772, 
  0.0164633248, 
  0.01714513736, 
  0.01774519203, 
  0.01924900579, 
  0.02068784924, 
  0.02172612663, 
  0.02154102063, 
  0.021362031, 
  0.02181652687, 
  0.02162299101, 
  0.02099809262, 
  0.02245767127, 
  0.04201355953, 
  0.07366897098, 
  0.10096672894, 
  0.12064126695, 
  0.12479052244, 
  0.11133741698, 
  0.08223986122, 
  0.04806157353, 
  0.02613841431, 
  0.016261077, 
  0.01264769772, 
  0.01087947381, 
  0.01020869808, 
  0.0095912716, 
  0.00922379494, 
  0.00912343042, 
  0.00885919868, 
  0.00878205789, 
  0.00854436503, 
  0.00829809211, 
  0.0083830878, 
  0.00821200818, 
  0.00822794815, 
  0.00785134452, 
  0.00793015252, 
  0.00793859126, 
  0.00803949383, 
  0.00785376104, 
  0.00758843438, 
  0.00763626201, 
  0.00801068631, 
  0.00819696772, 
  0.008721424, 
  0.00911016963, 
  0.00916808627, 
  0.00798233644, 
  0.00713807739, 
  0.00678320046, 
  0.00674914542, 
  0.00661267528, 
  0.00646668177, 
  0.00637420543, 
  0.00626943783, 
  0.00623125162, 
  0.00610272942, 
  0.00616990631, 
  0.00591620307, 
  0.00593645984, 
  0.00591792071, 
  0.00586858091, 
  0.00573859831, 
  0.00588747185, 
  0.00581637872, 
  0.00545600173, 
  0.00558279926, 
  0.00539800332, 
  0.00547244275, 
  0.0054348268, 
  0.00567333265, 
  0.00576840173, 
  0.00557159078, 
  0.00545677129, 
  0.00551834168, 
  0.00523108337, 
  0.00509051513, 
  0.00497365417, 
  0.0051325877, 
  0.0049755306, 
  0.00534587708, 
  0.009850483, 
  0.00870292584, 
  0.00630801356, 
  0.00691990498, 
  0.00583880874, 
  0.00533700879, 
  0.00500126129, 
  0.00499816907, 
  0.00512306457, 
  0.00532160306, 
  0.00490151833, 
  0.00479454234, 
  0.0047031365, 
  0.00465691785, 
  0.00454873377, 
  0.00460600608, 
  0.00588106769, 
  0.02127629698, 
  0.01453993834, 
  0.00622515934, 
  0.00557829586, 
  0.00493088175, 
  0.00486276683, 
  0.01065367877, 
  0.03885377812, 
  0.02750426607, 
  1.10354550046, 
  4.05283148108, 
  0.8977717335, 
  0.31303833701, 
  0.20672179216, 
  0.15414029238, 
  0.1236692737, 
  0.1029379087, 
  0.09392009357, 
  0.0848652782, 
  0.0781980925, 
  0.07552122206, 
  0.07519016775, 
  0.07003322498, 
  0.07076734417, 
  0.06971460129, 
  0.07101975485, 
  0.07233213204, 
  0.07231375242, 
  0.07363333403, 
  0.07486231047, 
  0.07601585612, 
  0.07828578511, 
  0.08128166675, 
  0.08406700193, 
  0.08728863808, 
  0.09121169232, 
  0.09453432782, 
  0.09865075479, 
  0.10062202528, 
  0.10490398728, 
  0.11111482762, 
  0.11320860749, 
  0.13264692514, 
  0.17470557096, 
  0.13252954463, 
  0.13428084049, 
  0.13875818848, 
  0.1453428789, 
  0.14974370747, 
  0.15749181937, 
  0.16383205848, 
  0.17664089166, 
  0.17490837032, 
  0.2299276004, 
  0.19256293685, 
  0.20198026639, 
  0.20250443069, 
  0.2074144686, 
  0.22735699854, 
  0.21958270409, 
  0.22544412525, 
  0.23389654227, 
  0.23844655045, 
  0.22523300465, 
  0.22829301781, 
  0.22561022413, 
  0.22134713226, 
  0.21686624139, 
  0.20798827665, 
  0.21125693824, 
  0.20233782018, 
  0.19705747962, 
  0.19108259049, 
  0.1832878772, 
  0.17850590609, 
  0.17217249775, 
  0.16999201138, 
  0.22228460969, 
  0.15589245513, 
  0.15193159839, 
  0.14607780249, 
  0.14088121766, 
  0.13564247967, 
  0.13537650769, 
  0.13128779908, 
  0.11798784396, 
  0.11323845108, 
  0.11019712965, 
  0.10328487211, 
  0.13235952, 
  0.09380519424, 
  0.09167392256, 
  0.0862075356, 
  0.08143859095, 
  0.07911993664, 
  0.07487553844, 
  0.072161939, 
  0.06791607318, 
  0.06538230521, 
  0.06254464038, 
  0.06235556489, 
  0.06018759413, 
  0.05779932521, 
  0.0593125263, 
  0.05657235231, 
  0.05516198529, 
  0.05439722673, 
  0.05258014658, 
  0.05314769183, 
  0.05250609413, 
  0.05113016158, 
  0.05269407095, 
  0.05195819787, 
  0.05141176393, 
  0.0509732945, 
  0.05139077109, 
  0.05135784552, 
  0.05270559234, 
  0.05288068162, 
  0.05283171625, 
  0.05343912827, 
  0.05367947472, 
  0.05414778782, 
  0.05362412648, 
  0.05510429666, 
  0.05632471554, 
  0.05634675866, 
  0.05638516018, 
  0.05792939025};


float[] Eco_Boden_data = {
  0.02634235906, 
  0.02252821886, 
  0.02174186316, 
  0.02158940078, 
  0.022492466, 
  0.02340755267, 
  0.02454957736, 
  0.02507744684, 
  0.02533690354, 
  0.02510239415, 
  0.02409547591, 
  0.02277888902, 
  0.02143090304, 
  0.01944582615, 
  0.01696823664, 
  0.01485821437, 
  0.01316395217, 
  0.01208762697, 
  0.01155443746, 
  0.01095452408, 
  0.0104309813, 
  0.01003690227, 
  0.01000282715, 
  0.00960165676, 
  0.00960762194, 
  0.00949055943, 
  0.00967700529, 
  0.01588249132, 
  0.02277626092, 
  0.02813063925, 
  0.03140732039, 
  0.03291720913, 
  0.03230423246, 
  0.03111022276, 
  0.02732106107, 
  0.02115930478, 
  0.01585245831, 
  0.01235656265, 
  0.01052303883, 
  0.00956063706, 
  0.00881540051, 
  0.00853840902, 
  0.00803468866, 
  0.00770433566, 
  0.00766073445, 
  0.0073334373, 
  0.007224281, 
  0.00724394895, 
  0.00695229118, 
  0.00688907362, 
  0.00669556633, 
  0.00668455777, 
  0.00651226644, 
  0.00642038541, 
  0.00610575166, 
  0.00598248892, 
  0.0060502779, 
  0.00639795381, 
  0.00629311135, 
  0.00631982457, 
  0.00616169325, 
  0.00603653307, 
  0.00593441536, 
  0.00606011468, 
  0.00619199778, 
  0.00620470486, 
  0.00611761494, 
  0.00634124351, 
  0.00686566747, 
  0.00735081076, 
  0.00747554989, 
  0.0071689127, 
  0.0063346524, 
  0.00616739905, 
  0.00607032943, 
  0.00670744685, 
  0.00698333585, 
  0.00648711204, 
  0.00576974639, 
  0.00539821995, 
  0.00503675159, 
  0.00499622068, 
  0.00479859615, 
  0.00461765747, 
  0.00463400855, 
  0.0047035811, 
  0.00485329381, 
  0.00481060701, 
  0.00458131088, 
  0.00473895468, 
  0.00496589925, 
  0.00504187412, 
  0.00532738726, 
  0.00529345275, 
  0.00508083004, 
  0.00484207096, 
  0.00463454269, 
  0.00488864926, 
  0.00484162551, 
  0.00490517788, 
  0.00543639729, 
  0.00552407298, 
  0.0046993528, 
  0.00611793963, 
  0.00729259444, 
  0.00572830729, 
  0.00452611236, 
  0.00560806599, 
  0.00540904718, 
  0.00459580219, 
  0.00543500919, 
  0.00692063122, 
  0.0061576874, 
  0.00586364052, 
  0.06075664172, 
  0.17160620016, 
  0.06264558557, 
  0.01371738565, 
  0.00762004288, 
  0.00633506837, 
  0.0054659475, 
  0.00498892204, 
  0.00446418361, 
  0.0055308792, 
  0.00479967402, 
  0.00482792693, 
  0.00558831947, 
  0.00955701757, 
  0.00767704479, 
  0.00435482745, 
  0.00439891779, 
  0.00431966433, 
  0.00999428718, 
  0.00695455358, 
  0.00823675443, 
  0.00423309467, 
  0.00499748243, 
  0.00472363632, 
  0.00444791511, 
  0.00457355933, 
  0.00542433685, 
  0.00443284584, 
  0.00462289846, 
  0.00527195597, 
  0.01126251206, 
  0.00617532925, 
  0.00942508466, 
  0.00448420708, 
  0.00493966453, 
  0.00544426123, 
  0.00485527258, 
  0.00473247619, 
  0.00468297709, 
  0.00843986707, 
  0.00485313122, 
  0.00457756033, 
  0.01883096846, 
  0.22744656996, 
  0.01380601059, 
  0.00985102058, 
  0.01072269532, 
  0.0065744036, 
  0.00728614739, 
  0.00703762825, 
  0.00678371547, 
  0.00693721239, 
  0.00528527098, 
  0.00610802358, 
  0.00492639044, 
  0.00519237629, 
  0.00499862215, 
  0.00465396532, 
  0.0049025064, 
  0.00530943082, 
  0.00582523409, 
  0.00474278977, 
  0.00509520014, 
  0.00500320639, 
  0.00860845475, 
  0.00461575009, 
  0.0045393234, 
  0.00469390685, 
  0.00978239182, 
  0.00483790196, 
  0.00401657668, 
  0.00396908157, 
  0.00386167717, 
  0.0040199621, 
  0.00402897188, 
  0.00390451706, 
  0.00383721518, 
  0.0035980882, 
  0.00594326358, 
  0.00397705074, 
  0.00383194138, 
  0.00345764914, 
  0.00361006559, 
  0.00375583026, 
  0.00343264949, 
  0.00370053215, 
  0.00352193451, 
  0.00354042883, 
  0.00342619986, 
  0.00340120542, 
  0.00322033387, 
  0.00331199536, 
  0.00339851551, 
  0.00374002844, 
  0.00375748947, 
  0.0033767731, 
  0.00307651338, 
  0.00419284343, 
  0.00358394771, 
  0.00327150412, 
  0.00315492059, 
  0.00333340544, 
  0.00315449196, 
  0.00317144589, 
  0.00333155203, 
  0.00317627323, 
  0.00318339501, 
  0.00308351559, 
  0.00310926381, 
  0.00329156999, 
  0.00328390835, 
  0.00359650248, 
  0.00326087341, 
  0.00347221265, 
  0.00329962613, 
  0.00367278277, 
  0.00333755418, 
  0.00319099976, 
  0.00304593739, 
  0.00306131125, 
  0.00318931759, 
  0.0035272403, 
  0.00310314342, 
  0.0031092576, 
  0.00340008535, 
  0.00319535487, 
  0.00312849669, 
  0.00385914126, 
  0.00341711215, 
  0.00322823855, 
  0.00326781291, 
  0.00304909649, 
  0.00315218992, 
  0.00308539885, 
  0.00341527393, 
  0.00330150265, 
  0.00328269593, 
  0.003159297, 
  0.00315406626, 
  0.00319078895
};


float[] Kork_Boden_data = {0.04478875668, 0.03822349562, 0.03161241389, 0.02661842777, 0.02440274598, 0.02250262403, 0.0214709272, 0.02060179725, 
  0.02015347983, 0.0198670118, 0.01841756608, 0.01782651008, 0.01712973327, 0.01649703204, 0.01621753417, 0.01702382841, 0.01887128615, 0.01970115968, 0.02078872451, 0.02152128549, 0.02212620433, 0.02169119403, 0.02015691798, 
  0.01825827408, 0.01571418231, 0.01347336486, 0.01172147227, 0.01089183322, 0.01060885721, 0.01029126596, 0.01536103329, 0.02347586633, 0.0303597282, 0.03663029841, 0.04062732738, 0.04370790028, 0.04219559942, 0.03646003565, 0.0267474692, 
  0.01946348877, 0.01509326267, 0.01200987616, 0.01047893848, 0.00961652921, 0.00892356839, 0.00845944225, 0.00798339029, 0.00762049259, 0.00749275466, 0.00742914964, 0.00733150205, 0.00742483737, 0.0073159438, 0.00714115333, 0.00703929449, 0.00683533881, 0.00652611832, 0.00655232016, 0.00655117516, 0.00661283532, 0.00688255449, 0.00697029137, 0.00656851234, 0.00654337307, 0.00600025757, 0.00636437644, 0.00650002279, 0.00647961204, 0.00642950007, 0.00660923456, 
  0.00744716266, 0.00904141226, 0.01059015624, 0.01075892759, 0.00927246621, 0.00760282466, 0.00724403387, 0.0086830679, 0.01031782097, 0.00996694589, 0.00847387185, 0.00680003027, 0.0065393367, 0.00642219286, 0.00599024892, 
  0.00556328594, 0.00530308182, 0.00509658356, 0.00511618534, 0.00495141711, 0.00509660146, 0.00522591034, 0.00636400837, 0.00941523998, 0.01218685064, 0.01886896862, 0.01542140786, 0.01053545766, 0.01088284227, 
  0.00954522098, 0.00650564753, 0.00982468664, 0.01111956847, 0.0094437431, 0.0089718582, 0.00825268606, 0.01409126561, 0.01716575039, 0.01142566703, 0.00692230241, 0.00540794977, 0.00595871113, 0.00601024743, 0.00898871138, 0.01237551382, 0.00987495691, 
  0.00972001087, 0.03503706128, 0.09244422769, 0.02975367685, 0.0125224203, 0.00921662882, 0.00817495125, 0.00695255915, 0.00993403767, 0.00768664041, 0.00747630468, 0.00649645431, 0.00709058794, 0.00833314906, 0.00673367907, 0.00619849981, 0.00516550391, 0.00609297304, 0.00636510668, 0.01924690032, 
  0.04312951832, 0.00836790257, 0.00570623083, 0.00973291031, 0.01183936453, 0.01634913941, 0.01478162872, 0.02276686186, 0.0080702977, 0.00666415882, 0.00825478657, 0.01797202154, 0.01396299805, 0.01667769288, 0.00648594751, 0.00764141665, 0.00983750504, 0.00985192333, 0.01134169061, 
  0.00843089637, 0.07952930527, 0.00796506214, 0.00666020566, 0.02308677804, 0.01365467728, 0.01403120576, 0.03882309597, 0.01319678406, 0.00785219229, 0.01017122273, 0.0105623794, 0.00985605549, 0.04031507965, 0.01095938168, 
  0.02732087035, 0.0081949879, 0.00727128306, 0.00695951817, 0.00772909582, 0.01191102602, 0.00622807478, 0.00804893297, 0.00624536028, 0.00669580119, 0.00585639363, 0.01575027469, 0.00530957894, 0.00496426732, 0.00528740089, 0.00901836491, 
  0.00509081089, 0.00486015661, 0.00421645725, 0.00440078495, 0.00400970765, 0.00437486486, 0.00415222815, 0.00412026651, 0.00390817365, 0.0063635427, 0.00455631232, 0.0041609392, 0.00393005546, 0.00386106467, 0.00431971326, 0.00383079798, 0.00750186693, 0.00382359206, 0.00396035552, 0.00386441948, 
  0.00378151412, 0.00363261348, 0.00360538411, 0.00389106019, 0.00436176295, 0.00434977808, 0.00375940331, 0.0036462801, 0.00657652951, 0.0038739726, 0.00361578118, 0.003542386, 0.00341090084, 0.00349757514, 0.00340525332, 0.00480123032, 0.00348458042, 0.00353650906, 0.00347828246, 0.00367810773, 0.0035043285, 0.00348488477, 0.00542199869, 0.00361496827, 0.00353502312, 0.00347807863, 0.00363899811, 0.00340328805, 
  0.00331058132, 0.00314871809, 0.00331879758, 0.00340674797, 0.00437701862, 0.00333088094, 0.00317569046, 0.00339219811, 0.00343766574, 0.00348886796, 0.00355503011, 0.00330470739, 0.00335964412, 0.00343139196, 0.00322339158, 0.00326673735, 0.00311222681, 0.00313032687, 0.00340036677, 0.00333635127, 0.00338090672, 0.00320966802, 0.00334768852};

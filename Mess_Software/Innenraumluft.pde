void Innenraumluft() {
  fill(0);
  textSize(20);
  textFont(bold);
  text("Station 3.2 - Bitte lüften", 20, 50);
  textFont(normal);
  fill(150, 150, 255, 100);
  noStroke();
  bezierRect(20, 80, 1240, 170, 5, 5);
  fill(0);
  Station4_Aufgabentext_a2.show();
  textAlign(LEFT);
  fill(255);
  stroke(0);
  rect(100, 310, 200, 100);
  rect(540, 310, 200, 100);
  rect(940, 310, 200, 100);
  fill(0);

  text("Eine Person begibt sich in die begehbare Messkammer. Nehmt den Verlauf der Luftqualitätsparameter Temperatur,\nrel. Luftfeuchte, CO  und TVOC auf. Führt den Versuch einmal ohne, und einmal mit laufenden Ventilatoren durch.\n\nEine Messung dauert dabei " +nf(time_Station4,0,0) + " Sekunden und setzt sich aus 3 Phasen zusammen:", 70, 125);
  textAlign(CENTER);
  text("SITZEN\n" + nf(0.375*time_Station4,0,0) + " Sekunden", 200, 350);
  text("SPORT MACHEN\n" + nf(0.375*time_Station4,0,0) + " Sekunden", 640, 350);
  text("TÜR ÖFFNEN\n" + nf(0.25*time_Station4,0,0) + " Sekunden", 1040, 350);
  textSize(14);
  text("2", 262, 165);
  stroke(0);
  Station4a.show();
  Station4agestartet = false;
}

int t = 300;

float[][] Innenraumlufta = new float[7][5000];
boolean Station4agestartet = false;
boolean Station4aFertig = false;
int indexInnenraumlufta = 0;
int indexInnenraumluftaMax = 0;
float currentTime4a = -10000000;
boolean reset_bool_station4 = false;
int scale_Innenraum1 = 0;
int scale_Innenraum2 = 0;


int index_unten_rot = 0;
int index_unten_blau = 0;


void Innenraumluft_a() {
  fill(0);
  zumObermenu.y = 605;
  textSize(20);
  image(fan_aus, 500, 35);





  int Rot = -1;
  int Blau = -1;

  float maxRot = 0;
  float minRot = 0;
  float maxBlau = 0;
  float minBlau = 0;

  if (Station4_Rot.name == "Temperatur") {
    Rot = 0;
    maxRot = 10*(scale_Innenraum1);
  } else if (Station4_Rot.name == "rel. Luftfeuchte") {
    Rot = 1;
    maxRot = 20*(scale_Innenraum1);
  } else if (Station4_Rot.name == "CO") {
    Rot = 2;
    maxRot = 1000*(scale_Innenraum1);
  } else if (Station4_Rot.name == "TVOC") {
    Rot = 3;
    maxRot = 100*(scale_Innenraum1);
  } else if (Station4_Rot.name == "eCO") {
    Rot = 4;
    maxRot = 500*(scale_Innenraum1);
  }

  if (Station4_Blau.name == "Temperatur") {
    Temperatur_Doppfelpfeil_down2.show();
    Temperatur_Doppfelpfeil_up2.show();
  } else {
    Temperatur_Doppfelpfeil_down2.hide();
    Temperatur_Doppfelpfeil_up2.hide();
  }

  if (Station4_Rot.name == "Temperatur") {
    Temperatur_Doppfelpfeil_down1.show();
    Temperatur_Doppfelpfeil_up1.show();
  } else {
    Temperatur_Doppfelpfeil_down1.hide();
    Temperatur_Doppfelpfeil_up1.hide();
  }




  if (Temperatur_Doppfelpfeil_down1.isClicked()) {
    index_unten_rot -= 1;
    if (index_unten_rot < 0) {
      index_unten_rot = 5;
    }
  }
  if (Temperatur_Doppfelpfeil_up1.isClicked()) {
    index_unten_rot += 1;
    if (index_unten_rot > 5) {
      index_unten_rot = 0;
    }
  }
  if (Temperatur_Doppfelpfeil_down2.isClicked()) {
    index_unten_blau -= 1;
    if (index_unten_blau < 0) {
      index_unten_blau = 5;
    }
  }
  if (Temperatur_Doppfelpfeil_up2.isClicked()) {
    index_unten_blau += 1;
    if (index_unten_blau > 5) {
      index_unten_blau = 0;
    }
  }


  float offset_rot = 0;
  float offset_blau = 0;




  if (Station4_Blau.name == "Temperatur") {
    Blau = 0;
    maxBlau = 10*(scale_Innenraum2);
  } else if (Station4_Blau.name == "rel. Luftfeuchte") {
    Blau = 1;
    maxBlau = 20*(scale_Innenraum2);
  } else if (Station4_Blau.name == "CO") {
    Blau = 2;
    maxBlau = 1000*(scale_Innenraum2);
  } else if (Station4_Blau.name == "TVOC") {
    Blau = 3;
    maxBlau = 100*(scale_Innenraum2);
  } else if (Station4_Blau.name == "eCO") {
    Blau = 4;
    maxBlau = 500*(scale_Innenraum2);
  }

  if (Station4_Blau.name == "Temperatur") {
    offset_blau = (index_unten_blau)*maxBlau/5;
  }

  if (Station4_Rot.name == "Temperatur") {
    offset_rot = (index_unten_rot)*maxRot/5;
  }

  if (up1.isClicked()) {
    if (Station4_Rot.name == "Temperatur") {
      scale_Innenraum1 += 1;
      if (scale_Innenraum1 > 3) {
        scale_Innenraum1 = 2;
      }
    } else {
      scale_Innenraum1 += 1;
      if (scale_Innenraum1 > 5) {
        scale_Innenraum1 = 0;
      }
    }
  }
  if (Station4_Rot.name == "Temperatur") {
    if (scale_Innenraum1 < 1) {
      scale_Innenraum1 = 3;
    }
    if (scale_Innenraum1 > 3) {
      scale_Innenraum1 = 2;
    }
  }

  if (Station4_Blau.name == "Temperatur") {
    if (scale_Innenraum2 < 2) {
      scale_Innenraum2 = 3;
    }
    if (scale_Innenraum2 > 3) {
      scale_Innenraum2 = 2;
    }
  }
  if (down1.isClicked()) {
    if (Station4_Rot.name == "Temperatur") {
      scale_Innenraum1 -= 1;
      if (scale_Innenraum1 < 2) {
        scale_Innenraum1 = 3;
      }
    } else {
      scale_Innenraum1 -= 1;
      if (scale_Innenraum1 < 0) {
        scale_Innenraum1 = 5;
      }
    }
  }
  if (up2.isClicked()) {
    if (Station4_Blau.name == "Temperatur") {
      scale_Innenraum2 += 1;
      if (scale_Innenraum2 > 3) {
        scale_Innenraum2 = 2;
      }
    } else {
      scale_Innenraum2 += 1;
      if (scale_Innenraum2 > 5) {
        scale_Innenraum2 = 0;
      }
    }
  }
  if (down2.isClicked()) {
    if (Station4_Blau.name == "Temperatur") {
      scale_Innenraum2 -= 1;
      if (scale_Innenraum2 < 2) {
        scale_Innenraum2 = 3;
      }
    } else {
      scale_Innenraum2 -= 1;
      if (scale_Innenraum2 < 0) {
        scale_Innenraum2 = 5;
      }
    }
  }
  if (Station4Start.isClicked()) {
    for (int i = 0; i < 5000; i++) {
      for (int j = 0; j < 7; j++) {
        Innenraumlufta[j][i] = 0;
      }
    }
    Station4agestartet = true;
    if (page == 4.1) {
      currentTime4a = millis();
      indexInnenraumlufta = 0;
    } else if (page == 4.11) {
      currentTime4b = millis();
      indexInnenraumlufta = 0;
    } else if (page == 4.111) {
      currentTime4c = millis();
      indexInnenraumluftc = 0;
    }
  }
  //if (station4_MessungWiederholen.isClicked()) {
  //  if (page == 4.1) {
  //    currentTime4a = millis();
  //    indexInnenraumlufta = 0;
  //    for (int i = 0; i < 5000; i++) {
  //      for (int j = 0; j < 7; j++) {
  //        Innenraumlufta[j][i] = 0;
  //      }
  //    }
  //  } else if (page == 4.11) {
  //    currentTime4a = millis();
  //    indexInnenraumlufta = 0;
  //  } else if (page == 4.111) {
  //    currentTime4c = millis();
  //    indexInnenraumluftc = 0;
  //  }
  //}

  // Zeichne den Hintergrund
  fill(255);
  stroke(0);
  rect(120, 140, 830, 500);
  fill(230);
  rect(1080, -1, 200, 720);
  stroke(100, 100);
  line(431.75, 140, 431.75, 640);
  line(742.5, 140, 742.5, 640);
  textSize(60);
  textAlign(CENTER, CENTER);
  text("Ruhig\nsitzen", 275.75, 380);
  text("Sport\nmachen!", 587.5, 380);
  text("Tür\nauf!", 840.25, 380);
  textSize(20);
  noStroke();
  fill(0);
  text(round(0.375*time_Station4), 431.75, 660);
  text(round(0.75*time_Station4), 742.5, 660);
  if (scale_Innenraum1 == 0 && Rot!=-1) {
    minRot = 99999;
    maxRot = 0;
    for (int i = 0; i < 5000; i++) {
      if (Innenraumlufta[Rot][i] < minRot && Innenraumlufta[Rot][i] != 0) {
        minRot = Innenraumlufta[Rot][i];
      }
      if (Innenraumlufta[Rot][i] > maxRot) {
        maxRot = Innenraumlufta[Rot][i];
      }
    }
  }
  if (scale_Innenraum2 == 0 &&Blau != -1) {
    minBlau = 99999;
    maxBlau = 0;
    for (int i = 0; i < 5000; i++) {
      if (Innenraumlufta[Blau][i] < minBlau && Innenraumlufta[Blau][i] != 0) {
        minBlau = Innenraumlufta[Blau][i];
      }
      if (Innenraumlufta[Blau][i] > maxBlau) {
        maxBlau = Innenraumlufta[Blau][i];
      }
    }
  }
  if (scale_Innenraum1 != 0) {
    minRot = minRot+ offset_rot;
    maxRot = maxRot+ offset_rot;
  }
  if (scale_Innenraum2 != 0) {
    minBlau = minBlau+ offset_blau;
    maxBlau = maxBlau+ offset_blau;
  }


  stroke(200);
  for (int i = 0; i < 4; i++) {
    line(120, 240 +100*i, 950, 240 + 100*i);
  }
  fill(0);
  textAlign(CENTER);
  fill(255, 0, 0);
  if (Rot != -1 && maxRot != 0) {
    for (int i = 0; i< 6; i++) {
      text(round(minRot + i*(maxRot-minRot)/(5)), 85, 650 - 100*i);
    }
  }
  fill(0, 0, 255);
  if (Blau != -1 && maxBlau != 0) {
    for (int i = 0; i< 6; i++) {
      text(round(minBlau + i*(maxBlau-minBlau)/(5)), 985, 650 - 100*i);
    }
  }
  textAlign(CORNER);
  fill(0);
  noStroke();
  textSize(30);
  text("Optionen", 1120, 50);
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
  textAlign(CORNER);



  plotStation4(Innenraumlufta, Rot, minRot, maxRot, color(255, 0, 0), verbinde_innenraum.checked, fehler_innenraum.checked, "a");
  plotStation4(Innenraumlufta, Blau, minBlau, maxBlau, color(0, 0, 255), verbinde_innenraum.checked, fehler_innenraum.checked, "a");

  fill(0);
  textSize(20);
  text("0", 115, 670);
  text(nf(time_Station4, 0, 0), 938, 670);
  textSize(15);
  strokeWeight(1);
  fill(240);
  stroke(0);
  rect(1105, 190, 155, 85);
  fill(0);
  textSize(13);
  textAlign(CENTER);
  text("Messunsicherheit", 1165, 215);
  textSize(16);
  text("verbinden", 1165, 260);
  textAlign(CENTER);
  textSize(20);
  text("Ventilator ausgeschaltet lassen!", 550, 25);
  text("Zeit in Sekunden", 550, 700);
  fill(0);
  back.show();
  zumObermenu.show();
  if (Blau != -1) {
    up2.show();
    down2.show();
  } else {
    up2.hide();
    down2.hide();
  }

  if (Rot != -1) {
    up1.show();
    down1.show();
  } else {
    up1.hide();
    down1.hide();
  }

  if (!Station4agestartet) {
    Station4Start.show();
    station4_MessungWiederholen.hide();
  } else {
    Station4Start.hide();
    station4_MessungWiederholen.show();
  }
  Station4_Rot.show();
  Station4_Blau.show();
  aktualisierung_right.show();
  aktualisierung_left.show();
  fehler_innenraum.show();
  verbinde_innenraum.show();
  //rect(120, 140, 830, 500);
  fill(255, 100, 100, 50);
  noStroke();
  if (indexInnenraumlufta >0) {
    if (Innenraumlufta[6][indexInnenraumlufta-1] < 0.375*time_Station4) {
      rect(120, 140, 311.25, 500);
    } else if (Innenraumlufta[6][indexInnenraumlufta-1] < 0.75*time_Station4) {
      rect(431.25, 140, 311.25, 500);
    } else if (Innenraumlufta[6][indexInnenraumlufta-1] < time_Station4) {
      rect(741.5, 140, 207.5, 500);
    }
  }

  for (int i = 0; i < 5000; i++) {
    if (Innenraumlufta[6][i] >= time_Station4-0.99) {
      Station4aFertig = true;
      Station4agestartet = false;
      break;
    } else {
      Station4aFertig = false;
    }
  }


  if (indexInnenraumlufta >0) {
    if (Innenraumlufta[6][indexInnenraumlufta-1] > time_Station4-0.99) {
      Station4b.show();
    } else {
      Station4b.hide();
    }
  }

  if (freie_stationen.name == "freigeben") {
    Station4b.show();
  }
  pushMatrix();
  translate(width/2, height/2);
  rotate(3*PI/2);
  fill(255, 0, 0);
  if (Rot == 6) {
    text(nf(time_Station4, 0, 0), 938, 660);
    text("Zeit in Sekunden", -100, -595);
  } else if (Rot == 0) {
    text("Temperatur in °C", height/2 -490, -width/2 + 50);
  } else if (Rot == 1) {
    text("rel. Luftfeuchte in %", height/2 -490, -width/2 + 50);
  } else if (Rot == 2) {
    text("CO  in ppm", height/2 -490, -width/2 + 50);
    textSize(16);
    text("2", height/2 -462, -width/2 + 60);
    textSize(20);
  } else if (Rot == 3) {
    text("TVOC in ppb", height/2 -490, -width/2 + 50);
  } else if (Rot == 4) {
    text("eCO  in ppm", height/2 -490, -width/2 + 50);
    textSize(16);
    text("2", height/2 -455, -width/2 + 60);
    textSize(20);
  }
  popMatrix();
  pushMatrix();
  translate(width/2, height/2);
  rotate(PI/2);
  fill(0, 0, 255);
  if (Blau == 0) {
    text("Temperatur in °C", -height/2 +300, width/2 - 1050);
  } else if (Blau == 1) {
    text("rel. Luftfeuchte in %", -height/2 +300, width/2 - 1050);
  } else if (Blau == 2) {
    text("CO  in ppm", -height/2 +300, width/2 - 1050);
    textSize(16);
    text("2", -height/2 +330, width/2 - 1040);
    textSize(20);
  } else if (Blau == 3) {
    text("TVOC in ppb", -height/2 +300, width/2 - 1050);
  } else if (Blau == 4) {
    text("eCO  in ppm", -height/2 +300, width/2 - 1050);
    textSize(16);
    text("2", -height/2 +343, width/2 - 1040);
    textSize(20);
  }
  popMatrix();
}


void plotStation4(float[][] array, int index, float min, float max, color c, boolean connect, boolean error, String aufgabe) {
  // 1 Sekunde entspricht "830/time_Station4" Pixel
  stroke(c);
  fill(c);
  strokeWeight(1);
  //rect(120, 140, 830, 500);
  float oneSecond = 830/time_Station4;
  float xOff = array[6][0];

  boolean plot_first = true;

  float e = 0;


  // Aktueller Messwert
  String Einheit = "";

  if (index != -1) {
    for (int i = 1; i < 5000; i++) {

      if (index == 0) {
        e = 0.5;
        Einheit = "°C";
      } else if (index == 1) {
        e = 2;
        Einheit = "%";
      } else if (index == 2) {
        e = 30 + 0.03*array[2][i];
        Einheit = "ppm";
      } else if (index == 3) {
        e =  0.15*array[3][i];
        Einheit = "ppb";
      } else if (index == 4) {
        e = 0.1*array[3][i];
        Einheit = "ppm";
      }



      float x1 = 120 + (array[6][i] - xOff)*oneSecond;
      float x2 = 120 + (array[6][i-1] - xOff)*oneSecond;
      float y1 = 640 - 500*(array[index][i]-min)/(max-min);
      float y2 = 640 - 500*(array[index][i-1]-min)/(max-min);

      float e12 =  640 - 500*(array[index][i-1] - e -min)/(max-min);
      float e22 =  640 - 500*(array[index][i-1] + e -min)/(max-min);

      float e11 =  640 - 500*(array[index][i] - e -min)/(max-min);
      float e21 =  640 - 500*(array[index][i] + e -min)/(max-min);


      if (e11 < 140) {
        e11 = 140;
      }
      if (e21 < 140) {
        e21 = 140;
      }
      if (e21 > 640) {
        e21 = 640;
      }
      if (e11 > 640) {
        e11 = 640;
      }
      if (e12 < 140) {
        e12 = 140;
      }
      if (e22 < 140) {
        e22 = 101400;
      }
      if (e22 > 640) {
        e22 = 640;
      }
      if (e12 > 640) {
        e12 = 640;
      }

      if (x2 < 950) {
        if (x1 < 950) {
          float m = (y2 - y1)/(x2-x1);
          float b = y1 - m*x1;
          if (y1 > 640 && y2 < 640 && y2 > 140) {
            y1 = 640;
            x1 = -(b - y1)/m;
          } else if (y2 > 640 && y1 < 640 && y1 > 140) {
            y2 = 640;
            x1 = -(b-y2)/m;
          } else if (y1 < 140 && y2 > 140 && y2 < 640) {

            y1 = 140;
            x1 = (y1-b)/m;
          } else if (y2 < 140 && y1 > 140 && y1 < 640) {
            y2 = 140;
            x2 = -(b-y2)/m;
          } else if (y1 < 140 && y2 > 640) {
            y1 = 140;
            x1 = (y1-b)/m;
            y2 = 640;
            x2 = -(b-y2)/m;
          } else if (y2 < 140 && y1 > 640) {
            y2 = 140;
            x2 = (y1-b)/m;
            y1 = 640;
            x1 = -(b-y2)/m;
          }
          if (strichdicke.name == "1 (dünn)") {
            strokeWeight(1);
          } else if (strichdicke.name == "2 (Standard)") {
            strokeWeight(2.5);
          } else {
            strokeWeight(5);
          }
          if (y1 >= 140 && y2>= 140 && y1 <= 640 && y2<= 640 && array[index][i] != 0) {
            if (connect) {
              line(x1, y1, x2, y2);
              if (error) {
                strokeWeight(1);
                line(x1, e11, x1, e21);
                line(x1-2, e11, x1+2, e11);
                line(x1-2, e21, x1+2, e21);
              }
            } else {
              if (error) {
                strokeWeight(1);
                line(x1, e11, x1, e21);
                line(x1-2, e11, x1+2, e11);
                line(x1-2, e21, x1+2, e21);
              }
              if (plot_first) {
                strokeWeight(1);
                plot_first = false;
                line(x2-2, y2, x2+2, y2);
                line(x2, y2-2, x2, y2+2);
              }
              line(x1-2, y1, x1+2, y1);
              line(x1, y1-2, x1, y1+2);
            }
          }
        } else {
          float m = (y2 - y1)/(x2-x1);
          float b = y1 - m*x1;
          x1 = 950;
          y1 = m*x2 + b;
          line(x1, y1, x2, y2);
        }
      }
    }
  }
  textSize(16);
  strokeWeight(1);
  if (index != -1) {
    if (c == color(255, 0, 0)) {
      textAlign(LEFT);
      if (aufgabe == "a") {
        if (e != 0.5 && indexInnenraumlufta > 1) {
          text("Aktueller Wert: (" + str(round(array[index][indexInnenraumlufta-1])).replace(".", ",") + " +/- " + round(e) + ") " + Einheit, 120, 80);
        } else {
          if (indexInnenraumlufta > 1) {
            text("Aktueller Wert: (" + str(round(array[index][indexInnenraumlufta-1])).replace(".", ",") + " +/- 0,5) " + Einheit, 120, 80);
          }
        }
      } else if (aufgabe == "b") {
        if (e != 0.5 && indexInnenraumluftb > 1) {
          text("Aktueller Wert: (" + str(round(array[index][indexInnenraumluftb-1])).replace(".", ",") + " +/- " + round(e) + ") " + Einheit, 120, 80);
        } else {
          if (indexInnenraumluftb > 1) {
            text("Aktueller Wert: (" + str(round(array[index][indexInnenraumluftb-1])).replace(".", ",") + " +/- 0,5) " + Einheit, 120, 80);
          }
        }
      } else if (aufgabe == "c") {
        if (e != 0.5 && indexInnenraumluftc > 1) {
          text("Aktueller Wert: (" + str(round(array[index][indexInnenraumluftc-1])).replace(".", ",") + " +/- " + round(e) + ") " + Einheit, 120, 80);
        } else {
          if (indexInnenraumluftc > 1) {
            text("Aktueller Wert: (" + str(round(array[index][indexInnenraumluftc-1])).replace(".", ",") + " +/- 0,5) " + Einheit, 120, 80);
          }
        }
      }
    } else if (c == color(0, 0, 255)) {
      textAlign(RIGHT);
      if (aufgabe == "a") {
        if (e != 0.5 && indexInnenraumlufta > 1) {
          text("Aktueller Wert: (" + str(round(array[index][indexInnenraumlufta-1])).replace(".", ",") + " +/- " + round(e) + ") " + Einheit, 950, 80);
        } else {
          if (indexInnenraumlufta > 1) {
            text("Aktueller Wert: (" + str(round(array[index][indexInnenraumlufta-1])).replace(".", ",") + " +/- 0,5) " + Einheit, 950, 80);
          }
        }
      } else if (aufgabe == "b") {
        if (e != 0.5 && indexInnenraumluftb > 1) {
          text("Aktueller Wert: (" + str(round(array[index][indexInnenraumluftb-1])).replace(".", ",") + " +/- " + round(e) + ") " + Einheit, 950, 80);
        } else {
          if (indexInnenraumluftb > 1) {
            text("Aktueller Wert: (" + str(round(array[index][indexInnenraumluftb-1])).replace(".", ",") + " +/- 0,5) " + Einheit, 950, 80);
          }
        }
      } else if (aufgabe == "c") {
        if (e != 0.5 && indexInnenraumluftc > 1) {
          text("Aktueller Wert: (" + str(round(array[index][indexInnenraumluftc-1])).replace(".", ",") + " +/- " + round(e) + ") " + Einheit, 950, 80);
        } else {
          if (indexInnenraumluftc > 1) {
            text("Aktueller Wert: (" + str(round(array[index][indexInnenraumluftc-1])).replace(".", ",") + " +/- 0,5) " + Einheit, 950, 80);
          }
        }
      }
    }
  }
}





float findMax(float[] array) {
  float max = -999;
  for (int i = 0; i < array.length; i++) {
    if (array[i] > max) {
      max = array[i];
    }
  }
  return max;
}

float findMin(float[] array) {
  float min = 99999;
  for (int i = 0; i < array.length; i++) {
    if (array[i] < min && array[i] != 0) {
      min = array[i];
    }
  }
  return min;
}


float[][] Innenraumluftb = new float[7][5000];
boolean Station4bgestartet = false;
boolean Station4bFertig = false;
int indexInnenraumluftb = 0;
int indexInnenraumluftbMax = 0;
float currentTime4b = -10000000;


void Innenraumluft_b() {
  fill(0);
  textSize(20);
  image(fan[round(0.25*frameCount)%8], 500, 30);
  int Rot = -1;
  int Blau = -1;

  float maxRot = 0;
  float minRot = 0;
  float maxBlau = 0;
  float minBlau = 0;

  if (Station4_Rot.name == "Temperatur") {
    Rot = 0;
    maxRot = 10*(scale_Innenraum1);
  } else if (Station4_Rot.name == "rel. Luftfeuchte") {
    Rot = 1;
    maxRot = 20*(scale_Innenraum1);
  } else if (Station4_Rot.name == "CO") {
    Rot = 2;
    maxRot = 1000*(scale_Innenraum1);
  } else if (Station4_Rot.name == "TVOC") {
    Rot = 3;
    maxRot = 100*(scale_Innenraum1);
  } else if (Station4_Rot.name == "eCO") {
    Rot = 4;
    maxRot = 500*(scale_Innenraum1);
  }

  if (Station4_Blau.name == "Temperatur") {
    Blau = 0;
    maxBlau = 10*(scale_Innenraum2);
  } else if (Station4_Blau.name == "rel. Luftfeuchte") {
    Blau = 1;
    maxBlau = 20*(scale_Innenraum2);
  } else if (Station4_Blau.name == "CO") {
    Blau = 2;
    maxBlau = 1000*(scale_Innenraum2);
  } else if (Station4_Blau.name == "TVOC") {
    Blau = 3;
    maxBlau = 100*(scale_Innenraum2);
  } else if (Station4_Blau.name == "eCO") {
    Blau = 4;
    maxBlau = 500*(scale_Innenraum2);
  }




  if (Station4_Blau.name == "Temperatur") {
    Temperatur_Doppfelpfeil_down2.show();
    Temperatur_Doppfelpfeil_up2.show();
  } else {
    Temperatur_Doppfelpfeil_down2.hide();
    Temperatur_Doppfelpfeil_up2.hide();
  }

  if (Station4_Rot.name == "Temperatur") {
    Temperatur_Doppfelpfeil_down1.show();
    Temperatur_Doppfelpfeil_up1.show();
  } else {
    Temperatur_Doppfelpfeil_down1.hide();
    Temperatur_Doppfelpfeil_up1.hide();
  }




  if (Temperatur_Doppfelpfeil_down1.isClicked()) {
    index_unten_rot -= 1;
    if (index_unten_rot < 0) {
      index_unten_rot = 5;
    }
  }
  if (Temperatur_Doppfelpfeil_up1.isClicked()) {
    index_unten_rot += 1;
    if (index_unten_rot > 5) {
      index_unten_rot = 0;
    }
  }
  if (Temperatur_Doppfelpfeil_down2.isClicked()) {
    index_unten_blau -= 1;
    if (index_unten_blau < 0) {
      index_unten_blau = 5;
    }
  }
  if (Temperatur_Doppfelpfeil_up2.isClicked()) {
    index_unten_blau += 1;
    if (index_unten_blau > 5) {
      index_unten_blau = 0;
    }
  }




  float offset_rot = 0;
  float offset_blau = 0;




  if (up1.isClicked()) {
    if (Station4_Rot.name == "Temperatur") {
      scale_Innenraum1 += 1;
      if (scale_Innenraum1 > 3) {
        scale_Innenraum1 = 2;
      }
    } else {
      scale_Innenraum1 += 1;
      if (scale_Innenraum1 > 5) {
        scale_Innenraum1 = 0;
      }
    }
  }
  if (Station4_Rot.name == "Temperatur") {
    if (scale_Innenraum1 < 1) {
      scale_Innenraum1 = 3;
    }
    if (scale_Innenraum1 > 3) {
      scale_Innenraum1 = 2;
    }
  }

  if (Station4_Blau.name == "Temperatur") {
    if (scale_Innenraum2 < 2) {
      scale_Innenraum2 = 3;
    }
    if (scale_Innenraum2 > 3) {
      scale_Innenraum2 = 2;
    }
  }
  if (down1.isClicked()) {
    if (Station4_Rot.name == "Temperatur") {
      scale_Innenraum1 -= 1;
      if (scale_Innenraum1 < 2) {
        scale_Innenraum1 = 3;
      }
    } else {
      scale_Innenraum1 -= 1;
      if (scale_Innenraum1 < 0) {
        scale_Innenraum1 = 5;
      }
    }
  }
  if (up2.isClicked()) {
    if (Station4_Blau.name == "Temperatur") {
      scale_Innenraum2 += 1;
      if (scale_Innenraum2 > 3) {
        scale_Innenraum2 = 2;
      }
    } else {
      scale_Innenraum2 += 1;
      if (scale_Innenraum2 > 5) {
        scale_Innenraum2 = 0;
      }
    }
  }
  if (down2.isClicked()) {
    if (Station4_Blau.name == "Temperatur") {
      scale_Innenraum2 -= 1;
      if (scale_Innenraum2 < 2) {
        scale_Innenraum2 = 3;
      }
    } else {
      scale_Innenraum2 -= 1;
      if (scale_Innenraum2 < 0) {
        scale_Innenraum2 = 5;
      }
    }
  }


  if (Station4Start.isClicked()) {
    //  for (int i = 0; i < 5000; i++) {
    //    for (int j = 0; j < 7; j++) {
    //      Innenraumluftb[j][i] = 0;
    //    }
    //  }
    Station4bgestartet = true;
    currentTime4b = millis();
    indexInnenraumluftb = 0;
  }

  // Zeichne den Hintergrund
  fill(255);
  stroke(0);
  rect(120, 140, 830, 500);
  fill(230);
  rect(1080, -1, 200, 720);
  stroke(100, 100);
  line(431.75, 140, 431.75, 640);
  line(742.5, 140, 742.5, 640);
  textSize(60);
  textAlign(CENTER, CENTER);
  text("Ruhig\nsitzen", 275.75, 380);
  text("Sport\nmachen!", 587.5, 380);
  text("Tür\nauf!", 840.25, 380);
  textSize(20);
  noStroke();
  fill(0);
  text(round(0.375*time_Station4), 431.75, 660);
  text(round(0.75*time_Station4), 742.5, 660);
  if (scale_Innenraum1 == 0 && Rot!=-1) {
    minRot = 99999;
    maxRot = 0;
    for (int i = 0; i < 5000; i++) {
      if (Innenraumluftb[Rot][i] < minRot && Innenraumluftb[Rot][i] != 0) {
        minRot = Innenraumluftb[Rot][i];
      }
      if (Innenraumluftb[Rot][i] > maxRot) {
        maxRot = Innenraumluftb[Rot][i];
      }
    }
  }
  if (scale_Innenraum2 == 0 && Blau != -1) {
    minBlau = 99999;
    maxBlau = 0;
    for (int i = 0; i < 5000; i++) {
      if (Innenraumluftb[Blau][i] < minBlau && Innenraumluftb[Blau][i] != 0) {
        minBlau = Innenraumluftb[Blau][i];
      }
      if (Innenraumluftb[Blau][i] > maxBlau) {
        maxBlau = Innenraumluftb[Blau][i];
      }
    }
  }


  if (Station4_Blau.name == "Temperatur") {
    offset_blau = (index_unten_blau)*maxBlau/5;
  }

  if (Station4_Rot.name == "Temperatur") {
    offset_rot = (index_unten_rot)*maxRot/5;
  }

  if (scale_Innenraum1 != 0) {
    minRot = minRot+ offset_rot;
    maxRot = maxRot+ offset_rot;
  }
  if (scale_Innenraum2 != 0) {
    minBlau = minBlau+ offset_blau;
    maxBlau = maxBlau+ offset_blau;
  }

  stroke(200);
  for (int i = 0; i < 4; i++) {
    line(120, 240 +100*i, 950, 240 + 100*i);
  }
  fill(0);
  textAlign(CENTER);
  fill(255, 0, 0);
  if (Rot != -1 && maxRot != 0) {
    for (int i = 0; i< 6; i++) {
      text(round(minRot + i*(maxRot-minRot)/(5)), 85, 650 - 100*i);
    }
  }
  fill(0, 0, 255);
  if (Blau != -1 && maxBlau != 0) {
    for (int i = 0; i< 6; i++) {
      text(round(minBlau + i*(maxBlau-minBlau)/(5)), 985, 650 - 100*i);
    }
  }
  textAlign(CORNER);
  fill(0);
  noStroke();
  textSize(30);
  text("Optionen", 1120, 50);
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
  textAlign(CORNER);




  plotStation4(Innenraumluftb, Rot, minRot, maxRot, color(255, 0, 0), verbinde_innenraum.checked, fehler_innenraum.checked, "b");
  plotStation4(Innenraumluftb, Blau, minBlau, maxBlau, color(0, 0, 255), verbinde_innenraum.checked, fehler_innenraum.checked, "b");

  fill(0);
  textSize(20);
  text("0", 115, 670);
  text(nf(time_Station4, 0, 0), 938, 670);
  strokeWeight(1);
  fill(240);
  stroke(0);
  rect(1105, 190, 155, 85);
  fill(0);
  textSize(13);
  textAlign(CENTER);
  text("Messunsicherheit", 1165, 215);
  textSize(16);
  text("verbinden", 1165, 260);
  textSize(20);
  textAlign(CENTER);
  text("Ventilator anschalten!", 550, 25);
  text("Zeit in Sekunden", 550, 700);
  fill(0);
  back.show();
  zumObermenu.show();
  if (Blau != -1) {
    up2.show();
    down2.show();
  } else {
    up2.hide();
    down2.hide();
  }

  if (Rot != -1) {
    up1.show();
    down1.show();
  } else {
    up1.hide();
    down1.hide();
  }

  if (!Station4bgestartet) {
    Station4Start.show();

    station4_MessungWiederholen.hide();
  } else {
    Station4Start.hide();
    station4_MessungWiederholen.show();
  }
  Station4_Rot.show();
  Station4_Blau.show();
  aktualisierung_right.show();
  aktualisierung_left.show();
  fehler_innenraum.show();
  verbinde_innenraum.show();


  fill(255, 100, 100, 50);
  noStroke();
  if (indexInnenraumluftb >0) {
    if (Innenraumluftb[6][indexInnenraumluftb-1] < 0.375*time_Station4) {
      rect(120, 140, 311.25, 500);
    } else if (Innenraumluftb[6][indexInnenraumluftb-1] < 0.75*time_Station4) {
      rect(431.25, 140, 311.25, 500);
    } else if (Innenraumluftb[6][indexInnenraumluftb-1] < time_Station4) {
      rect(741.5, 140, 207.5, 500);
    }
  }




  for (int i = 0; i < 5000; i++) {
    if (Innenraumluftb[6][i] > time_Station4 - 0.99) {
      Station4bFertig = true;
      Station4bgestartet = false;
      break;
    } else {
      Station4bFertig = false;
    }
  }
  if (Station4bFertig) {
    Station4Auswertung.show();
  } else {
    Station4Auswertung.hide();
  }

  if (freie_stationen.name == "freigeben") {
    Station4Auswertung.show();
  }
  pushMatrix();
  translate(width/2, height/2);
  rotate(3*PI/2);
  fill(255, 0, 0);
  if (Rot == 6) {
    text(nf(time_Station4, 0, 0), 938, 660);
    text("Zeit in Sekunden", -100, -595);
  } else if (Rot == 0) {
    text("Temperatur in °C", height/2 -490, -width/2 + 50);
  } else if (Rot == 1) {
    text("rel. Luftfeuchte in %", height/2 -490, -width/2 + 50);
  } else if (Rot == 2) {
    text("CO  in ppm", height/2 -490, -width/2 + 50);
    textSize(16);
    text("2", height/2 -462, -width/2 + 60);
    textSize(20);
  } else if (Rot == 3) {
    text("TVOC in ppb", height/2 -490, -width/2 + 50);
  } else if (Rot == 4) {
    text("eCO  in ppm", height/2 -490, -width/2 + 50);
    textSize(16);
    text("2", height/2 -455, -width/2 + 60);
    textSize(20);
  }
  popMatrix();
  pushMatrix();
  translate(width/2, height/2);
  rotate(PI/2);
  fill(0, 0, 255);
  if (Blau == 0) {
    text("Temperatur in °C", -height/2 +300, width/2 - 1050);
  } else if (Blau == 1) {
    text("rel. Luftfeuchte in %", -height/2 +300, width/2 - 1050);
  } else if (Blau == 2) {
    text("CO  in ppm", -height/2 +300, width/2 - 1050);
    textSize(16);
    text("2", -height/2 +330, width/2 - 1040);
    textSize(20);
  } else if (Blau == 3) {
    text("TVOC in ppb", -height/2 +300, width/2 - 1050);
  } else if (Blau == 4) {
    text("eCO  in ppm", -height/2 +300, width/2 - 1050);
    textSize(16);
    text("2", -height/2 +343, width/2 - 1040);
    textSize(20);
  }
  popMatrix();
}




float[][] Innenraumluftc = new float[7][5000];
boolean Station4cgestartet = false;
boolean Station4cFertig = false;
int indexInnenraumluftc = 0;
int indexInnenraumluftcMax = 0;
float currentTime4c = -10000000;



boolean zeroPercent = true;
boolean fiftyPercent = true;
boolean hundredPercent = true;
int indexX = 6;
int indexY = 6;



void AuswertungInnenraum() {


  stroke(0);
  fill(255);

  rect(100, 60, 440, 260);
  rect(100, 350, 440, 260); 

  rect(740, 60, 440, 260);
  rect(740, 350, 440, 260);

  line(640, 0, 640, 720);

  noStroke();

  fill(230, 200);
  rect(101, 61, 164, 259);
  rect(101, 351, 164, 259);

  rect(741, 61, 164, 259);
  rect(741, 351, 164, 259);

  fill(200, 200);
  rect(266, 61, 164, 259);
  rect(266, 351, 164, 259);

  rect(906, 61, 164, 259);
  rect(906, 351, 164, 259);

  fill(0);
  textSize(30);
  textAlign(CENTER);
  text("ohne Ventilator", 332.5, 30);
  text("mit Ventilator", 947.5, 30);

  textSize(20);
  pushMatrix();
  translate(width/2, height/2);
  rotate(3*PI/2);
  fill(255, 0, 0);
  text("CO   in ppm", height/2 -180, -width/2 + 40);
  text("Temperatur in °C", height/2 -490, -width/2 + 40);
  text("CO   in ppm", height/2 -180, -width/2 + 670);
  text("Temperatur in °C", height/2 -490, -width/2 + 670);

  textSize(16);
  fill(255, 0, 0);
  text("2", height/2 -200, -width/2 + 50);
  text("2", height/2 -200, -width/2 + 680);
  popMatrix();
  textSize(20);
  pushMatrix();
  translate(width/2, height/2);
  rotate(PI/2);
  fill(0, 0, 255);
  text("rel. Luftfeuchte in %", -height/2 +480, width/2 - 600);
  text("TVOC in ppb", -height/2 + 180, width/2 - 600);
  text("rel. Luftfeuchte in %", -height/2 +480, width/2 - 1230);
  text("TVOC in ppb", -height/2 + 180, width/2 - 1230);

  popMatrix();
  fill(100, 100);
  textSize(30);
  text("Ruhig\nsitzen", 183, 180);
  text("Sport\nmachen!", 345, 180);
  text("Tür\nauf!", 485, 180);

  text("Ruhig\nsitzen", 183, 470);
  text("Sport\nmachen!", 345, 470);
  text("Tür\nauf!", 485, 470);

  text("Ruhig\nsitzen", 823, 180);
  text("Sport\nmachen!", 985, 180);
  text("Tür\nauf!", 1125, 180);

  text("Ruhig\nsitzen", 823, 470);
  text("Sport\nmachen!", 985, 470);
  text("Tür\nauf!", 1125, 470);


  float maxTemperatur = 36;
  float minTemperatur = 16;
  float maxLuftfeuchte = 100;
  float maxCO2 = 5000;
  float maxTVOC = 500;
  textSize(12);
  fill(255, 0, 0);

  if (strichdicke.name == "1 (dünn)") {
    strokeWeight(1);
  } else if (strichdicke.name == "2 (Standard)") {
    strokeWeight(2.5);
  } else {
    strokeWeight(5);
  }
  for (int i = 0; i < 6; i++) {
    text(round(maxCO2 - i*maxCO2/5), 70, 65 + 52*i);
    text(round(maxTemperatur - i*(maxTemperatur - minTemperatur)/5), 70, 361 + 52*i);
    text(round(maxCO2 - i*maxCO2/5), 710, 65 + 52*i);
    text(round(maxTemperatur - i*(maxTemperatur- minTemperatur)/5), 710, 361 + 52*i);
  }

  fill(0, 0, 255);
  for (int i = 0; i < 6; i++) {
    text(round(maxTVOC - i*maxTVOC/5), 570, 65 + 52*i);
    text(round(maxLuftfeuchte - i*(maxLuftfeuchte)/5), 570, 361 + 52*i);
    text(round(maxTVOC - i*maxTVOC/5), 1200, 65 + 52*i);
    text(round(maxLuftfeuchte - i*(maxLuftfeuchte)/5), 1200, 361 + 52*i);
  }



  for (int i = 1; i < indexInnenraumlufta; i++) {
    float x1 = 101 + 440*(Innenraumlufta[6][i-1]-Innenraumlufta[6][0])/(Innenraumlufta[6][indexInnenraumlufta-1]-Innenraumlufta[6][0]);
    float y1 = 320 - 260*Innenraumlufta[2][i-1]/maxCO2;
    float x2 = 101 + 440*(Innenraumlufta[6][i]-Innenraumlufta[6][0])/(Innenraumlufta[6][indexInnenraumlufta-1]-Innenraumlufta[6][0]);
    float y2 = 320 - 260*Innenraumlufta[2][i]/maxCO2;
    stroke(255, 0, 0);
    if (y1 > 60 && y2 > 60) {
      line(x1, y1, x2, y2);
    }
    y1 =  610 - 260*(Innenraumlufta[0][i-1]-minTemperatur)/(maxTemperatur - minTemperatur);
    y2 =  610 - 260*(Innenraumlufta[0][i]-minTemperatur)/(maxTemperatur - minTemperatur);
    if (y1 > 350 && y2 > 350) {
      line(x1, y1, x2, y2);
    }
    y1 =  320 - 260*Innenraumlufta[3][i-1]/maxTVOC;
    y2 =  320 - 260*Innenraumlufta[3][i]/maxTVOC;
    stroke(0, 0, 255);
    if (y1 > 60 && y2 > 60) {
      line(x1, y1, x2, y2);
    }
    y1 =  610 - 260*Innenraumlufta[1][i-1]/maxLuftfeuchte;
    y2 =  610 - 260*Innenraumlufta[1][i]/maxLuftfeuchte;
    if (y1 > 350 && y2 > 350) {
      line(x1, y1, x2, y2);
    }
  }

  for (int i = 1; i < indexInnenraumluftb; i++) {
    float x1 = 741 + 440*(Innenraumluftb[6][i-1]-Innenraumluftb[6][0])/(Innenraumluftb[6][indexInnenraumluftb-1]-Innenraumluftb[6][0]);
    float y1 = 320 - 260*Innenraumluftb[2][i-1]/maxCO2;
    float x2 = 741 + 440*(Innenraumluftb[6][i]-Innenraumluftb[6][0])/(Innenraumluftb[6][indexInnenraumluftb-1]-Innenraumluftb[6][0]);
    float y2 = 320 - 260*Innenraumluftb[2][i]/maxCO2;
    stroke(255, 0, 0);
    if (y1 > 60 && y2 > 60) {
      line(x1, y1, x2, y2);
    }
    y1 =  610 - 260*(Innenraumluftb[0][i-1]-minTemperatur)/(maxTemperatur - minTemperatur);

    y2 =  610 - 260*(Innenraumluftb[0][i]-minTemperatur)/(maxTemperatur - minTemperatur);
    if (y1 > 350 && y2 > 350) {
      line(x1, y1, x2, y2);
    }
    y1 =  320 - 260*Innenraumluftb[3][i-1]/maxTVOC;
    y2 =  320 - 260*Innenraumluftb[3][i]/maxTVOC;
    stroke(0, 0, 255);
    if (y1 > 60 && y2 > 60) {
      line(x1, y1, x2, y2);
    }
    y1 =  610 - 260*Innenraumluftb[1][i-1]/maxLuftfeuchte;
    y2 =  610 - 260*Innenraumluftb[1][i]/maxLuftfeuchte;
    if (y1 > 350 && y2 > 350) {
      line(x1, y1, x2, y2);
    }
  }
  strokeWeight(1);

  stroke(100, 100);
  for (int i = 0; i<5; i++) {
    line(100, 60 + 52*i, 540, 60 + 52*i);
    line(100, 350 + 52*i, 540, 350 + 52*i);
    line(740, 60 + 52*i, 1180, 60 + 52*i);
    line(740, 350 + 52*i, 1180, 350 + 52*i);
  }

  for (int i = 0; i < 8; i++) {
    line(100 + 55*i, 60, 100 + 55*i, 320); 
    line(100 + 55*i, 350, 100 + 55*i, 610);

    line(740 + 55*i, 60, 740 + 55*i, 320); 
    line(740 + 55*i, 350, 740 + 55*i, 610);
  }


  stroke(0);
  line(0, 335, 1280, 335);
  noStroke();
  fill(0);
  textSize(20);
  textAlign(CENTER);
  text("Zeit in Sekunden", 320, 680); 
  text("Zeit in Sekunden", 960, 680); 
  textSize(16);
  text("0", 100, 640);
  text(round(0.375*time_Station4), 265, 640);
  text(round(0.75*time_Station4), 430, 640);
  text(time_Station4, 545, 640);


  text("0", 740, 640);
  text(round(0.375*time_Station4), 905, 640);
  text(round(0.75*time_Station4), 1070, 640);
  text(time_Station4, 1185, 640);
}






void plot4(float[] arrX, float[] arrY, color c, float maxX, float minX, float maxY, float minY) {
  int maxIndex = 0;
  for (int i = arrX.length-1; i > 0; i--) {
    if (arrX[i] != 0) {
      maxIndex = i-1;
      break;
    }
  }



  stroke(c);
  if (strichdicke.name == "1 (dünn)") {
    strokeWeight(1);
  } else if (strichdicke.name == "2 (Standard)") {
    strokeWeight(2.5);
  } else {
    strokeWeight(5);
  }
  if (verbinde_innenraum.checked) {
    for (int i = 1; i < maxIndex; i++) {
      float x1 = 120 + 830*(arrX[i-1]-minX)/(maxX-minX);
      float y1 = 640 - 500*(arrY[i-1]-minY)/(maxY-minY);

      float x2 = 120 + 830*(arrX[i]-minX)/(maxX-minX);
      float y2 = 640 - 500*(arrY[i]-minY)/(maxY-minY);

      if (x1 >= 120 && x1 <= 950 && x2 >= 120 && x2 <= 950 && y1 > 140 && y2 <= 640 && y2 > 140 && y1 <= 640) {
        line(x1, y1, x2, y2);
      }
    }
  } else {
    for (int i = 0; i < maxIndex; i++) {
      float x = 120 + 830*(arrX[i]-minX)/(maxX-minX);
      float y = 640 - 500*(arrY[i]-minY)/(maxY-minY);
      if (x >= 120 && x <= 950 && y > 140 && y <= 640) {
        line(x-3, y, x+3, y);
        line(x, y-3, x, y+3);
      }
    }
  }
  strokeWeight(1);
}




void analyse() {
  float x1 = s.x1-120;
  float x2 = s.x2-120;

  // 1. Schritt: Finde die entsprechenden Array Indizes
  // Es gibt "indexInnenraumluftabc" Daten im Array, die auf 830 Pixel verteilt sind

  float dichteA = float(indexInnenraumlufta)/830;
  float dichteB = float(indexInnenraumluftb)/830;

  // Entsprechender Index zu x1, x2

  int indexX1A = round(x1*dichteA);
  int indexX2A = floor(x2*dichteA);

  int indexX1B = round(x1*dichteB);
  int indexX2B = floor(x2*dichteB);

  // 2. Schritt: Merkmale Maximum, Minimum, Steigung und Mittelwert in diesem Intervall berechnen

  float MaxA = 0;
  float MinA = 99999;
  float MWA = 0;
  float SteigungA = 0;

  float MaxB = 0;
  float MinB = 99999;
  float MWB = 0;
  float SteigungB = 0;

  float MWA_fuerSteigung = 0;
  float MWB_fuerSteigung = 0;

  //Merkmale A
  if (indexX1A >= 0) {
    for (int i = indexX1A; i < indexX2A + 1; i++) {
      if (Innenraumlufta[indexY][i] > MaxA) {
        MaxA = Innenraumlufta[indexY][i];
      }
      if (Innenraumlufta[indexY][i] < MinA && Innenraumlufta[indexY][i] != 0) {
        MinA =  Innenraumlufta[indexY][i];
      }
      MWA += Innenraumlufta[indexY][i];

      // Für die Steigung
      MWA_fuerSteigung += Innenraumlufta[6][i];
    }
    MWA = MWA/(indexX2A+ 1 - indexX1A);
    MWA_fuerSteigung = MWA_fuerSteigung/(indexX2A+ 1 - indexX1A);

    float Steigung_Zaehler_A = 0;
    float Steigung_Nenner_A = 0;
    for (int i = indexX1A; i < indexX2A + 1; i++) {
      Steigung_Zaehler_A += (Innenraumlufta[6][i] - MWA_fuerSteigung)*(Innenraumlufta[indexY][i] - MWA);
      Steigung_Nenner_A += (Innenraumlufta[6][i] - MWA_fuerSteigung)*(Innenraumlufta[6][i] - MWA_fuerSteigung);
    }
    SteigungA = Steigung_Zaehler_A/Steigung_Nenner_A;
  }

  //Merkmale B
  if (indexX1B >= 0) {
    for (int i = indexX1B; i < indexX2B + 1; i++) {
      if (Innenraumluftb[indexY][i] > MaxB) {
        MaxB = Innenraumluftb[indexY][i];
      }
      if (Innenraumluftb[indexY][i] < MinB && Innenraumluftb[indexY][i] != 0) {
        MinB =  Innenraumluftb[indexY][i];
      }
      MWB += Innenraumluftb[indexY][i];
      MWB_fuerSteigung += Innenraumluftb[6][i];
    }
    MWB = MWB/(indexX2B + 1 - indexX1B);
    MWB_fuerSteigung = MWB_fuerSteigung/(indexX2B+ 1 - indexX1B);

    float Steigung_Zaehler_B = 0;
    float Steigung_Nenner_B = 0;
    for (int i = indexX1B; i < indexX2B + 1; i++) {
      Steigung_Zaehler_B += (Innenraumluftb[6][i] - MWB_fuerSteigung)*(Innenraumluftb[indexY][i] - MWB);
      Steigung_Nenner_B += (Innenraumluftb[6][i] - MWB_fuerSteigung)*(Innenraumluftb[6][i] - MWB_fuerSteigung);
    }
    SteigungB = Steigung_Zaehler_B/Steigung_Nenner_B;
  }
  fill(255, 100, 100, 100);
  stroke(0);
  rect(1080, 100, 200, 25);
  fill(100, 255, 100, 100);
  rect(1080, 250, 200, 25);

  fill(100, 100, 255, 100);
  rect(1080, 400, 200, 25);
  fill(255);
  rect(1080, 425, 200, 115);
  rect(1080, 275, 200, 115);
  rect(1080, 125, 200, 115);
  fill(0);
  stroke(0);
  line(1080, 125, 1280, 125);
  line(1080, 275, 1280, 275);
  line(1080, 425, 1280, 425);

  noStroke();

  String Einheit = "";



  if (indexY == 0) {
    Einheit = "°C";
  } else if (indexY == 1) {
    Einheit = "%";
  } else if (indexY == 2) {
    Einheit = "ppm";
  } else if (indexY == 3) {
    Einheit = "ppb";
  } else if (indexY == 4) {
    Einheit = "ppm";
  }

  textSize(16);
  textAlign(CENTER);
  text("ohne Ventilator", 1180, 120);
  text("mit Ventilator", 1180, 270);
  // text("100% Lüfter", 1180, 420);

  text("Maximum: " + nf(MaxA, 0, 1) + " in " + Einheit, 1180, 150);
  text("Minimum: " + nf(MinA, 0, 1) + " in " + Einheit, 1180, 175);
  text("Mittelwert: " + nf(MWA, 0, 1) + " in " + Einheit, 1180, 200);
  text("Steigung: " + nf(SteigungA, 0, 1) + " in " + Einheit + "/s", 1180, 225);

  text("Maximum: " + nf(MaxB, 0, 1) + " in " + Einheit, 1180, 300);
  text("Minimum: " + nf(MinB, 0, 1) + " in " + Einheit, 1180, 325);
  text("Mittelwert: " + nf(MWB, 0, 1) + " in " + Einheit, 1180, 350);
  text("Steigung: " + nf(SteigungB, 0, 1)+ " in " + Einheit + "/s", 1180, 375);

  textAlign(CORNER);
}



boolean analyse_bool = false;

class slider {
  float x1;
  float x2;
  boolean active1;
  boolean active2;

  slider(float x1_, float x2_, boolean active1_, boolean active2_) {
    x1 = x1_;
    x2 = x2_;
    active1 = active1_;
    active2 = active2_;
  }


  void show() {
    //Boden = Dreieck
    stroke(100, 100, 255);
    fill(100, 100, 255);
    beginShape();
    vertex(x1-10, 650);
    vertex(x1, 640);
    vertex(x1+10, 650);
    vertex(x1-10, 650);
    endShape();
    strokeWeight(3);
    stroke(200);
    line(x1, 140, x1, 637);

    stroke(100, 100, 255);
    fill(100, 100, 255);
    beginShape();
    vertex(x2-10, 650);
    vertex(x2, 640);
    vertex(x2+10, 650);
    vertex(x2-10, 650);
    endShape();
    strokeWeight(3);
    stroke(200);
    line(x2, 140, x2, 637);
    strokeWeight(1);

    fill(200, 200, 255, 100);
    rect(x1, 140, (x2-x1), 500);
  }


  void move() {
    if (mouseX > (x1 - 10)*scale_factor && mouseX < (x1 + 10)*scale_factor && mousePressed) {
      active1 = true;
    }
    if (mouseX > (x2 - 10)*scale_factor && mouseX < (x2 + 10)*scale_factor && mousePressed) {
      active2 = true;
    }

    if (!mousePressed) {
      active1 = false;
      active2 = false;
    }

    if (active1) {
      x1 = mouseX; 
      if (x1 < 120) {
        x1 = 120;
      }
      if (x1 > 930) {
        x1 = 930;
      }
    }
    if (active2) {
      x2 = mouseX; 
      if (x2 < 170) {
        x2 = 170;
      }
      if (x2 > 950) {
        x2 = 950;
      }
    }

    if (abs(x1 - x2) < 50) {
      x1 = x2- 50;
      x2 = x1 + 50;
    }
  }
}





class slider_MS {
  float x1;
  float x2;
  boolean active1;
  boolean active2;

  slider_MS(float x1_, float x2_, boolean active1_, boolean active2_) {
    x1 = x1_;
    x2 = x2_;
    active1 = active1_;
    active2 = active2_;
  }


  void show() {
    //Boden = Dreieck
    stroke(100, 100, 255);
    fill(100, 100, 255);
    beginShape();
    vertex(x1-10, 640);
    vertex(x1, 630);
    vertex(x1+10, 640);
    vertex(x1-10, 640);
    endShape();
    strokeWeight(3);
    stroke(200);
    line(x1, 190, x1, 600);

    stroke(100, 100, 255);
    fill(100, 100, 255);
    beginShape();
    vertex(x2-10, 640);
    vertex(x2, 630);
    vertex(x2+10, 640);
    vertex(x2-10, 640);
    endShape();
    strokeWeight(3);
    stroke(200);
    line(x2, 190, x2, 620);
    strokeWeight(1);
    noStroke();
    fill(200, 200, 255, 40);
    rect(x1, 190, (x2-x1), 400);
  }


  void move() {
    if (mouseX > (x1 - 10)*scale_factor && mouseX < (x1 + 10)*scale_factor && mousePressed) {
      active1 = true;
    }
    if (mouseX > (x2 - 10)*scale_factor && mouseX < (x2 + 10)*scale_factor && mousePressed) {
      active2 = true;
    }

    if (!mousePressed) {
      active1 = false;
      active2 = false;
    }

    if (active1) {
      x1 = mouseX/scale_factor; 
      if (x1 < 500) {
        x1 = 500;
      }
      if (x1 > 1170) {
        x1 = 1170;
      }
    }
    if (active2) {
      x2 = mouseX/scale_factor; 
      if (x2 < 550) {
        x2 = 550;
      }
      if (x2 > 1200) {
        x2 = 1200;
      }
    }

    if (abs(x1 - x2) < 50) {
      x1 = x2 - 50*scale_factor;
      x2 = x1 + 50*scale_factor;
    }
  }
}



















void mouseReleased() {
  if (mouseX > Kalibrierung2_2.x*scale_factor && mouseX < (Kalibrierung2_2.x + Kalibrierung2_2.dx)*scale_factor && mouseY > Kalibrierung2_2.y*scale_factor && mouseY < (Kalibrierung2_2.y + Kalibrierung2_2.dy)*scale_factor) {
    if (Kalibrierung2_2.active) {
      Kalibrierung2_2.active = false;
    } else {
      Kalibrierung2_2.active = true;
    }
  } else {
    Kalibrierung2_2.active = false;
  }


  if (mouseX > Zeit_Station3.x*scale_factor && mouseX < (Zeit_Station3.x + Zeit_Station3.dx)*scale_factor && mouseY > Zeit_Station3.y*scale_factor && mouseY < (Zeit_Station3.y + Zeit_Station3.dy)*scale_factor) {
    if (Zeit_Station3.active) {
      Zeit_Station3.active = false;
    } else {
      Zeit_Station3.active = true;
    }
  } else {
    Zeit_Station3.active = false;
  }



  if (mouseX > a.x*scale_factor && mouseX < (a.x + a.dx)*scale_factor && mouseY > a.y*scale_factor && mouseY < (a.y + a.dy)*scale_factor) {
    a.active = true;
    b.active = false;
    c.active = false;
    d.active = false;
    e.active = false;

    a2.active = false;
    b2.active = false;
    c2.active = false;
    d2.active = false;
    e2.active = false;
  } else {
    a.active = false;
  }

  if (mouseX > b.x*scale_factor && mouseX < (b.x + b.dx)*scale_factor && mouseY > b.y*scale_factor && mouseY < (b.y + b.dy)*scale_factor) {
    b.active = true;
    a.active = false;
    c.active = false;
    d.active = false;
    e.active = false;

    a2.active = false;
    b2.active = false;
    c2.active = false;
    d2.active = false;
    e2.active = false;
  } else {
    b.active = false;
  }

  if (mouseX > c.x*scale_factor && mouseX < (c.x + c.dx)*scale_factor && mouseY > c.y*scale_factor && mouseY < (c.y + c.dy)*scale_factor) {
    c.active = true;
    a.active = false;
    b.active = false;
    d.active = false;
    e.active = false;

    a2.active = false;
    b2.active = false;
    c2.active = false;
    d2.active = false;
    e2.active = false;
  } else {
    c.active = false;
  }

  if (mouseX > d.x*scale_factor && mouseX < (d.x + d.dx)*scale_factor && mouseY > d.y*scale_factor && mouseY < (d.y + d.dy)*scale_factor) {
    d.active = true;
    a.active = false;
    c.active = false;
    b.active = false;
    e.active = false;

    a2.active = false;
    b2.active = false;
    c2.active = false;
    d2.active = false;
    e2.active = false;
  } else {
    d.active = false;
  }

  if (mouseX > e.x*scale_factor && mouseX < (e.x + e.dx)*scale_factor && mouseY > e.y*scale_factor && mouseY < (e.y + e.dy)*scale_factor) {
    e.active = true;
    a.active = false;
    c.active = false;
    d.active = false;
    b.active = false;

    a2.active = false;
    b2.active = false;
    c2.active = false;
    d2.active = false;
    e2.active = false;
  } else {
    e.active = false;
  }


  ///////////////
  if (mouseX > a2.x*scale_factor && mouseX < (a2.x + a2.dx)*scale_factor && mouseY > a2.y*scale_factor && mouseY < (a2.y + a2.dy)*scale_factor) {
    a2.active = true;
    b.active = false;
    c.active = false;
    d.active = false;
    e.active = false;

    a.active = false;
    b2.active = false;
    c2.active = false;
    d2.active = false;
    e2.active = false;
  } else {
    a2.active = false;
  }

  if (mouseX > b2.x*scale_factor && mouseX < (b2.x + b2.dx)*scale_factor && mouseY > b2.y*scale_factor && mouseY < (b2.y + b2.dy)*scale_factor) {
    b2.active = true;
    a.active = false;
    c.active = false;
    d.active = false;
    e.active = false;

    a2.active = false;
    b.active = false;
    c2.active = false;
    d2.active = false;
    e2.active = false;
  } else {
    b2.active = false;
  }

  if (mouseX > c2.x*scale_factor && mouseX < (c2.x + c2.dx)*scale_factor && mouseY > c2.y*scale_factor && mouseY < (c2.y + c2.dy)*scale_factor) {
    c2.active = true;
    a.active = false;
    b.active = false;
    d.active = false;
    e.active = false;

    a2.active = false;
    b2.active = false;
    c.active = false;
    d2.active = false;
    e2.active = false;
  } else {
    c2.active = false;
  }

  if (mouseX > d2.x*scale_factor && mouseX < (d2.x + d2.dx)*scale_factor && mouseY > d2.y*scale_factor && mouseY < (d2.y + d2.dy)*scale_factor) {
    d2.active = true;
    a.active = false;
    c.active = false;
    b.active = false;
    e.active = false;

    a2.active = false;
    b2.active = false;
    c2.active = false;
    d.active = false;
    e2.active = false;
  } else {
    d2.active = false;
  }

  if (mouseX > e2.x*scale_factor && mouseX < (e2.x + e2.dx)*scale_factor && mouseY > e2.y*scale_factor && mouseY < (e2.y + e2.dy)*scale_factor) {
    e2.active = true;
    a.active = false;
    c.active = false;
    d.active = false;
    b.active = false;

    a2.active = false;
    b2.active = false;
    c2.active = false;
    d2.active = false;
    e.active = false;
  } else {
    e2.active = false;
  }




  ///////////////



  if (mouseX > (s.x1 - 10)*scale_factor && mouseX < (s.x1 + 10)*scale_factor) {
    s.active1 = false;
  }
  if (mouseX > (s.x2 - 10)*scale_factor && mouseX < (s.x2 + 10)*scale_factor) {
    s.active2 = false;
  }
}

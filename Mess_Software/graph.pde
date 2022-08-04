void graph(float[] array, int zeitskala1, String name, int x_scale, int[] y_scale, boolean left) {
  pushMatrix();
  translate(-50, 40);
  // 2. Wenn y-scale == 0 --> Bereich zwischen minimum und Maximum
  // 1: 0 und 20
  // 2: 0 und 30
  // 3: 0 und 40
  float[] zeitskala = new float[999999];
  if (zeitskala1 == 0) {
    for (int i = 0; i < 999999; i++) {
      zeitskala[i] = zeit[i];
    }
  } else if (zeitskala1 == 1) {
    for (int i = 0; i < 999999; i++) {
      zeitskala[i] = Station1_zeit[i];
    }
  } else if (zeitskala1 == 2) {
    for (int i = 0; i < 999999; i++) {
      zeitskala[i] = Station1_zeit_trocken[i];
    }
  } else if (zeitskala1 == 3) {
    for (int i = 0; i < 999999; i++) {
      zeitskala[i] = Station1_zeit_nass[i];
    }
  }


  // --> Minimum und Maximum des Arrays bestimmen
  float min = 0;
  float max = 0;
  int y = 0;
  if (left) {
    y = y_scale[0];
  } else {
    y = y_scale[1];
  }


  //////////////////ANFANG Zeitskala Beschriftung und Hilfslinien //////////////////////////

  int xValues = 0;
  textAlign(CENTER);
  if (x_scale == 0) {
    if (index > 0) {
      if (zeitskala1 == 0) {
        xValues = index;
      } else if (zeitskala1 == 1) {
        if (indexStation1 > 0) {
          xValues =  indexStation1;
        }
      } else if (zeitskala1 == 2) {
        if (indexStation1_trocken > 0) {
          xValues =  indexStation1_trocken;
        }
      } else if (zeitskala1 == 3) {
        if (indexStation1_nass > 0) {
          xValues =  indexStation1_nass;
        }
      }
    }
  } else if (x_scale == 1) {
    xValues = time(60, zeitskala, zeitskala1);
  } else if (x_scale == 2) {
    xValues = time(180, zeitskala, zeitskala1);
  } else if (x_scale == 3) {
    xValues = time(360, zeitskala, zeitskala1);
  } else if (x_scale == 4) {
    xValues = time(720, zeitskala, zeitskala1);
  } else if (x_scale == 5) {
    xValues = time(3600, zeitskala, zeitskala1);
  } else if (x_scale == 6) {
    xValues = time(10800, zeitskala, zeitskala1);
  } else if (x_scale == 7) {
    xValues = time(21600, zeitskala, zeitskala1);
  } else if (x_scale == 8) {
    xValues = time(43200, zeitskala, zeitskala1);
  } else if (x_scale == 9) {
    xValues = time(86400, zeitskala, zeitskala1);
  } else if (x_scale == 10) {
    xValues = time(259200, zeitskala, zeitskala1);
  } else {
    xValues = index;
  }

  if (xValues == 0) {
    xValues = 1;
  }
  //println(xValues);
  textSize(20);
  fill(0);
  if (zeitskala1 == 0) {
    text("0", 160, 630);
    textSize(10);
    text(time_String[1], 160, 650);
  }
  textSize(20);

  stroke(100);
  if (zeitskala1 == 0) {
    for (int i = 1; i < 6; i++) {
      line(165 + 138.3333*i, 100, 165 + 138.3333*i, 600);
    }
  }

  String ZL1 = "";
  String ZL2 = "";
  String ZL3 = "";
  String ZL4 = "";
  String ZL5 = "";
  if (x_scale == 1 || x_scale == 5) {
    ZL1 = "10";
    ZL2 = "20";
    ZL3 = "30";
    ZL4 = "40";
    ZL5 = "50";
  }
  if (x_scale == 2 || x_scale == 6) {
    ZL1 = "30";
    ZL2 = "60";
    ZL3 = "90";
    ZL4 = "120";
    ZL5 = "150";
  }
  if (x_scale == 3 || x_scale == 7) {
    ZL1 = "60";
    ZL2 = "120";
    ZL3 = "180";
    ZL4 = "240";
    ZL5 = "300";
  }
  if (x_scale == 4) {
    ZL1 = "2";
    ZL2 = "4";
    ZL3 = "6";
    ZL4 = "8";
    ZL5 = "10";
  }
  if (x_scale == 8) {
    ZL1 = "2";
    ZL2 = "4";
    ZL3 = "6";
    ZL4 = "8";
    ZL5 = "10";
  }
  if (x_scale == 9) {
    ZL1 = "4";
    ZL2 = "8";
    ZL3 = "12";
    ZL4 = "16";
    ZL5 = "20";
  }
  if (x_scale == 10) {
    ZL1 = "12";
    ZL2 = "24";
    ZL3 = "36";
    ZL4 = "48";
    ZL5 = "60";
  }


  text(ZL1, 303.3333, 630);
  text(ZL2, 441.6666, 630);
  text(ZL3, 580, 630);
  text(ZL4, 718.33333, 630);
  text(ZL5, 857.666666, 630);

  //////////////////ENDE Zeitskala Beschriftung und Hilfslinien //////////////////////////

  strokeWeight(1);

  //////////////////// Minimum und Maximum definieren ////////////////////////////
  float error = 0;
  if (y == 0) {
    min = minValue(array, xValues, zeitskala1);
    max = maxValue(array, xValues, zeitskala1);
  } else if (y == 1) {
    if (name == "Temperatur in °C") {
      max = 20;
      error = 0.5;
    } else if (name == "CO2 in ppm" || name == "eCO2 in ppm") {
      max = 500;
    } else if (name == "relative Luftfeuchte in %") {
      max = 25;
    } else if (name == "Feinstaub PM1 in μg/m³" || name == "Feinstaub PM2.5 in μg/m³" || name == "Feinstaub PM4 in μg/m³" || name == "Feinstaub PM10 in μg/m³" || name == "Feinstaub in μg/m³") {
      max = 10;
    } else if (name == "TVOC in ppb") {
      max = 100;
    }
  } else if (y == 2) {
    if (name == "Temperatur in °C") {
      max = 30;
    } else if (name == "CO2 in ppm" || name == "eCO2 in ppm") {
      max = 1000;
    } else if (name == "relative Luftfeuchte in %") {
      max = 50;
    } else if (name == "Feinstaub PM1 in μg/m³" || name == "Feinstaub PM2.5 in μg/m³" || name == "Feinstaub PM4 in μg/m³" || name == "Feinstaub PM10 in μg/m³") {
      max = 20;
    } else if (name == "TVOC in ppb") {
      max = 500;
    }
  } else if (y == 3) {
    if (name == "Temperatur in °C") {
      max = 40;
    } else if (name == "CO2 in ppm" || name == "eCO2 in ppm") {
      max = 2000;
    } else if (name == "relative Luftfeuchte in %") {
      max = 75;
    } else if (name == "Feinstaub PM1 in μg/m³" || name == "Feinstaub PM2.5 in μg/m³" || name == "Feinstaub PM4 in μg/m³" || name == "Feinstaub PM10 in μg/m³") {
      max = 50;
    } else if (name == "TVOC in ppb") {
      max = 1000;
    }
  } else if (y == 4) {
    if (name == "Temperatur in °C") {
      max = 50;
    } else if (name == "CO2 in ppm" || name == "eCO2 in ppm") {
      max = 5000;
    } else if (name == "relative Luftfeuchte in %") {
      max = 100;
    } else if (name == "Feinstaub PM1 in μg/m³" || name == "Feinstaub PM2.5 in μg/m³" || name == "Feinstaub PM4 in μg/m³" || name == "Feinstaub PM10 in μg/m³") {
      max = 200;
    } else if (name == "TVOC in ppb") {
      max = 10000;
    }
  } else if (y == 5) {
    if (name == "Temperatur in °C") {
      max = 50;
    } else if (name == "CO2 in ppm" || name == "eCO2 in ppm") {
      max = 5000;
    } else if (name == "relative Luftfeuchte in %") {
      max = 100;
    } else if (name == "Feinstaub PM1 in μg/m³" || name == "Feinstaub PM2.5 in μg/m³" || name == "Feinstaub PM4 in μg/m³" || name == "Feinstaub PM10 in μg/m³") {
      max = 5000;
    } else if (name == "TVOC in ppb") {
      max = 10000;
    }
  }


  //////////////////// Minimum und Maximum definieren ENDE ////////////////////////////

  // Fehler der Sensoren
  ////////////////// Zwischenlinien definieren ////////////////////////////
  textSize(20);
  textAlign(CENTER);
  if (left) {
    fill(255, 0, 0);
  } else {
    fill(0, 0, 255);
  }

  float pos_x = 0;

  if (left) {
    pos_x = 135;
  } else {
    pos_x = 1035;
  }

  if (y == 1) {
    if (name == "Temperatur in °C") {
      text("4", pos_x, 507);
      text("8", pos_x, 407);
      text("12", pos_x, 307);
      text("16", pos_x, 207);
    } else if (name == "CO2 in ppm" || name == "eCO2 in ppm") {
      text("100", pos_x, 507);
      text("200", pos_x, 407);
      text("300", pos_x, 307);
      text("400", pos_x, 207);
    } else if (name == "Feinstaub PM1 in μg/m³" || name == "Feinstaub PM2.5 in μg/m³" || name == "Feinstaub PM4 in μg/m³" || name == "Feinstaub PM10 in μg/m³") {
      text("2", pos_x, 507);
      text("4", pos_x, 407);
      text("6", pos_x, 307);
      text("8", pos_x, 207);
    } else if (name == "relative Luftfeuchte in %") {
      text("5", pos_x, 507);
      text("10", pos_x, 407);
      text("15", pos_x, 307);
      text("20", pos_x, 207);
    } else if (name == "TVOC in ppb") {
      text("20", pos_x, 507);
      text("40", pos_x, 407);
      text("60", pos_x, 307);
      text("80", pos_x, 207);
    }
  } else if (y == 2) {
    if (name == "Temperatur in °C") {
      text("6", pos_x, 507);
      text("12", pos_x, 407);
      text("18", pos_x, 307);
      text("24", pos_x, 207);
    } else if (name == "CO2 in ppm"|| name == "eCO2 in ppm") {
      text("200", pos_x, 507);
      text("400", pos_x, 407);
      text("600", pos_x, 307);
      text("800", pos_x, 207);
    } else if (name == "Feinstaub PM1 in μg/m³" || name == "Feinstaub PM2.5 in μg/m³" || name == "Feinstaub PM4 in μg/m³" || name == "Feinstaub PM10 in μg/m³") {
      text("4", pos_x, 507);
      text("8", pos_x, 407);
      text("12", pos_x, 307);
      text("16", pos_x, 207);
    } else if (name == "relative Luftfeuchte in %") {
      text("10", pos_x, 507);
      text("20", pos_x, 407);
      text("30", pos_x, 307);
      text("40", pos_x, 207);
    } else if (name == "TVOC in ppb") {
      text("100", pos_x, 507);
      text("200", pos_x, 407);
      text("300", pos_x, 307);
      text("400", pos_x, 207);
    }
  } else if (y == 3) {
    if (name == "Temperatur in °C") {
      text("8", pos_x, 507);
      text("16", pos_x, 407);
      text("24", pos_x, 307);
      text("32", pos_x, 207);
    } else if (name == "CO2 in ppm"|| name == "eCO2 in ppm") {
      text("400", pos_x, 507);
      text("800", pos_x, 407);
      text("1200", pos_x, 307);
      text("1600", pos_x, 207);
    } else if (name == "Feinstaub PM1 in μg/m³" || name == "Feinstaub PM2.5 in μg/m³" || name == "Feinstaub PM4 in μg/m³" || name == "Feinstaub PM10 in μg/m³") {
      text("10", pos_x, 507);
      text("20", pos_x, 407);
      text("30", pos_x, 307);
      text("40", pos_x, 207);
    } else if (name == "relative Luftfeuchte in %") {
      text("15", pos_x, 507);
      text("30", pos_x, 407);
      text("45", pos_x, 307);
      text("60", pos_x, 207);
    } else if (name == "TVOC in ppb") {
      text("200", pos_x, 507);
      text("400", pos_x, 407);
      text("600", pos_x, 307);
      text("800", pos_x, 207);
    }
  } else if (y == 4) {
    if (name == "Temperatur in °C") {
      text("10", pos_x, 507);
      text("20", pos_x, 407);
      text("30", pos_x, 307);
      text("40", pos_x, 207);
    } else if (name == "CO2 in ppm"|| name == "eCO2 in ppm") {
      text("1000", pos_x, 507);
      text("2000", pos_x, 407);
      text("3000", pos_x, 307);
      text("4000", pos_x, 207);
    } else if (name == "Feinstaub PM1 in μg/m³" || name == "Feinstaub PM2.5 in μg/m³" || name == "Feinstaub PM4 in μg/m³" || name == "Feinstaub PM10 in μg/m³") {
      text("40", pos_x, 507);
      text("80", pos_x, 407);
      text("120", pos_x, 307);
      text("160", pos_x, 207);
    } else if (name == "relative Luftfeuchte in %") {
      text("20", pos_x, 507);
      text("40", pos_x, 407);
      text("60", pos_x, 307);
      text("80", pos_x, 207);
    } else if (name == "TVOC in ppb") {
      text("2000", pos_x, 507);
      text("4000", pos_x, 407);
      text("6000", pos_x, 307);
      text("8000", pos_x, 207);
    }
  }
  ////////////////// Zwischenlinien definieren ENDE ////////////////////////////




  textAlign(CENTER);
  textSize(20);
  if (left) {
    stroke(255, 0, 0);
    fill(255, 0, 0);
    if (min != 99999999) {
      if (y == 0) {
        text(nf(min, 0, 1), 135, 600);
        text(nf(max, 0, 1), 135, 100);
      } else {
        text(nf(min, 0, 0), 135, 600);
        text(nf(max, 0, 0), 135, 100);
      }
    }
    pushMatrix();
    translate(width/2, height/2);
    rotate(3*PI/2);
    if (name == "CO2 in ppm") {

      text("CO   in ppm", height/2 - 350, -width/2 + 100);
      textSize(16);
      text("2", height/2 - 370, -width/2 + 110);
      textSize(20);
    } else if (name == "eCO2 in ppm") {
      text("eCO   in ppm", height/2 -350, -width/2 + 100);
      textSize(16);
      text("2", height/2 -365, -width/2 + 110);
      textSize(20);
    } else {
      text(name, height/2 -350, -width/2 + 100);
    }
    popMatrix();
  } else {
    textSize(20);
    fill(0, 0, 255);
    stroke(0, 0, 255);
    if (min != 99999999) {
      if (y == 0) {
        text(nf(min, 0, 1), 1035, 600);
        text(nf(max, 0, 1), 1035, 100);
      } else {
        text(nf(min, 0, 0), 1035, 600);
        text(nf(max, 0, 0), 1035, 100);
      }
    }
    pushMatrix();
    translate(width/2, height/2);
    rotate(PI/2);
    if (name == "CO2 in ppm") {
      text("CO   in ppm", -height/2 + 350, width/2 - 1070);
      textSize(16);
      text("2", -height/2 + 330, width/2 - 1060);
      textSize(20);
    } else if (name == "eCO2 in ppm") {
      text("eCO   in ppm", -height/2 + 350, width/2 - 1070);
      textSize(16);
      text("2", -height/2 + 335, width/2 - 1060);
      textSize(20);
    } else {
      textSize(20);
      text(name, -height/2 + 350, width/2 - 1070);
      //text(name, 0, -440);
    }
    popMatrix();
  }

  fill(0);
  if (x_scale == 1 || x_scale == 2 || x_scale == 3) {
    textSize(20);
    text("Zeit in Sekunden", 595, 655);
    if (x_scale == 1) {
      text(60, 1000, 630);
    }
    if (x_scale == 2) {
      text(180, 1000, 630);
    }
    if (x_scale == 3) {
      text(360, 1000, 630);
    }
  } else if (x_scale == 4 || x_scale == 5 || x_scale == 6 || x_scale == 7) {
    text("Zeit in Minuten", 595, 655);
    if (x_scale == 4) {
      text(12, 1000, 630);
    }
    if (x_scale == 5) {
      text(60, 1000, 630);
    }
    if (x_scale == 6) {
      text(180, 1000, 630);
    }
    if (x_scale == 7) {
      text(360, 1000, 640);
    }
  } else if (x_scale > 7) {
    text("Zeit in Stunden", 595, 655);
    if (x_scale == 8) {
      text(12, 1000, 630);
    }
    if (x_scale == 9) {
      text(24, 1000, 630);
    }
    if (x_scale == 10) {
      text(72, 1000, 630);
    }
  }

  ///////////////// MESSWERTE ZEICHNEN //////////////////////////////////////////
  textAlign(CORNER);
  boolean first_error = true;
  if (zeitskala1 == 0) {
    if (xValues > 0 && xValues < 930) {
      for (int i = (index - xValues); i < index - 1; i++) {
        float x_anfang = zeitskala[index - xValues];
        float x_ende = zeitskala[index - 1];
        if (x_scale == 1) {
          if (x_ende < 60) {
            x_ende = 60;
          } else {
            x_anfang = x_ende - 60;
          }
        } else if (x_scale == 2) {
          if (x_ende < 180) {
            x_ende = 180;
          } else {
            x_anfang = x_ende - 180;
          }
        } else if (x_scale == 3) {
          if (x_ende < 360) {
            x_ende = 360;
          } else {
            x_anfang = x_ende - 360;
          }
        } else if (x_scale == 4) {
          if (x_ende < 720) {
            x_ende = 720;
          } else {
            x_anfang = x_ende - 720;
          }
        } else if (x_scale == 5) {
          if (x_ende < 3600) {
            x_ende = 3600;
          } else {
            x_anfang = x_ende - 3600;
          }
        } else if (x_scale == 6) {
          if (x_ende < 10800) {
            x_ende = 10800;
          } else {
            x_anfang = x_ende - 10800;
          }
        } else if (x_scale == 7) {
          if (x_ende < 21600) {
            x_ende = 21600;
          } else {
            x_anfang = x_ende - 21600;
          }
        } else if (x_scale == 8) {
          if (x_ende < 43200) {
            x_ende = 43200;
          } else {
            x_anfang = x_ende - 43200;
          }
        } else if (x_scale == 9) {
          if (x_ende < 86400) {
            x_ende = 86400;
          } else {
            x_anfang = x_ende - 86400;
          }
        } else if (x_scale == 10) {
          if (x_ende < 259200) {
            x_ende = 259200;
          } else {
            x_anfang = x_ende - 259200;
          }
        }
        // Fehler anpassen

        if (name == "Temperatur in °C") {
          error = 0.5;
        } else if (name == "CO2 in ppm" || name == "eCO2 in ppm") {
          if (name == "CO2 in ppm") {
            error = 30 + 0.03*array[i];
          } else {
            error = 0.1*array[i];
          }
        } else if (name == "relative Luftfeuchte in %") {
          error = 2;
        } else if (name == "Feinstaub PM1 in μg/m³" || name == "Feinstaub PM2.5 in μg/m³" || name == "Feinstaub PM4 in μg/m³" || name == "Feinstaub PM10 in μg/m³" || name == "Feinstaub in μg/m³") {
          if (array[i] < 100) {
            error = 10;
          } else {
            error = 0.1*array[i];
          }
        } else if (name == "TVOC in ppb") {
          error = 0.15*array[i];
        }




        float x_intervall = x_ende - x_anfang;
        float x1 = 170 + (zeitskala[i] - x_anfang)*830/x_intervall;
        float x2 = 170 + (zeitskala[i+1] - x_anfang)*830/x_intervall;
        float y1 = 600 - 500*(array[i]-min)/(max - min);
        float y2 = 600 - 500*(array[i+1] - min)/(max - min);
        float e1 = 600 - 500*(array[i] - error - min)/(max-min);
        float e2 = 600 - 500*(array[i] + error - min)/(max-min);

        float m = ((y2 - y1)/(x2 - x1));
        if (x1 <= 170) {
          y1 = m*170 + y1 - m*x1;
          x1 = 170;
        }
        if (y2 < 100) {
          x2 = (100 + m*x2-y2)/m;
          y2 = 100;
        }
        if (y1 < 100) {
          x1 = (100 + m*x1-y1)/m;
          y1 = 100;
        }
        if (x2 > 1000) {
          x2 = 1000;
          y2 = m*1000 + y1 - m*x1;
        }
        if (y1 >= 100 && y2 >= 100 && x2 >= 170 && x1 <= 1035 && x2 <= 1035) {
          if (error_bars.name == "anzeigen") {
            strokeWeight(0.5);

            if (e1 < 100) {
              e1 = 100;
            }
            if (e2 < 100) {
              e2 = 100;
            }
            if (e2 > 600) {
              e2 = 600;
            }
            if (e1 > 600) {
              e1 = 600;
            }

            line(x1, e1, x1, e2);
            line(x1-2, e1, x1+2, e1);
            line(x1-2, e2, x1+2, e2);
            if (first_error) {
              first_error = false;
              line(x1, e1, x1, e2);
              line(x1-2, e1, x1+2, e1);
              line(x1-2, e2, x1+2, e2);

              float a1 = 170 + (zeitskala[index-1] - x_anfang)*830/x_intervall;
              float e11 = 600 - 500*(array[index-1] - error - min)/(max-min);
              float e22 = 600 - 500*(array[index-1] + error - min)/(max-min);
              if (e11 < 100) {
                e11 = 100;
              }
              if (e22 < 100) {
                e22 = 100;
              }
              if (e22 > 600) {
                e22 = 600;
              }
              if (e11 > 600) {
                e11 = 600;
              }
              line(a1, e11, a1, e22);
              line(a1-2, e11, a1+2, e11);
              line(a1-2, e22, a1+2, e22);
            }
          }
        }


        if (y1 >= 100 && y2 >= 100 && x2 >= 170 && x1 <= 1035 && x2 <= 1035) {
          if (strichdicke.name == "1 (dünn)") {
            strokeWeight(1);
          } else if (strichdicke.name == "2 (Standard)") {
            strokeWeight(2.5);
          } else {
            strokeWeight(5);
          }

          if (connect.name == "verbinden") {
            line(x1, y1, x2, y2);
          } else {
            line(x2-2, y2, x2+2, y2);
            line(x2, y2-2, x2, y2+2);
          }
        }
      }
    } else if (xValues >= 930) {
      float[] newArray = kuerzen(array, xValues, 930);
      float[] newArray_time = kuerzen(zeitskala, xValues, 930);
      if (y == 0) {
        min = 99999999;
        max = 0;
        for (int i = 0; i < 930; i++) {
          if (newArray[i] < min) {
            min = newArray[i];
          }
          if (newArray[i] > max) {
            max = newArray[i];
          }
        }
      }
      for (int i = 0; i < 929; i++) {
        float x_anfang = newArray_time[0];
        float x_ende = newArray_time[929];
        if (x_scale == 1) {
          if (x_ende < 60) {
            x_ende = 60;
          } else {
            x_anfang = x_ende - 60;
          }
        } else if (x_scale == 2) {
          if (x_ende < 180) {
            x_ende = 180;
          } else {
            x_anfang = x_ende - 180;
          }
        } else if (x_scale == 3) {
          if (x_ende < 360) {
            x_ende = 360;
          } else {
            x_anfang = x_ende - 360;
          }
        } else if (x_scale == 4) {
          if (x_ende < 720) {
            x_ende = 720;
          } else {
            x_anfang = x_ende - 720;
          }
        } else if (x_scale == 5) {
          if (x_ende < 3600) {
            x_ende = 3600;
          } else {
            x_anfang = x_ende - 3600;
          }
        } else if (x_scale == 6) {
          if (x_ende < 10800) {
            x_ende = 10800;
          } else {
            x_anfang = x_ende - 10800;
          }
        } else if (x_scale == 7) {
          if (x_ende < 21600) {
            x_ende = 21600;
          } else {
            x_anfang = x_ende - 21600;
          }
        } else if (x_scale == 8) {
          if (x_ende < 43200) {
            x_ende = 43200;
          } else {
            x_anfang = x_ende - 43200;
          }
        } else if (x_scale == 9) {
          if (x_ende < 86400) {
            x_ende = 86400;
          } else {
            x_anfang = x_ende - 86400;
          }
        } else if (x_scale == 10) {
          if (x_ende < 259200) {
            x_ende = 259200;
          } else {
            x_anfang = x_ende - 259200;
          }
        }
        if (name == "Temperatur in °C") {
          error = 0.5;
        } else if (name == "CO2 in ppm" || name == "eCO2 in ppm") {
          if (name == "CO2 in ppm") {
            error = 30 + 0.03*newArray[i];
          } else {
            error = 0.1*newArray[i];
          }
        } else if (name == "relative Luftfeuchte in %") {
          error = 2;
        } else if (name == "Feinstaub PM1 in μg/m³" || name == "Feinstaub PM2.5 in μg/m³" || name == "Feinstaub PM4 in μg/m³" || name == "Feinstaub PM10 in μg/m³" || name == "Feinstaub in μg/m³") {
          if (newArray[i] < 100) {
            error = 10;
          } else {
            error = 0.1*newArray[i];
          }
        } else if (name == "TVOC in ppb") {
          error = 0.15*newArray[i];
        }

        float x_intervall = x_ende - x_anfang;
        float x1 = 170 + (newArray_time[i] - x_anfang)*830/x_intervall;
        float x2 = 170 + (newArray_time[i+1] - x_anfang)*830/x_intervall;
        float y1 = 600 - 500*(newArray[i]-min)/(max - min);
        float y2 = 600 - 500*(newArray[i+1] - min)/(max - min);
        float e1 = 600 - 500*(newArray[i]-error-min)/(max-min);
        float e2 = 600- 500*(newArray[i]+error - min)/(max-min);
        float m = ((y2 - y1)/(x2 - x1));
        if (x1 <= 170) {
          y1 = m*170 + y1 - m*x1;
          x1 = 170;
        }
        if (y2 < 100) {
          x2 = (100 + m*x2-y2)/m;
          y2 = 100;
        }
        if (y1 < 100) {
          x1 = (100 + m*x1-y1)/m;
          y1 = 100;
        }
        if (y1 >= 100 && y2 >= 100 && x2 >= 170 && x1 <= 1035 && x2 <= 1035) {
          if (error_bars.name == "anzeigen") {
            strokeWeight(0.5);

            if (e1 < 100) {
              e1 = 100;
            }
            if (e2 < 100) {
              e2 = 100;
            }
            if (e2 > 600) {
              e2 = 600;
            }
            if (e1 > 600) {
              e1 = 600;
            }

            line(x1, e1, x1, e2);
            line(x1-2, e1, x1+2, e1);
            line(x1-2, e2, x1+2, e2);
            if (first_error) {
              first_error = false;
              line(x1, e1, x1, e2);
              line(x1-2, e1, x1+2, e1);
              line(x1-2, e2, x1+2, e2);

              float a1 = 170 + (newArray_time[i] - x_anfang)*830/x_intervall;
              float e11 = 600 - 500*(newArray[i] - error - min)/(max-min);
              float e22 = 600 - 500*(newArray[i] + error - min)/(max-min);
              if (e11 < 100) {
                e11 = 100;
              }
              if (e22 < 100) {
                e22 = 100;
              }
              if (e22 > 600) {
                e22 = 600;
              }
              if (e11 > 600) {
                e11 = 600;
              }
              line(a1, e11, a1, e22);
              line(a1-2, e11, a1+2, e11);
              line(a1-2, e22, a1+2, e22);
            }
          }
        }


        if (y1 >= 100 && y2 >= 100 && x2 >= 170 && x1 <= 1035 && x2 <= 1035) {
          if (strichdicke.name == "1 (dünn)") {
            strokeWeight(1);
          } else if (strichdicke.name == "2 (Standard)") {
            strokeWeight(2.5);
          } else {
            strokeWeight(5);
          }
          if (connect.name == "verbinden") {
            line(x1, y1, x2, y2);
          } else {
            line(x2-2, y2, x2+2, y2);
            line(x2, y2-2, x2, y2+2);
          }
        }
      }
    }
  } else if (zeitskala1 == 1) {
    for (int i = (indexStation1 - xValues); i < indexStation1 - 1; i++) {

      if (array[i] < 100) {
        error = 10;
      } else {
        error = 0.1*array[i];
      }


      float x_anfang = zeitskala[indexStation1 - xValues];
      float x_ende = zeitskala[indexStation1 - 1];
      x_ende = gesamtzeit_station1;
      float x_intervall = x_ende - x_anfang;
      float x1 = 170 + (zeitskala[i] - x_anfang)*830/x_intervall;
      float x2 = 170 + (zeitskala[i+1] - x_anfang)*830/x_intervall;
      float y1 = 600 - 500*(array[i]-min)/(max - min);
      float y2 = 600 - 500*(array[i+1] - min)/(max - min);
      float e1 = 600 - 500*(array[i]-error-min)/(max-min);
      float e2 = 600- 500*(array[i]+error - min)/(max-min);
      float m = ((y2 - y1)/(x2 - x1));
      if (x1 <= 170) {
        y1 = m*170 + y1 - m*x1;
        x1 = 170;
      }
      if (x2 >= 1105) {
        y2 = m*1105 + y1 - m*x1;
        x2 = 1105;
      }
      if (y2 < 100) {
        x2 = (100 + m*x2-y2)/m;
        y2 = 100;
      }
      if (y1 < 100) {
        x1 = (100 + m*x1-y1)/m;
        y1 = 100;
      }
      if (x2 > 1000) {
        x2 = 1000;
        y2 = m*1000 + y1 - m*x1;
      }
      if (y1 >= 100 && y2 >= 100 && x2 >= 170 && x1 <= 1035 && x2 <= 1035) {
        if (error_bars.name == "anzeigen") {
          strokeWeight(2);
          if (e1 < 100) {
            e1 = 100;
          }
          if (e2 < 100) {
            e2 = 100;
          }
          if (e2 > 600) {
            e2 = 600;
          }
          if (e1 > 600) {
            e1 = 600;
          }
          line(x1, e1, x1, e2);
          line(x1-2, e1, x1+2, e1);
          line(x1-2, e2, x1+2, e2);
          if (first_error) {
            first_error = false;
            line(x1, e1, x1, e2);
            line(x1-2, e1, x1+2, e1);
            line(x1-2, e2, x1+2, e2);

            float a1 = 170 + (zeitskala[indexStation1 - 1] - x_anfang)*830/x_intervall;
            float e11 = 600 - 500*(array[indexStation1 - 1] - error - min)/(max-min);
            float e22 = 600 - 500*(array[indexStation1 - 1] + error - min)/(max-min);
            line(a1, e1, a1, e2);
            line(a1-2, e11, a1+2, e11);
            line(a1-2, e22, a1+2, e22);
          }
        }
      }
      if (y1 >= 100 && y2 >= 100 && x2 >= 170 && x1 <= 1035 && x2 <= 1035) {
        if (connect.name == "verbinden") {
          line(x1, y1, x2, y2);
        } else {
          line(x2-5, y2, x2+5, y2);
          line(x2, y2-5, x2, y2+5);
        }
      }
    }
  } else if (zeitskala1 == 2) {
    for (int i = (indexStation1_trocken - xValues); i < indexStation1_trocken - 1; i++) {
      if (array[i] < 100) {
        error = 10;
      } else {
        error = 0.1*array[i];
      }
      float x_anfang = zeitskala[indexStation1_trocken - xValues];
      float x_ende = zeitskala[indexStation1_trocken - 1];
      x_ende = gesamtzeit_station1;
      float x_intervall = x_ende - x_anfang;
      float x1 = 170 + (zeitskala[i] - x_anfang)*830/x_intervall;
      float x2 = 170 + (zeitskala[i+1] - x_anfang)*830/x_intervall;
      float y1 = 600 - 500*(array[i]-min)/(max - min);
      float y2 = 600 - 500*(array[i+1] - min)/(max - min);
      float e1 = 600 - 500*(array[i]-error-min)/(max-min);
      float e2 = 600- 500*(array[i]+error - min)/(max-min);
      float m = ((y2 - y1)/(x2 - x1));
      if (x1 <= 170) {
        y1 = m*170 + y1 - m*x1;
        x1 = 170;
      }
      if (x2 >= 1105) {
        y2 = m*1105 + y1 - m*x1;
        x2 = 1105;
      }
      if (y2 < 100) {
        x2 = (100 + m*x2-y2)/m;
        y2 = 100;
      }
      if (y1 < 100) {
        x1 = (100 + m*x1-y1)/m;
        y1 = 100;
      }
      if (x2 > 1000) {
        x2 = 1000;
        y2 = m*1000 + y1 - m*x1;
      }
      if (y1 >= 100 && y2 >= 100 && x2 >= 170 && x1 <= 1035 && x2 <= 1035) {
        if (error_bars.name == "anzeigen") {
          strokeWeight(2);
          if (e1 < 100) {
            e1 = 100;
          }
          if (e2 < 100) {
            e2 = 100;
          }
          if (e2 > 600) {
            e2 = 600;
          }
          if (e1 > 600) {
            e1 = 600;
          }
          line(x1, e1, x1, e2);
          line(x1-2, e1, x1+2, e1);
          line(x1-2, e2, x1+2, e2);
          if (first_error) {
            first_error = false;
            line(x1, e1, x1, e2);
            line(x1-2, e1, x1+2, e1);
            line(x1-2, e2, x1+2, e2);

            float a1 = 170 + (zeitskala[indexStation1_trocken - 1] - x_anfang)*830/x_intervall;
            float e11 = 600 - 500*(array[indexStation1_trocken - 1] - error - min)/(max-min);
            float e22 = 600 - 500*(array[indexStation1_trocken - 1] + error - min)/(max-min);

            line(a1, e11, a1, e22);
            line(a1-2, e11, a1+2, e11);
            line(a1-2, e22, a1+2, e22);
          }
        }
      }

      strokeWeight(1);

      if (y1 >= 100 && y2 >= 100 && x2 >= 170 && x1 <= 1035 && x2 <= 1035) {
        if (connect.name == "verbinden") {
          line(x1, y1, x2, y2);
        } else {
          line(x2-5, y2, x2+5, y2);
          line(x2, y2-5, x2, y2+5);
        }
      }
    }
  } else if (zeitskala1 == 3) {
    for (int i = (indexStation1_nass - xValues); i < indexStation1_nass - 1; i++) {
      if (array[i] < 100) {
        error = 10;
      } else {
        error = 0.1*array[i];
      }
      float x_anfang = zeitskala[indexStation1_nass - xValues];
      float x_ende = zeitskala[indexStation1_nass - 1];
      x_ende = gesamtzeit_station1;
      float x_intervall = x_ende - x_anfang;
      float x1 = 170 + (zeitskala[i] - x_anfang)*830/x_intervall;
      float x2 = 170 + (zeitskala[i+1] - x_anfang)*830/x_intervall;
      float y1 = 600 - 500*(array[i]-min)/(max - min);
      float y2 = 600 - 500*(array[i+1] - min)/(max - min);
      float e1 = 600 - 500*(array[i]-error-min)/(max-min);
      float e2 = 600- 500*(array[i]+error - min)/(max-min);
      float m = ((y2 - y1)/(x2 - x1));
      if (x1 <= 170) {
        y1 = m*170 + y1 - m*x1;
        x1 = 170;
      }
      if (x2 >= 1105) {
        y2 = m*1105 + y1 - m*x1;
        x2 = 1105;
      }
      if (y2 < 100) {
        x2 = (100 + m*x2-y2)/m;
        y2 = 100;
      }
      if (y1 < 100) {
        x1 = (100 + m*x1-y1)/m;
        y1 = 100;
      }
      if (x2 > 1000) {
        x2 = 1000;
        y2 = m*1000 + y1 - m*x1;
      }

      if (y1 >= 100 && y2 >= 100 && x2 >= 170 && x1 <= 1035 && x2 <= 1035) {
        if (error_bars.name == "anzeigen") {
          strokeWeight(2);
          if (e1 < 100) {
            e1 = 100;
          }
          if (e2 < 100) {
            e2 = 100;
          }
          if (e2 > 600) {
            e2 = 600;
          }
          if (e1 > 600) {
            e1 = 600;
          }
          line(x1, e1, x1, e2);
          line(x1-2, e1, x1+2, e1);
          line(x1-2, e2, x1+2, e2);
          if (first_error) {
            first_error = false;
            line(x1, e1, x1, e2);
            line(x1-2, e1, x1+2, e1);
            line(x1-2, e2, x1+2, e2);

            float a1 = 170 + (zeitskala[indexStation1_nass - 1] - x_anfang)*830/x_intervall;
            float e11 = 600 - 500*(array[indexStation1_nass - 1] - error - min)/(max-min);
            float e22 = 600 - 500*(array[indexStation1_nass - 1] + error - min)/(max-min);

            line(a1, e11, a1, e22);
            line(a1-2, e11, a1+2, e11);
            line(a1-2, e22, a1+2, e22);
          }
        }
      }


      strokeWeight(1);
      if (y1 >= 100 && y2 >= 100 && x2 >= 170 && x1 <= 1035 && x2 <= 1035) {
        if (connect.name == "verbinden") {
          line(x1, y1, x2, y2);
        } else {
          line(x2-5, y2, x2+5, y2);
          line(x2, y2-5, x2, y2+5);
        }
      }
    }
  }

  fill(0);
  textAlign(CENTER);
  if (index > 0) {
    if (zeitskala1 == 0) { 
      if (x_scale == 0) {
        if (xValues < 930) {
          if (zeitskala[index - 1] < 360) {
            textSize(20);
            text("Zeit in Sekunden", 595, 655);
            text(ceil(zeitskala[index - 1]), 1000, 630);
          } else if (zeitskala[index - 1] < 21600) {
            textSize(20);
            text("Zeit in Minuten", 595, 655);
            text(ceil(zeitskala[index - 1]/60), 1000, 630);
          } else {
            textSize(20);
            text("Zeit in Stunden", 595, 655);
            text(ceil(zeitskala[index - 1])/3600, 1000, 630);
          }
        } else {
          float[] newArray_time = kuerzen(zeitskala, xValues, 930);
          if (newArray_time[929] < 360) {
            textSize(20);
            text("Zeit in Sekunden", 595, 655);
            text(ceil(newArray_time[929]), 1040, 630);
          } else if (newArray_time[929] < 21600) {
            textSize(20);
            text("Zeit in Minuten", 595, 655);
            text(ceil(newArray_time[929]/60), 1000, 630);
          } else {
            textSize(20);
            text("Zeit in Stunden", 595, 655);
            text(ceil(newArray_time[929]/3600), 1000, 630);
          }
        }
      }
    }
  }
  //println(zeitskala1);
  textAlign(CORNER);



  ///////////////////////////////////////////////////////////////////////////////////

  // Aktueller Messwert
  String Einheit = "";

  if (name == "Temperatur in °C") {
    Einheit = "°C";
  } else if (name == "CO2 in ppm") {
    Einheit = "ppm";
  } else if (name == "Feinstaub PM1 in μg/m³" || name == "Feinstaub PM2.5 in μg/m³" || name == "Feinstaub PM4 in μg/m³" || name == "Feinstaub PM10 in μg/m³") {
    Einheit = "μg/m³";
  } else if (name == "relative Luftfeuchte in %") {
    Einheit = "%";
  } else if (name == "TVOC in ppb") {
    Einheit = "ppb";
  } else if (name == "eCO2 in ppm") {
    Einheit = "ppm";
  }
  textSize(18);
  int indexStation11 = 1;
  if (zeitskala1 == 1) {
    indexStation11 = indexStation1;
  } else if (zeitskala1 == 2) {
    indexStation11 = indexStation1_trocken;
  } else if (zeitskala1 == 3) {
    indexStation11 = indexStation1_nass;
  }

  if (left) {
    noStroke();
    fill(255, 0, 0);
    textAlign(LEFT);    
    if (page == 1.11 || page == 1.1111) {
      if (error != 0.5 && indexStation11 >= 1) {
        text("Aktueller Wert: (" + str(round(array[indexStation11-1])).replace(".", ",") + " +/- " + round(error) + ") " + Einheit, 170, 25);
      } else {
        if (indexStation11 > 1) {
          text("Aktueller Wert: (" + str(round(array[indexStation11-1])).replace(".", ",") + " +/- 0,5) " + Einheit, 170, 25);
        }
      }
    } else {
      if (error != 0.5 && index > 1) {
        text("Aktueller Wert: (" + str(round(array[index-1])).replace(".", ",") + " +/- " + round(error) + ") " + Einheit, 170, 25);
      } else {
        if (index > 1) {
          text("Aktueller Wert: (" + str(round(array[index-1])).replace(".", ",") + " +/- 0,5) " + Einheit, 170, 25);
        }
      }
    }
  } else {
    fill(0, 0, 255);
    textAlign(RIGHT);
    if (page == 1.11 || page == 1.1111) {
      if (error != 0.5 && indexStation11 >= 1) {
        text("Aktueller Wert: (" + str(round(array[indexStation11-1])).replace(".", ",") + " +/- " + round(error) + ") " + Einheit, 995, 25);
      } else {
        if (indexStation11 > 1) {
          text("Aktueller Wert: (" + str(round(array[indexStation11-1])).replace(".", ",") + " +/- 0,5) " + Einheit, 995, 25);
        }
      }
    } else
      if (error != 0.5 && index > 1) {
        text("Aktueller Wert: (" + str(round(array[index-1])).replace(".", ",") + " +/- " + round(error) + ") " + Einheit, 995, 25);
      } else {
        if (index > 1) {
          text("Aktueller Wert: (" + str(round(array[index-1])).replace(".", ",") + " +/- 0,5) " + Einheit, 995, 25);
        }
      }
  }
  textSize(20);
  textAlign(LEFT);
  popMatrix();
  strokeWeight(1);
}




float[] kuerzen(float[] arr1, int sizeArr1, int sizeArr2) {
  //1. neues Array initialisieren
  float[] newArray = new float[sizeArr2];
  //2. wie oft passt array 2 in array 1?
  float temp = sizeArr1/float(sizeArr2);
  //3. Mittelwert der einzelnen Sektoren bilden
  for (int j = 0; j < sizeArr2; j++) {
    float mittelwert = 0;
    for (int i = 0; i < temp; i++) {
      mittelwert += arr1[index - sizeArr1 + floor(j*temp) + i];
    }
    newArray[j] = mittelwert/ceil(temp);
  }
  return newArray;
}


void arrLog(float[] m) {
  int reihen = m.length;
  println();
  for (int i = 0; i < reihen; i++) {
    println(m[i] + " ");
  }
}






float minValue(float[] array, int xVals, int zeitskala) {
  float min = 99999999;
  int temp = 1;
  if (index > 0) {
    if (zeitskala == 0) {
      temp = index;
    } else if (zeitskala == 1) {
      temp = indexStation1;
    } else if (zeitskala == 2) {
      temp = indexStation1_trocken;
    } else if (zeitskala == 3) {
      temp = indexStation1_nass;
    }
  }
  for (int i = (temp - xVals); i < temp; i++) {
    if (i >= 0) {
      if (array[i] < min) {
        min = array[i];
      }
    }
  }
  return min;
}

float maxValue(float[] array, int xVals, int zeitskala) {
  float max = -99999999;
  int temp = 1;
  if (index > 0) {
    if (zeitskala == 0) {
      temp = index;
    } else if (zeitskala == 1) {
      temp = indexStation1;
    } else if (zeitskala == 2) {
      temp = indexStation1_trocken;
    } else if (zeitskala == 3) {
      temp = indexStation1_nass;
    }
  }
  for (int i = (temp - xVals); i< temp; i++) {
    if (i >= 0) {
      if (array[i] > max) {
        max = array[i];
      }
    }
  }
  return max;
}



int time(int sekunden, float[] time2, int zeitskala) {
  int t = 0;
  int temp = 1;
  if (index > 0) {
    if (zeitskala == 0) {
      temp = index;
    } else if (zeitskala == 1) {
      temp = indexStation1;
    } else if (zeitskala == 2) {
      temp = indexStation1_trocken;
    } else if (zeitskala == 3) {
      temp = indexStation1_nass;
    }
  }

  float t2 = time2[temp] - float(sekunden);

  for (int i = index; i > 0; i--) {
    if (time2[i] < t2 && t2 > 0) {
      t = temp - i;
      break;
    } else {
      t = temp;
    }
  }
  return (t);
}



int findClosest(float val, float[] array) {
  float dist = abs(array[0] - val);
  int index = 0;
  for (int i = 0; i < 20; i++) {
    if (abs(array[i] - val) < dist) {
      dist =  abs(array[i] - val);
      index = i;
    }
  }
  return index;
}


void graph2(float[] array, int zeitskala1, String name, int cc, int[] y_scale, boolean left, color  c) {
  float[] zeitskala = new float[999999];
  for (int i = 0; i < 999999; i++) {
    zeitskala[i] = Station1_zeit[i];
  }
  pushMatrix();
  // translate(-50, 40);


  // --> Minimum und Maximum des Arrays bestimmen
  float min = 0;
  float max = 0;
  int y = y_scale[0]; 

  //////////////////ANFANG Zeitskala Beschriftung und Hilfslinien //////////////////////////

  int xValues = 0;
  textAlign(CENTER);


  if (zeitskala1 == 1) {
    if (indexStation1 > 0) {
      xValues =  indexStation1;
    }
  } else if (zeitskala1 == 2) {
    if (indexStation1_trocken > 0) {
      xValues =  indexStation1_trocken;
    }
  }

  if (xValues == 0) {
    xValues = 1;
  }
  //println(xValues);
  textSize(20);
  fill(0);
  if (zeitskala1 == 0) {
    text("0", 150, 640);
  }
  //////////////////ENDE Zeitskala Beschriftung und Hilfslinien //////////////////////////

  strokeWeight(1);
  //////////////////// Minimum und Maximum definieren ////////////////////////////
  if (y == 1) {
    max = 10;
  } else if (y == 2) {
    max = 20;
  } else if (y == 3) {
    max = 50;
  } else if (y == 4) {
    max = 200;
  } else if (y == 5) {
    max = 500;
  } else if (y == 6) {
    max = 1000;
  } else if (y == 7) {
    max = 5000;
  }

  //rect(340, 30, 600, 300);
  //rect(340, 380, 600, 300);
  ////////////////// Zwischenlinien definieren ////////////////////////////
  fill(255, 0, 0);
  float pos_x = 300;
  float pos_y = 30;
  if (zeitskala1 == 1) {
    pos_y = 30;
  } else if (zeitskala1 == 2) {
    pos_y = 380;
  }
  fill(0);
  if (y == 1) {
    text("2", pos_x, pos_y + 240);
    text("4", pos_x, pos_y + 180);
    text("6", pos_x, pos_y + 120);
    text("8", pos_x, pos_y + 60);
  } else if (y == 2) {
    text("4", pos_x, pos_y + 240);
    text("8", pos_x, pos_y + 180);
    text("12", pos_x, pos_y + 120);
    text("16", pos_x, pos_y + 60);
  } else if (y == 3) {
    text("10", pos_x, pos_y + 240);
    text("20", pos_x, pos_y + 180);
    text("30", pos_x, pos_y + 120);
    text("40", pos_x, pos_y + 60);
  } else if (y == 4) {
    text("40", pos_x, pos_y + 240);
    text("80", pos_x, pos_y + 180);
    text("120", pos_x, pos_y + 120);
    text("160", pos_x, pos_y + 60);
  } else if (y == 5) {
    text("100", pos_x, pos_y + 240);
    text("200", pos_x, pos_y + 180);
    text("300", pos_x, pos_y + 120);
    text("400", pos_x, pos_y + 60);
  } else if (y == 6) {
    text("200", pos_x, pos_y + 240);
    text("400", pos_x, pos_y + 180);
    text("600", pos_x, pos_y + 120);
    text("800", pos_x, pos_y + 60);
  } else if (y == 7) {
    text("1000", pos_x, pos_y + 240);
    text("2000", pos_x, pos_y + 180);
    text("3000", pos_x, pos_y + 120);
    text("4000", pos_x, pos_y + 60);
  }
  ////////////////// Zwischenlinien definieren ENDE ////////////////////////////

  textAlign(CENTER);
  textSize(20);

  if (zeitskala1 == 1) {
    text(nf(min, 0, 0), 300, 330);
    text(nf(max, 0, 0), 300, 30);
  } else {
    text(nf(min, 0, 0), 300, 680);
    text(nf(max, 0, 0), 300, 380);
  }
  textAlign(CORNER);
  if (mouseX > 340*scale_factor && mouseX < 940*scale_factor) {
    if (zeitskala1 == 1) {
      if (mouseY > 30*scale_factor && mouseY < 330*scale_factor) {
        noFill();
        ellipse(mouseX, mouseY, 10, 10);
        fill(0);

        text(nf(max-max*(mouseY-30)/300, 0, 1) + " µg/m³", mouseX + 10, mouseY);
      }
    } else {
      if (mouseY > 380*scale_factor && mouseY < 680*scale_factor) {
        noFill();
        ellipse(mouseX, mouseY, 10, 10);
        fill(0);
        text(nf(max-max*(mouseY-380)/300, 0, 1)+ " µg/m³", mouseX + 10, mouseY);
      }
    }
  }
  textAlign(CENTER);



  pushMatrix();
  translate(width/2, height/2);
  rotate(3*PI/2);

  // text(name, height/2 -400, -width/2 + 80);
  if (zeitskala1 == 1) {
    text(name, height/2 -510, -width/2 + 250);
  } else {
    text(name, height/2 -180, -width/2 + 250);
  }
  popMatrix();

  ///////////////// MESSWERTE ZEICHNEN //////////////////////////////////////////
  textAlign(CORNER);
  fill(255);
  stroke(0);


  if (zeitskala1 == 1) {
    for (int i = (indexStation1 - xValues); i < indexStation1 - 1; i++) {
      if (indexStation1 < xValues) {
        return;
      }
      //rect(225, 60, 930, 500);
      float x_anfang = 0;
      float x_ende = 150;
      //x_ende = gesamtzeit_station1;
      float x_intervall = x_ende - x_anfang;
      float x1 = 340 + (zeitskala[i] - x_anfang)*600/x_intervall;
      float x2 = 340 + (zeitskala[i+1] - x_anfang)*600/x_intervall;
      float y1 = 330 - 300*(array[i]-min)/(max - min);
      float y2 = 330 - 300*(array[i+1] - min)/(max - min);
      float m = ((y2 - y1)/(x2 - x1));
      if (x1 < 340) {
        y1 = m*340 + y1 - m*x1;
        x1 = 340;
      }
      if (y2 < 30) {
        x2 = (30 + m*x2-y2)/m;
        y2 = 30;
      }
      if (y1 < 30) {
        x1 = (30 + m*x1-y1)/m;
        y1 = 30;
      }
      if (x2 > 940) {
        x2 = 940;
        y2 = m*940 + y1 - m*x1;
      }
      if (strichdicke.name == "1 (dünn)") {
        strokeWeight(1);
      } else if (strichdicke.name == "2 (Standard)") {
        strokeWeight(2.5);
      } else {
        strokeWeight(5);
      }
      stroke(c);
      fill(c);
      if (y1 >= 30 && y2 >= 30 && x2 >= 340 && x1 <= 950 && x2 <= 970) {
        if (verbinde.checked) {
          line(x1, y1, x2, y2);
        } else {
          line(x2-5, y2, x2+5, y2);
          line(x2, y2-5, x2, y2+5);
        }
      }
    }
  } else if (zeitskala1 == 2) {
    for (int i = (indexStation1_trocken - xValues); i < indexStation1_trocken - 1; i++) {
      float x_anfang = 0;
      float x_ende = 150;
      //x_ende = gesamtzeit_station1;
      float x_intervall = x_ende - x_anfang;
      float x1 = 340 + (zeitskala[i] - x_anfang)*600/x_intervall;
      float x2 = 340 + (zeitskala[i+1] - x_anfang)*600/x_intervall;
      float y1 = 680 - 300*(array[i]-min)/(max - min);
      float y2 = 680 - 300*(array[i+1] - min)/(max - min);
      float m = ((y2 - y1)/(x2 - x1));
      if (x1 < 340) {
        y1 = m*340 + y1 - m*x1;
        x1 = 340;
      }
      if (y2 < 380) {
        x2 = (380 + m*x2-y2)/m;
        y2 = 380;
      }
      if (y1 < 380) {
        x1 = (380 + m*x1-y1)/m;
        y1 = 380;
      }
      if (x2 > 940) {
        x2 = 940;
        y2 = m*940 + y1 - m*x1;
      }
      if (strichdicke.name == "1 (dünn)") {
        strokeWeight(1);
      } else if (strichdicke.name == "2 (Standard)") {
        strokeWeight(2.5);
      } else {
        strokeWeight(5);
      }
      stroke(c);
      fill(c);
      if (y1 >= 380 && y2 >= 380 && x2 >=  340 && x1 <= 940 && x2 <= 950) {
        if (verbinde.checked) {
          line(x1, y1, x2, y2);
        } else {
          line(x2-5, y2, x2+5, y2);
          line(x2, y2-5, x2, y2+5);
        }
      }
    }
  } 
  fill(0);
  popMatrix();
  strokeWeight(1);
  textAlign(CORNER);
}

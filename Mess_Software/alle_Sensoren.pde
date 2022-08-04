void alleSensoren() {
  boolean PM1_left = false;
  boolean PM1_right = false;
  boolean PM2_5_left = false;
  boolean PM2_5_right = false;
  boolean PM4_left = false;
  boolean PM4_right = false;
  boolean PM10_left = false;
  boolean PM10_right = false;
  boolean eco2_left = false;
  boolean eco2_right = false;
  boolean tvoc_left = false;
  boolean tvoc_right = false;
  boolean T_left = false;
  boolean T_right = false;
  boolean H_left = false;
  boolean H_right = false;
  boolean CO2_left = false;
  boolean CO2_right = false;



  if (Alle_Sensoren_Blau.name == "TVOC") {
    tvoc_right = true;
    up2.show();
    down2.show();
  } else if (Alle_Sensoren_Blau.name == "eCO2" || Alle_Sensoren_Blau.name == "eCO") {
    eco2_right = true;
    up2.show();
    down2.show();
  } else if (Alle_Sensoren_Blau.name == "Temperatur") {
    T_right = true;
    up2.show();
    down2.show();
  } else if (Alle_Sensoren_Blau.name == "rel. Luftfeuchte") {
    H_right = true;
    up2.show();
    down2.show();
  } else if (Alle_Sensoren_Blau.name == "CO2"  || Alle_Sensoren_Blau.name == "CO") {
    CO2_right = true;
    up2.show();
    down2.show();
  } else if (Alle_Sensoren_Blau.name == "PM1") {
    PM1_right = true;
    up2.show();
    down2.show();
  } else if (Alle_Sensoren_Blau.name == "PM2.5") {
    PM2_5_right = true;
    up2.show();
    down2.show();
  } else if (Alle_Sensoren_Blau.name == "PM4") {
    PM4_right = true;
    up2.show();
    down2.show();
  } else if (Alle_Sensoren_Blau.name == "PM10") {
    PM10_right = true;
    up2.show();
    down2.show();
  } else {
    up2.hide();
    down2.hide();
  }


  if (Alle_Sensoren_Rot.name == "TVOC") {
    tvoc_left = true;
    up1.show();
    down1.show();
  } else if (Alle_Sensoren_Rot.name == "eCO2" || Alle_Sensoren_Rot.name == "eCO") {
    eco2_left = true;
    up1.show();
    down1.show();
  } else if (Alle_Sensoren_Rot.name == "Temperatur") {
    T_left = true;
    up1.show();
    down1.show();
  } else if (Alle_Sensoren_Rot.name == "rel. Luftfeuchte") {
    H_left = true;
    up1.show();
    down1.show();
  } else if (Alle_Sensoren_Rot.name == "CO2" || Alle_Sensoren_Rot.name == "CO") {
    CO2_left = true;
    up1.show();
    down1.show();
  } else if (Alle_Sensoren_Rot.name == "PM1") {
    PM1_left = true;
    up1.show();
    down1.show();
  } else if (Alle_Sensoren_Rot.name == "PM2.5") {
    PM2_5_left = true;
    up1.show();
    down1.show();
  } else if (Alle_Sensoren_Rot.name == "PM4") {
    PM4_left = true;
    up1.show();
    down1.show();
  } else if (Alle_Sensoren_Rot.name == "PM10") {
    PM10_left = true;
    up1.show();
    down1.show();
  } else {
    up1.hide();
    down1.hide();
  }




  // Zeichne den Hintergrund
  fill(255);
  stroke(0);
  rect(120, 140, 830, 500);
  fill(230);
  rect(1080, -1, 200, 720);
  stroke(100, 100);

  if (y_scale[0] != 0 || y_scale[1] != 0) {
    for (int i = 0; i < 4; i++) {
      line(120, 240 + 100*i, 950, 240 + 100*i);
    }
  }
  if (up1.isClicked()) {
    y_scale[0] += 1;
    if (y_scale[0] > 5) {
      y_scale[0] = 0;
    }
  }

  if (down1.isClicked()) {
    y_scale[0] -= 1;
    if (y_scale[0] < 0) {
      y_scale[0] = 5;
    }
  }

  if (up2.isClicked()) {
    y_scale[1] += 1;
    if (y_scale[1] > 5) {
      y_scale[1] = 0;
    }
  }

  if (down2.isClicked()) {
    y_scale[1] -= 1;
    if (y_scale[1] < 0) {
      y_scale[1] = 5;
    }
  }

  if (left1.isClicked()) {
    x_scale -= 1;
    if (x_scale < 0) {
      x_scale =  10;
    }
  }

  if (right1.isClicked()) {
    x_scale += 1;
    if (x_scale > 10) {
      x_scale = 0;
    }
  }
  fill(0);

  String intervall = "";
  if (x_scale == 0) {
    intervall = "alle\nMesswerte";
  } else if (x_scale == 1) {
    intervall = "letzte\n60 Sekunden";
  } else if (x_scale == 2) {
    intervall = "letzte\n180 Sekunden";
  } else if (x_scale == 3) {
    intervall = "letzte\n360 Sekunden";
  } else if (x_scale == 4) {
    intervall = "letzte\n12 Minuten";
  } else if (x_scale == 5) {
    intervall = "letzte\n60 Minuten";
  } else if (x_scale == 6) {
    intervall = "letzte\n180 Minuten";
  } else if (x_scale == 7) {
    intervall = "letzte\n360 Minuten";
  } else if (x_scale == 8) {
    intervall = "letzte\n12 Stunden";
  } else if (x_scale == 9) {
    intervall = "letzte\n24 Stunden";
  } else if (x_scale == 10) {
    intervall = "letzte\n72 Stunden";
  }


  if (PM1_left) {
    graph(sps_pm1_data, 0, "Feinstaub PM1 in μg/m³", x_scale, y_scale, true);
  } else if (PM2_5_left) {
    graph(sps_pm25_data, 0, "Feinstaub PM2.5 in μg/m³", x_scale, y_scale, true);
  } else if (PM4_left) {
    graph(sps_pm4_data, 0, "Feinstaub PM4 in μg/m³", x_scale, y_scale, true);
  } else if (PM10_left) {
    graph(sps_pm10_data, 0, "Feinstaub PM10 in μg/m³", x_scale, y_scale, true);
  } else if (tvoc_left) {
    graph(sgp_tvoc_data, 0, "TVOC in ppb", x_scale, y_scale, true);
  } else if (eco2_left) {
    graph(sgp_eco2_data, 0, "eCO2 in ppm", x_scale, y_scale, true);
  } else if (T_left) {
    graph(scd_temperature_data, 0, "Temperatur in °C", x_scale, y_scale, true);
  } else if (H_left) {
    graph(scd_humidity_data, 0, "relative Luftfeuchte in %", x_scale, y_scale, true);
  } else if (CO2_left) {
    graph(scd_co2_data, 0, "CO2 in ppm", x_scale, y_scale, true);
  }




  if (PM1_right) {
    graph(sps_pm1_data, 0, "Feinstaub PM1 in μg/m³", x_scale, y_scale, false);
  } else if (PM2_5_right) {
    graph(sps_pm25_data, 0, "Feinstaub PM2.5 in μg/m³", x_scale, y_scale, false);
  } else if (PM4_right) {
    graph(sps_pm4_data, 0, "Feinstaub PM4 in μg/m³", x_scale, y_scale, false);
  } else if (PM10_right) {
    graph(sps_pm10_data, 0, "Feinstaub PM10 in μg/m³", x_scale, y_scale, false);
  } else if (tvoc_right) {
    graph(sgp_tvoc_data, 0, "TVOC in ppb", x_scale, y_scale, false);
  } else if (eco2_right) {
    graph(sgp_eco2_data, 0, "eCO2 in ppm", x_scale, y_scale, false);
  } else  if (T_right) {
    graph(scd_temperature_data, 0, "Temperatur in °C", x_scale, y_scale, false);
  } else if (H_right) {
    graph(scd_humidity_data, 0, "relative Luftfeuchte in %", x_scale, y_scale, false);
  } else if (CO2_right) {
    graph(scd_co2_data, 0, "CO2 in ppm", x_scale, y_scale, false);
  }
  fill(0);
  noStroke();
  textSize(24);
  text("Optionen", 1130, 22);
  fill(240);
  stroke(0);
  rect(1105, 445, 155, 140);
  rect(1105, 250, 155, 180);
  rect(1105, 155, 155, 80);
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
  text("Anzeige\nMesswerte", 1185, 280);
  text(intervall, 1185, 390);
  textSize(13);
  text("Messunsicherheit", 1165, 180);
  textSize(16);
  text("verbinden", 1165, 220);
  textAlign(CORNER);
  stroke(0);
  if (measure) {
    fill(0, 255, 0);
  } else {
    fill(255, 0, 0);
  }
  ellipse(1098, 60, 20, 20);

  Alle_Sensoren_Rot.show();
  Alle_Sensoren_Blau.show();
  left1.show();
  right1.show();
  reset.show();
  back.show();
  aktualisierung_right.show();
  aktualisierung_left.show();
  start_stopp.show();
  zumObermenu.show();
  verbinde.show();
  fehler.show();
  zumObermenu.y = 600;


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




/// MESSWERT GEGEN MESSWERT
void alleSensoren2() {
  boolean PM1_left = false;
  boolean PM1_right = false;
  boolean PM2_5_left = false;
  boolean PM2_5_right = false;
  boolean PM4_left = false;
  boolean PM4_right = false;
  boolean PM10_left = false;
  boolean PM10_right = false;
  boolean eco2_left = false;
  boolean eco2_right = false;
  boolean tvoc_left = false;
  boolean tvoc_right = false;
  boolean T_left = false;
  boolean T_right = false;
  boolean H_left = false;
  boolean H_right = false;
  boolean CO2_left = false;
  boolean CO2_right = false;

  String x_achse = "";
  String y_achse = "";
  String subx = "";
  String suby = "";

  if (Alle_Sensoren_Blau.name == "TVOC") {
    tvoc_right = true;
    y_up.show();
    y_down.show();
    y_achse = "TVOC in ppb";
  } else if (Alle_Sensoren_Blau.name == "eCO2" || Alle_Sensoren_Blau.name == "eCO") {
    eco2_right = true;
    y_up.show();
    y_down.show();
    y_achse = "eCO  in ppm";
    suby = "2";
  } else if (Alle_Sensoren_Blau.name == "Temperatur") {
    T_right = true;
    y_up.show();
    y_down.show();
    y_achse = "Temperatur in °C";
  } else if (Alle_Sensoren_Blau.name == "rel. Luftfeuchte") {
    H_right = true;
    y_up.show();
    y_down.show();
    y_achse = "rel. Luftfeuchte in %";
  } else if (Alle_Sensoren_Blau.name == "CO2"  || Alle_Sensoren_Blau.name == "CO") {
    CO2_right = true;
    y_up.show();
    y_down.show();
    y_achse = "CO  in ppm";
    suby = "2";
  } else if (Alle_Sensoren_Blau.name == "PM1") {
    PM1_right = true;
    y_up.show();
    y_down.show();
    y_achse = "Feinstaub PM1 in µg/m³";
  } else if (Alle_Sensoren_Blau.name == "PM2.5") {
    PM2_5_right = true;
    y_up.show();
    y_down.show();
    y_achse = "Feinstaub PM2.5 in µg/m³";
  } else if (Alle_Sensoren_Blau.name == "PM4") {
    PM4_right = true;
    y_up.show();
    y_down.show();
    y_achse = "Feinstaub PM4 in µg/m³";
  } else if (Alle_Sensoren_Blau.name == "PM10") {
    PM10_right = true;
    y_up.show();
    y_down.show();
    y_achse = "Feinstaub PM10 in µg/m³";
  } else {
    y_up.hide();
    y_down.hide();
  }


  if (Alle_Sensoren_Rot.name == "TVOC") {
    tvoc_left = true;
    x_up.show();
    x_down.show();
    x_achse = "TVOC in ppb";
  } else if (Alle_Sensoren_Rot.name == "eCO2" || Alle_Sensoren_Rot.name == "eCO") {
    eco2_left = true;
    x_up.show();
    x_down.show();
    x_achse = "eCO  in ppm";
    subx = "2";
  } else if (Alle_Sensoren_Rot.name == "Temperatur") {
    T_left = true;
    x_up.show();
    x_down.show();
    x_achse = "Temperatur in °C";
  } else if (Alle_Sensoren_Rot.name == "rel. Luftfeuchte") {
    H_left = true;
    x_up.show();
    x_down.show();
    x_achse = "rel. Luftfeuchte in %";
  } else if (Alle_Sensoren_Rot.name == "CO2" || Alle_Sensoren_Rot.name == "CO") {
    CO2_left = true;
    x_up.show();
    x_down.show();
    x_achse = "CO in ppm";
    subx = "2";
  } else if (Alle_Sensoren_Rot.name == "PM1") {
    PM1_left = true;
    x_up.show();
    x_down.show();
    x_achse = "Feinstaub PM1 in µg/m³";
  } else if (Alle_Sensoren_Rot.name == "PM2.5") {
    PM2_5_left = true;
    x_up.show();
    x_down.show();
    x_achse = "Feinstaub PM2.5 in µg/m³";
  } else if (Alle_Sensoren_Rot.name == "PM4") {
    PM4_left = true;
    x_up.show();
    x_down.show();
    x_achse = "Feinstaub PM4 in µg/m³";
  } else if (Alle_Sensoren_Rot.name == "PM10") {
    PM10_left = true;
    x_up.show();
    x_down.show();
    x_achse = "Feinstaub PM10 in µg/m³";
  } else {
    x_up.hide();
    x_down.hide();
  }




  // Zeichne den Hintergrund
  fill(255);
  stroke(0);
  rect(120, 140, 830, 500);
  fill(230);
  rect(1080, -1, 200, 720);
  stroke(100, 100);


  fill(0);
  noStroke();
  textSize(24);
  text("Optionen", 1130, 22);
  fill(240);
  stroke(0);
  rect(1105, 445, 155, 140);
  rect(1105, 250, 155, 180);
  rect(1105, 155, 155, 80);
  fill(0);
  stroke(200);
  for (int i = 0; i < 4; i++) {
    line(286 + i*166, 140, 286 + i*166, 640);
    line(120, 240 + 100*i, 950, 240 + 100*i);
  }
  noStroke();
  textSize(20);
  textAlign(CENTER);


  if (y_scale[0] != 0 || y_scale[1] != 0) {
    for (int i = 0; i < 4; i++) {
      line(120, 240 + 100*i, 950, 240 + 100*i);
    }
  }
  if (x_up.isClicked()) {
    y_scale[0] += 1;
    if (y_scale[0] > 5) {
      y_scale[0] = 0;
    }
  }

  if (x_down.isClicked()) {
    y_scale[0] -= 1;
    if (y_scale[0] < 0) {
      y_scale[0] = 5;
    }
  }

  if (y_up.isClicked()) {
    y_scale[1] += 1;
    if (y_scale[1] > 5) {
      y_scale[1] = 0;
    }
  }

  if (y_down.isClicked()) {
    y_scale[1] -= 1;
    if (y_scale[1] < 0) {
      y_scale[1] = 5;
    }
  }

  if (left1.isClicked()) {
    x_scale -= 1;
    if (x_scale < 0) {
      x_scale =  10;
    }
  }

  if (right1.isClicked()) {
    x_scale += 1;
    if (x_scale > 10) {
      x_scale = 0;
    }
  }
  fill(0);

  String intervall = "";
  if (x_scale == 0) {
    intervall = "alle\nMesswerte";
  } else if (x_scale == 1) {
    intervall = "letzte\n60 Sekunden";
  } else if (x_scale == 2) {
    intervall = "letzte\n180 Sekunden";
  } else if (x_scale == 3) {
    intervall = "letzte\n360 Sekunden";
  } else if (x_scale == 4) {
    intervall = "letzte\n12 Minuten";
  } else if (x_scale == 5) {
    intervall = "letzte\n60 Minuten";
  } else if (x_scale == 6) {
    intervall = "letzte\n180 Minuten";
  } else if (x_scale == 7) {
    intervall = "letzte\n360 Minuten";
  } else if (x_scale == 8) {
    intervall = "letzte\n12 Stunden";
  } else if (x_scale == 9) {
    intervall = "letzte\n24 Stunden";
  } else if (x_scale == 10) {
    intervall = "letzte\n72 Stunden";
  }







  fill(0);
  textAlign(CENTER);
  if (del == 0) {
    text("Messintervall", 1185, 480);
    text("Maximum", 1190, 565);
  } else {
    text("Messintervall", 1185, 480);
    text(nf(del, 0, 0) + " s", 1185, 565);
  }
  text("Anzeige\nMesswerte", 1185, 280);
  text(intervall, 1185, 390);
  text(x_achse, 530, 680);
  textSize(15);
  if (x_achse == "eCO  in ppm") {
    text(subx, 515, 690);
  } else {
    text(subx, 510, 690);
  }
  textSize(20);
  pushMatrix();
  translate(width/2, height/2);
  rotate(3*PI/2);
  text(y_achse, height/2 -400, -width/2 + 80);
  textSize(15);
  if (y_achse == "eCO  in ppm") {
    text(suby, height/2 -415, -width/2 + 90);
  } else {
    text(suby, height/2 -422, -width/2 + 90);
  }
  popMatrix();
  textSize(13);
  text("Messunsicherheit", 1165, 180);
  textSize(16);
  text("verbinden", 1165, 220);

  textAlign(CORNER);
  stroke(0);
  if (measure) {
    fill(0, 255, 0);
  } else {
    fill(255, 0, 0);
  }
  ellipse(1098, 60, 20, 20);


  if (PM1_left) {
    if (PM1_right) {
      freePlot(sps_pm1_data, sps_pm1_data, x_scale, y_scale[0], y_scale[1], 5, 5);
    } else if (PM2_5_right) {
      freePlot(sps_pm1_data, sps_pm25_data, x_scale, y_scale[0], y_scale[1], 5, 5);
    } else if (PM4_right) {
      freePlot(sps_pm1_data, sps_pm4_data, x_scale, y_scale[0], y_scale[1], 5, 5);
    } else if (PM10_right) {
      freePlot(sps_pm1_data, sps_pm10_data, x_scale, y_scale[0], y_scale[1], 5, 5);
    } else if (eco2_right) {
      freePlot(sps_pm1_data, sgp_eco2_data, x_scale, y_scale[0], y_scale[1], 5, 3);
    } else if (CO2_right) {
      freePlot(sps_pm1_data, scd_co2_data, x_scale, y_scale[0], y_scale[1], 5, 2);
    } else if (tvoc_right) {
      freePlot(sps_pm1_data, sgp_tvoc_data, x_scale, y_scale[0], y_scale[1], 5, 4);
    } else if (T_right) {
      freePlot(sps_pm1_data, scd_temperature_data, x_scale, y_scale[0], y_scale[1], 5, 0);
    } else if (H_right) {
      freePlot(sps_pm1_data, scd_humidity_data, x_scale, y_scale[0], y_scale[1], 5, 1);
    }
  } else if (PM2_5_left) {
    if (PM1_right) {
      freePlot(sps_pm25_data, sps_pm1_data, x_scale, y_scale[0], y_scale[1], 5, 5);
    } else if (PM2_5_right) {
      freePlot(sps_pm25_data, sps_pm25_data, x_scale, y_scale[0], y_scale[1], 5, 5);
    } else if (PM4_right) {
      freePlot(sps_pm25_data, sps_pm4_data, x_scale, y_scale[0], y_scale[1], 5, 5);
    } else if (PM10_right) {
      freePlot(sps_pm25_data, sps_pm10_data, x_scale, y_scale[0], y_scale[1], 5, 5);
    } else if (eco2_right) {
      freePlot(sps_pm25_data, sgp_eco2_data, x_scale, y_scale[0], y_scale[1], 5, 3);
    } else if (CO2_right) {
      freePlot(sps_pm25_data, scd_co2_data, x_scale, y_scale[0], y_scale[1], 5, 2);
    } else if (tvoc_right) {
      freePlot(sps_pm25_data, sgp_tvoc_data, x_scale, y_scale[0], y_scale[1], 5, 4);
    } else if (T_right) {
      freePlot(sps_pm25_data, scd_temperature_data, x_scale, y_scale[0], y_scale[1], 5, 0);
    } else if (H_right) {
      freePlot(sps_pm25_data, scd_humidity_data, x_scale, y_scale[0], y_scale[1], 5, 1);
    }
    // 0 = temperatur
    // 1 = luftfeuchte
    // 2 = CO2
    // 3 = eCO2
    // 4 = TVOC
    // 5 - 8 = PM
  } else if (PM4_left) {
    if (PM1_right) {
      freePlot(sps_pm4_data, sps_pm1_data, x_scale, y_scale[0], y_scale[1], 5, 5);
    } else if (PM2_5_right) {
      freePlot(sps_pm4_data, sps_pm25_data, x_scale, y_scale[0], y_scale[1], 5, 5);
    } else if (PM4_right) {
      freePlot(sps_pm4_data, sps_pm4_data, x_scale, y_scale[0], y_scale[1], 5, 5);
    } else if (PM10_right) {
      freePlot(sps_pm4_data, sps_pm10_data, x_scale, y_scale[0], y_scale[1], 5, 5);
    } else if (eco2_right) {
      freePlot(sps_pm4_data, sgp_eco2_data, x_scale, y_scale[0], y_scale[1], 5, 3);
    } else if (CO2_right) {
      freePlot(sps_pm4_data, scd_co2_data, x_scale, y_scale[0], y_scale[1], 5, 2 );
    } else if (tvoc_right) {
      freePlot(sps_pm4_data, sgp_tvoc_data, x_scale, y_scale[0], y_scale[1], 5, 4 );
    } else if (T_right) {
      freePlot(sps_pm4_data, scd_temperature_data, x_scale, y_scale[0], y_scale[1], 5, 0 );
    } else if (H_right) {
      freePlot(sps_pm4_data, scd_humidity_data, x_scale, y_scale[0], y_scale[1], 5, 1);
    }
  } else if (PM10_left) {
    if (PM1_right) {
      freePlot(sps_pm10_data, sps_pm1_data, x_scale, y_scale[0], y_scale[1], 5, 5);
    } else if (PM2_5_right) {
      freePlot(sps_pm10_data, sps_pm25_data, x_scale, y_scale[0], y_scale[1], 5, 5);
    } else if (PM4_right) {
      freePlot(sps_pm10_data, sps_pm4_data, x_scale, y_scale[0], y_scale[1], 5, 5);
    } else if (PM10_right) {
      freePlot(sps_pm10_data, sps_pm10_data, x_scale, y_scale[0], y_scale[1], 5, 5);
    } else if (eco2_right) {
      freePlot(sps_pm10_data, sgp_eco2_data, x_scale, y_scale[0], y_scale[1], 5, 3);
    } else if (CO2_right) {
      freePlot(sps_pm10_data, scd_co2_data, x_scale, y_scale[0], y_scale[1], 5, 2 );
    } else if (tvoc_right) {
      freePlot(sps_pm10_data, sgp_tvoc_data, x_scale, y_scale[0], y_scale[1], 5, 4 );
    } else if (T_right) {
      freePlot(sps_pm10_data, scd_temperature_data, x_scale, y_scale[0], y_scale[1], 5, 0);
    } else if (H_right) {
      freePlot(sps_pm10_data, scd_humidity_data, x_scale, y_scale[0], y_scale[1], 5, 1 );
    }
  } else if (eco2_left) {
    if (PM1_right) {
      freePlot(sgp_eco2_data, sps_pm1_data, x_scale, y_scale[0], y_scale[1], 3, 5);
    } else if (PM2_5_right) {
      freePlot(sgp_eco2_data, sps_pm25_data, x_scale, y_scale[0], y_scale[1], 3, 5);
    } else if (PM4_right) {
      freePlot(sgp_eco2_data, sps_pm4_data, x_scale, y_scale[0], y_scale[1], 3, 5);
    } else if (PM10_right) {
      freePlot(sgp_eco2_data, sps_pm10_data, x_scale, y_scale[0], y_scale[1], 3, 5);
    } else if (eco2_right) {
      freePlot(sgp_eco2_data, sgp_eco2_data, x_scale, y_scale[0], y_scale[1], 3, 3);
    } else if (CO2_right) {
      freePlot(sgp_eco2_data, scd_co2_data, x_scale, y_scale[0], y_scale[1], 3, 2);
    } else if (tvoc_right) {
      freePlot(sgp_eco2_data, sgp_tvoc_data, x_scale, y_scale[0], y_scale[1], 3, 4);
    } else if (T_right) {
      freePlot(sgp_eco2_data, scd_temperature_data, x_scale, y_scale[0], y_scale[1], 3, 0);
    } else if (H_right) {
      freePlot(sgp_eco2_data, scd_humidity_data, x_scale, y_scale[0], y_scale[1], 3, 1);
    }
  } else if (CO2_left) {
    if (PM1_right) {
      freePlot(scd_co2_data, sps_pm1_data, x_scale, y_scale[0], y_scale[1], 2, 5);
    } else if (PM2_5_right) {
      freePlot(scd_co2_data, sps_pm25_data, x_scale, y_scale[0], y_scale[1], 2, 5);
    } else if (PM4_right) {
      freePlot(scd_co2_data, sps_pm4_data, x_scale, y_scale[0], y_scale[1], 2, 5);
    } else if (PM10_right) {
      freePlot(scd_co2_data, sps_pm10_data, x_scale, y_scale[0], y_scale[1], 2, 5);
    } else if (eco2_right) {
      freePlot(scd_co2_data, sgp_eco2_data, x_scale, y_scale[0], y_scale[1], 2, 3);
    } else if (CO2_right) {
      freePlot(scd_co2_data, scd_co2_data, x_scale, y_scale[0], y_scale[1], 2, 2);
    } else if (tvoc_right) {
      freePlot(scd_co2_data, sgp_tvoc_data, x_scale, y_scale[0], y_scale[1], 2, 4);
    } else if (T_right) {
      freePlot(scd_co2_data, scd_temperature_data, x_scale, y_scale[0], y_scale[1], 2, 0);
    } else if (H_right) {
      freePlot(scd_co2_data, scd_humidity_data, x_scale, y_scale[0], y_scale[1], 2, 1);
    }
  } else if (T_left) {
    if (PM1_right) {
      freePlot(scd_temperature_data, sps_pm1_data, x_scale, y_scale[0], y_scale[1], 0, 5);
    } else if (PM2_5_right) {
      freePlot(scd_temperature_data, sps_pm25_data, x_scale, y_scale[0], y_scale[1], 0, 5);
    } else if (PM4_right) {
      freePlot(scd_temperature_data, sps_pm4_data, x_scale, y_scale[0], y_scale[1], 0, 5);
    } else if (PM10_right) {
      freePlot(scd_temperature_data, sps_pm10_data, x_scale, y_scale[0], y_scale[1], 0, 5);
    } else if (eco2_right) {
      freePlot(scd_temperature_data, sgp_eco2_data, x_scale, y_scale[0], y_scale[1], 0, 3);
    } else if (CO2_right) {
      freePlot(scd_temperature_data, scd_co2_data, x_scale, y_scale[0], y_scale[1], 0, 2);
    } else if (tvoc_right) {
      freePlot(scd_temperature_data, sgp_tvoc_data, x_scale, y_scale[0], y_scale[1], 0, 4);
    } else if (T_right) {
      freePlot(scd_temperature_data, scd_temperature_data, x_scale, y_scale[0], y_scale[1], 0, 0);
    } else if (H_right) {
      freePlot(scd_temperature_data, scd_humidity_data, x_scale, y_scale[0], y_scale[1], 0, 1);
    }
  } else if (H_left) {
    if (PM1_right) {
      freePlot(scd_humidity_data, sps_pm1_data, x_scale, y_scale[0], y_scale[1], 1, 5);
    } else if (PM2_5_right) {
      freePlot(scd_humidity_data, sps_pm25_data, x_scale, y_scale[0], y_scale[1], 1, 5);
    } else if (PM4_right) {
      freePlot(scd_humidity_data, sps_pm4_data, x_scale, y_scale[0], y_scale[1], 1, 5);
    } else if (PM10_right) {
      freePlot(scd_humidity_data, sps_pm10_data, x_scale, y_scale[0], y_scale[1], 1, 5);
    } else if (eco2_right) {
      freePlot(scd_humidity_data, sgp_eco2_data, x_scale, y_scale[0], y_scale[1], 1, 3);
    } else if (CO2_right) {
      freePlot(scd_humidity_data, scd_co2_data, x_scale, y_scale[0], y_scale[1], 1, 2);
    } else if (tvoc_right) {
      freePlot(scd_humidity_data, sgp_tvoc_data, x_scale, y_scale[0], y_scale[1], 1, 4);
    } else if (T_right) {
      freePlot(scd_humidity_data, scd_temperature_data, x_scale, y_scale[0], y_scale[1], 1, 0);
    } else if (H_right) {
      freePlot(scd_humidity_data, scd_humidity_data, x_scale, y_scale[0], y_scale[1], 1, 1);
    }
  } else if (tvoc_left) {
    if (PM1_right) {
      freePlot(sgp_tvoc_data, sps_pm1_data, x_scale, y_scale[0], y_scale[1], 4, 5);
    } else if (PM2_5_right) {
      freePlot(sgp_tvoc_data, sps_pm25_data, x_scale, y_scale[0], y_scale[1], 4, 5);
    } else if (PM4_right) {
      freePlot(sgp_tvoc_data, sps_pm4_data, x_scale, y_scale[0], y_scale[1], 4, 5);
    } else if (PM10_right) {
      freePlot(sgp_tvoc_data, sps_pm10_data, x_scale, y_scale[0], y_scale[1], 4, 5);
    } else if (eco2_right) {
      freePlot(sgp_tvoc_data, sgp_eco2_data, x_scale, y_scale[0], y_scale[1], 4, 3);
    } else if (CO2_right) {
      freePlot(sgp_tvoc_data, scd_co2_data, x_scale, y_scale[0], y_scale[1], 4, 2);
    } else if (tvoc_right) {
      freePlot(sgp_tvoc_data, sgp_tvoc_data, x_scale, y_scale[0], y_scale[1], 4, 4);
    } else if (T_right) {
      freePlot(sgp_tvoc_data, scd_temperature_data, x_scale, y_scale[0], y_scale[1], 4, 0);
    } else if (H_right) {
      freePlot(sgp_tvoc_data, scd_humidity_data, x_scale, y_scale[0], y_scale[1], 4, 1);
    }
  }
  textSize(20);
  fill(0);
  text("Ordinate", 640, 35);
  text("Abszisse", 340, 35);

  Alle_Sensoren_Rot.show();
  Alle_Sensoren_Blau.show();
  left1.show();
  right1.show();
  reset.show();
  back.show();
  aktualisierung_right.show();
  aktualisierung_left.show();
  start_stopp.show();
  zumObermenu.show();
  verbinde.show();
  fehler.show();
  zumObermenu.y = 600;
}





void freePlot(float[] arr_X, float[] arr_Y, int time_scale, int x_scale, int y_scale, int stoffX, int stoffY) {
  // stoff:
  // 0 = temperatur
  // 1 = luftfeuchte
  // 2 = CO2
  // 3 = eCO2
  // 4 = TVOC
  // 5 - 8 = PM

  //float[] zeitskala = new float[999999];
  //if (time_scale == 0) {
  //  for (int i = 0; i < 999999; i++) {
  //    zeitskala[i] = zeit[i];
  //  }
  //}
  int xValues = 0;
  if (time_scale == 0) {
    if (index > 0) {
      xValues = index;
    }
  } else if (time_scale == 1) {
    xValues = time(60, zeit, 0);
  } else if (time_scale == 2) {
    xValues = time(180, zeit, 0);
  } else if (time_scale == 3) {
    xValues = time(360, zeit, 0);
  } else if (time_scale == 4) {
    xValues = time(720, zeit, 0);
  } else if (time_scale == 5) {
    xValues = time(3600, zeit, 0);
  } else if (time_scale == 6) {
    xValues = time(10800, zeit, 0);
  } else if (time_scale == 7) {
    xValues = time(21600, zeit, 0);
  } else if (time_scale == 8) {
    xValues = time(43200, zeit, 0);
  } else if (time_scale == 9) {
    xValues = time(86400, zeit, 0);
  } else if (time_scale == 10) {
    xValues = time(259200, zeit, 0);
  } else {
    xValues = index;
  }

  // 1. Max und Min der beiden Array bestimmen

  float maxX = 0;
  float minX = 99999;
  float maxY = 0;
  float minY = 99999;
  for (int i = 1; i < 10; i++) {
    if (x_scale == i) {
      minX = 0;
      if (stoffX == 0) {
        maxX = 20*i;
      } else if (stoffX == 1) {
        maxX = 20*i;
      } else if (stoffX == 2 || stoffX == 3) {
        maxX = 500*i;
      } else if (stoffX == 4) {
        maxX = 50*i;
      } else if (stoffX >= 5) {
        maxX = 20*i;
      }
    }

    if (y_scale == i) {
      minY = 0;
      if (stoffY== 0) {
        maxY = 20*i;
      } else if (stoffY == 1) {
        maxY = 20*i;
      } else if (stoffY == 2 || stoffY == 3) {
        maxY = 500*i;
      } else if (stoffY == 4) {
        maxY = 50*i;
      } else if (stoffY >= 5) {
        maxY = 20*i;
      }
    }
  }
  if (x_scale == 0) {
    for (int i = (index - xValues); i < index; i++) {
      if (arr_X[i] > maxX) {
        maxX = arr_X[i];
      }
      if (arr_X[i] < minX) {
        minX = arr_X[i];
      }
    }
  } 

  if (y_scale == 0) {
    for (int i = (index - xValues); i < index; i++) {
      if (arr_Y[i] > maxY) {
        maxY = arr_Y[i];
      }
      if (arr_Y[i] < minY) {
        minY = arr_Y[i];
      }
    }
  }

  float ex1 = 0;
  float ex2 = 0;
  float ey1 = 0;
  float ey2 = 0;

  float errorX = 0;
  float errorY = 0;

  String EinheitX = "";
  String EinheitY = "";

  stroke(255, 0, 0);
  for (int i = (index - xValues); i < index; i++) {
    if (stoffX == 0) {
      errorX = 0.5;
      EinheitX = "°C";
      ex1 = 120 + 830*(arr_X[i] + 0.5 - minX)/(maxX - minX);
      ex2 = 120 + 830*(arr_X[i] - 0.5 - minX)/(maxX - minX);
    } else if (stoffX == 1) {
      errorX = 2;
      EinheitX = "%";
      ex1 = 120 + 830*(arr_X[i] + 2 - minX)/(maxX - minX);
      ex2 = 120 + 830*(arr_X[i] - 2 - minX)/(maxX - minX);
    } else if (stoffX == 2) {
      EinheitX = "ppm";
      errorX = 30 + 0.03*arr_X[i];
      ex1 = 120 + 830*(arr_X[i] + 30 + 0.03*arr_X[i] - minX)/(maxX - minX);
      ex2 = 120 + 830*(arr_X[i] - 30 - 0.03*arr_X[i] - minX)/(maxX - minX);
    } else if (stoffX == 3) {
      errorX =  0.1*arr_X[i];
      EinheitX = "ppm";
      ex1 = 120 + 830*(arr_X[i] + 0.1*arr_X[i] - minX)/(maxX - minX);
      ex2 = 120 + 830*(arr_X[i] - 0.1*arr_X[i] - minX)/(maxX - minX);
    } else if (stoffX == 4) {
      errorX = 0.15*arr_X[i];
      EinheitX = "ppb";
      ex1 = 120 + 830*(arr_X[i] + 0.15*arr_X[i] - minX)/(maxX - minX);
      ex2 = 120 + 830*(arr_X[i] - 0.15*arr_X[i] - minX)/(maxX - minX);
    } else if (stoffX >= 5) {
      EinheitX = "µg/m³";
      if (arr_X[i] < 100) {
        errorX = 10;
        ex1 = 120 + 830*(arr_X[i] + 10 - minX)/(maxX - minX);
        ex2 = 120 + 830*(arr_X[i] - 10 - minX)/(maxX - minX);
      } else {
        errorX = 0.1*arr_X[i];
        ex1 = 120 + 830*(1.1*arr_X[i] - minX)/(maxX - minX);
        ex2 = 120 + 830*(0.9*arr_X[i] - minX)/(maxX - minX);
      }
    }

    if (stoffY == 0) {
      EinheitY = "°C";
      errorY = 0.5;
      ey1 = 640 -  500*(arr_Y[i] + 0.5 - minY)/(maxY - minY);
      ey2 = 640 -  500*(arr_Y[i] - 0.5 - minY)/(maxY - minY);
    } else if (stoffY == 1) {
      EinheitY = "%";
      errorY = 2;
      ey1 = 640 -  500*(arr_Y[i] + 2 - minY)/(maxY - minY);
      ey2 = 640 -  500*(arr_Y[i] - 2 - minY)/(maxY - minY);
    } else if (stoffY == 2) {
      EinheitY = "ppm";
      errorY = 30 + 0.03*arr_Y[i];
      ey1 = 640 -  500*(arr_Y[i] + 30 + 0.03*arr_Y[i] - minY)/(maxY - minY);
      ey2 = 640 -  500*(arr_Y[i] - 30 - 0.03*arr_Y[i] - minY)/(maxY - minY);
    } else if (stoffY == 3) {
      EinheitY = "ppm";
      errorY =0.1*arr_Y[i];
      ey1 = 640 -  500*(arr_Y[i] + 0.1*arr_Y[i] - minY)/(maxY - minY);
      ey2 = 640 -  500*(arr_Y[i] - 0.1*arr_Y[i] - minY)/(maxY - minY);
    } else if (stoffY == 4) {
      EinheitY = "ppb";
      errorY = 0.15*arr_Y[i];
      ey1 = 640 -  500*(arr_Y[i] + 0.15*arr_Y[i] - minY)/(maxY - minY);
      ey2 = 640 -  500*(arr_Y[i] - 0.15*arr_Y[i] - minY)/(maxY - minY);
    } else if (stoffY >= 5) {
      EinheitY = "µg/m³";
      if (arr_Y[i] < 100) {
        errorY = 10;
        ey1 = 640 - 500*(arr_Y[i] + 10 - minY)/(maxY - minY);
        ey2 = 640 -  500*(arr_Y[i] - 10 - minY)/(maxY - minY);
      } else {
        errorY = 0.1*arr_Y[i];
        ey1 = 640 - 500*(1.1*arr_Y[i] - minY)/(maxY - minY);
        ey2 = 640 - 500*(0.9*arr_Y[i] - minY)/(maxY - minY);
      }
    }


    if (ex1 < 120) {
      ex1 = 120;
    }
    if (ex1 > 950) {
      ex1 = 950;
    }
    if (ex2 < 120) {
      ex2 = 120;
    }
    if (ex2 > 950) {
      ex2 = 950;
    }

    if (ey1 < 140) {
      ey1 = 140;
    }
    if (ey2 < 140) {
      ey2 = 140;
    }
    if (ey1 > 640) {
      ey1 = 640;
    }
    if (ey2 > 640) {
      ey2 = 640;
    }


    float x1 = 120 + 830*(arr_X[i] - minX)/(maxX - minX);
    float y1 = 640 - 500*(arr_Y[i] - minY)/(maxY - minY);
    if (verbinde.checked && i < (index - 1)) {
      float x2 = 120 + 830*(arr_X[i+1] - minX)/(maxX - minX);
      float y2 = 640 - 500*(arr_Y[i+1] - minY)/(maxY - minY);
      strokeWeight(1);
      if (x1 >= 120 && x1 <= 950 && y1 >= 140 && y1 <=640) {
        if (x2 >= 120 && x2 <= 950 && y2 >= 140 && y2 <=640) {
          line(x1, y1, x2, y2);
          if (fehler.checked) {
            strokeWeight(0.5);
            line(ex1, y1, ex2, y1);
            line(ex1, y1 - 3, ex1, y1 + 3);
            line(ex2, y1 - 3, ex2, y1 + 3);


            line(x1, ey1, x1, ey2);
            line(x1 - 3, ey1, x1 +3, ey1);
            line(x1 - 3, ey2, x1 + 3, ey2);
          }
        }
      }
    } else {
      if (x1 >= 120 && x1 <= 950 && y1 >= 140 && y1 <=640) {
        strokeWeight(2);
        line(x1-3, y1, x1+3, y1);
        line(x1, y1-3, x1, y1+3);
        if (fehler.checked) {
          strokeWeight(0.5);
          line(ex1, y1, ex2, y1);
          line(ex1, y1 - 3, ex1, y1 + 3);
          line(ex2, y1 - 3, ex2, y1 + 3);


          line(x1, ey1, x1, ey2);
          line(x1 - 3, ey1, x1 +3, ey1);
          line(x1 - 3, ey2, x1 + 3, ey2);
        }
      }
    }
  }
  fill(0);
  text(nf(minX, 0, 1), 110, 670);
  text(nf(maxX, 0, 1), 950, 670);

  text(nf(minY, 0, 1), 70, 630);
  text(nf(maxY, 0, 1), 70, 150);
  strokeWeight(1);

  noStroke();
  fill(255, 0, 0);
  textAlign(LEFT);
  textSize(16);
  fill(0);


  if (errorX != 0.5 && index > 1) {
    text("Aktueller Wert: (" + str(round(arr_X[index-1])).replace(".", ",") + " +/- " + round(errorX) + ") " + EinheitX, 120, 75);
  } else {
    if (index > 1) {
      text("Aktueller Wert: (" + str(round(arr_X[index-1])).replace(".", ",") + " +/- 0,5) " + EinheitX, 150, 75);
    }
  }

  if (errorY != 0.5 && index > 1) {
    text("Aktueller Wert: (" + str(round(arr_Y[index-1])).replace(".", ",") + " +/- " + round(errorY) + ") " + EinheitY, 675, 75);
  } else {
    if (index > 1) {
      text("Aktueller Wert: (" + str(round(arr_Y[index-1])).replace(".", ",") + " +/- 0,5) " + EinheitY, 750, 75);
    }
  }
}

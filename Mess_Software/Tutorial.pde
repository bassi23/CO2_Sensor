


void Tutorial0() {
  stroke(0);
  fill(255);
  rect(0.5, 0.5, 1279, 99);
  rect(0.5, 620, 1278, 98.5);
  textAlign(CENTER);
  textSize(30);
  fill(0);
  text("Willkommen!", 640, 50); 
  textSize(24);
  text("In diesem Tutorial erfährst du, wie das Messprogramm funktioniert. Du kannst es jederzeit überspringen,\nindem du auf 'Tutorial überspringen' klickst.", 640, 300);

  tutorial_ueberspringen.show();
  tutorial_weiter.show();
  back.visible = false;
}



void Tutorial1() {
  stroke(0);
  fill(255);
  rect(0.5, 0.5, 1279, 99);
  rect(0.5, 620, 1278, 98.5);
  fill(0);
  textAlign(CENTER);
  textSize(21);
  text("Der Sensor wird über den Mikrocontroller gesteuert. Dieser sendet die Messdaten an dem PC, welcher sie graphisch\ndarstellen kann.", 640, 40);
  textSize(16);
  text("Zeit in Sekunden", 540, 595);
  stroke(0);
  line(0, 100, 1280, 100);
  line(0, 620, 1280, 620);

  fill(255);
  rect(125, 175, 800, 400);

  tutorial_ueberspringen.show();
  tutorial_weiter.show();
  tutorial_back.show();
}




void Tutorial2() {
  stroke(0);
  fill(255);
  rect(0.5, 0.5, 1279, 99);
  rect(0.5, 620, 1278, 98.5);
  fill(0);
  textAlign(CENTER);
  textSize(21);
  fill(0);
  text("Du kannst mit Hilfe der beiden Menüs (rot und blau) auswählen, welche Messgröße gezeichnet werden soll.\nAufgabe: Wähle die Messgrößen 'TVOC' (links) und 'CO ' (rechts) aus.", 640, 40);
  textSize(17);
  text("2", 854, 80);
  textSize(16);
  text("Zeit in Sekunden", 540, 595);
  stroke(0);
  line(0, 100, 1280, 100);
  line(0, 620, 1280, 620);

  fill(255);
  rect(125, 175, 800, 400);
  String einheit_Rot = "";
  String einheit_Blau = "";
  if (tutorial_Rot.name == "TVOC") {
    einheit_Rot = " in ppb";
  } else if (tutorial_Rot.name == "eCO") {
    einheit_Rot = " in ppm";
  } else if (tutorial_Rot.name == "Temperatur") {
    einheit_Rot = " in °C";
  } else if (tutorial_Rot.name == "rel. Luftfeuchte") {
    einheit_Rot = " in %";
  } else if (tutorial_Rot.name == "CO") {
    einheit_Rot = " in ppm";
  } else if (tutorial_Rot.name == "PM1") {
    einheit_Rot = " in µg/m³";
  } else if (tutorial_Rot.name == "PM2.5") {
    einheit_Rot = " in µg/m³";
  } else if (tutorial_Rot.name == "PM4") {
    einheit_Rot = " in µg/m³";
  } else if (tutorial_Rot.name == "PM10") {
    einheit_Rot = " in µg/m³";
  }

  if (tutorial_Blau.name == "TVOC") {
    einheit_Blau = " in ppb";
  } else if (tutorial_Blau.name == "eCO") {
    einheit_Blau = " in ppm";
  } else if (tutorial_Blau.name == "Temperatur") {
    einheit_Blau = " in °C";
  } else if (tutorial_Blau.name == "rel. Luftfeuchte") {
    einheit_Blau = " in %";
  } else if (tutorial_Blau.name == "CO") {
    einheit_Blau = " in ppm";
  } else if (tutorial_Blau.name == "PM1") {
    einheit_Blau = " in µg/m³";
  } else if (tutorial_Blau.name == "PM2.5") {
    einheit_Blau = " in µg/m³";
  } else if (tutorial_Blau.name == "PM4") {
    einheit_Blau = " in µg/m³";
  } else if (tutorial_Blau.name == "PM10") {
    einheit_Blau = " in µg/m³";
  }
  tutorial_ueberspringen.show();
  if (tutorial_Rot.name == "TVOC" && tutorial_Blau.name == "CO") {
    tutorial_weiter.show();
  }
  tutorial_back.show();
  tutorial_Rot.show();
  tutorial_Blau.show();
  textSize(20);

  pushMatrix();
  translate(width/2, height/2);
  rotate(3*PI/2);
  textAlign(CENTER);
  fill(255, 0, 0);
  if (tutorial_Rot.name != "Links") {
    text(tutorial_Rot.name + " " + einheit_Rot, height/2 -380, -width/2 + 50);
    textSize(16);
    if (tutorial_Rot.name == "CO") {
      text("2", height/2 -400, -width/2 + 60);
    } else if (tutorial_Rot.name == "eCO") {
      text("2", height/2 -395, -width/2 + 60);
    }
    textSize(20);
  }
  popMatrix();
  pushMatrix();
  translate(width/2, height/2);
  rotate(PI/2);
  textAlign(CENTER);
  fill(0, 0, 255);
  if (tutorial_Blau.name != "Rechts") {
    text(tutorial_Blau.name + " " + einheit_Blau, -height/2 +380, width/2 - 990);
    textSize(16);
    if (tutorial_Blau.name == "CO") {
      text("2", -height/2 +360, width/2 - 980);
    } else if (tutorial_Blau.name == "eCO") {
      text("2", -height/2 +365, width/2 - 980);
    }
    textSize(20);
  }
  popMatrix();
}



void Tutorial3() {
  stroke(0);
  fill(255);
  rect(0.5, 0.5, 1279, 99);
  rect(0.5, 620, 1278, 98.5);
  fill(0);
  textAlign(CENTER);
  textSize(21);
  fill(0);
  text("Auf der rechten Seite findest du das Optionenmenü. Klicke auf den 'Start/Stopp' Knopf, um Messwerte aufzunehmen.\nAufgabe: Starte eine Messung!", 640, 40);
  textSize(16);
  text("Zeit in Sekunden", 540, 595);

  stroke(0);
  line(0, 100, 1280, 100);
  line(0, 620, 1280, 620);

  fill(220);
  rect(1050, 100, 280, 520);

  fill(255);
  rect(125, 175, 800, 400);
  String einheit_Rot = "";
  String einheit_Blau = "";
  int graph_links = 999;
  int graph_rechts = 999;




  if (tutorial_Rot.name == "TVOC") {
    einheit_Rot = " in ppb";
    graph_links = 3;
  } else if (tutorial_Rot.name == "eCO") {
    einheit_Rot = " in ppm";
    graph_links = 4;
  } else if (tutorial_Rot.name == "Temperatur") {
    einheit_Rot = " in °C";
    graph_links = 0;
  } else if (tutorial_Rot.name == "rel. Luftfeuchte") {
    einheit_Rot = " in %";
    graph_links = 1;
  } else if (tutorial_Rot.name == "CO") {
    einheit_Rot = " in ppm";
    graph_links = 2;
  } else if (tutorial_Rot.name == "PM1") {
    einheit_Rot = " in µg/m³";
    graph_links = 5;
  } else if (tutorial_Rot.name == "PM2.5") {
    einheit_Rot = " in µg/m³";
    graph_links = 6;
  } else if (tutorial_Rot.name == "PM4") {
    einheit_Rot = " in µg/m³";
    graph_links = 7;
  } else if (tutorial_Rot.name == "PM10") {
    einheit_Rot = " in µg/m³";
    graph_links = 8;
  }

  if (tutorial_Blau.name == "TVOC") {
    einheit_Blau = " in ppb";
    graph_rechts = 3;
  } else if (tutorial_Blau.name == "eCO") {
    einheit_Blau = " in ppm";
    graph_rechts = 4;
  } else if (tutorial_Blau.name == "Temperatur") {
    einheit_Blau = " in °C";
    graph_rechts = 0;
  } else if (tutorial_Blau.name == "rel. Luftfeuchte") {
    einheit_Blau = " in %";
    graph_rechts = 1;
  } else if (tutorial_Blau.name == "CO") {
    einheit_Blau = " in ppm";
    graph_rechts = 2;
  } else if (tutorial_Blau.name == "PM1") {
    einheit_Blau = " in µg/m³";
    graph_rechts = 5;
  } else if (tutorial_Blau.name == "PM2.5") {
    einheit_Blau = " in µg/m³";
    graph_rechts = 6;
  } else if (tutorial_Blau.name == "PM4") {
    einheit_Blau = " in µg/m³";
    graph_rechts = 7;
  } else if (tutorial_Blau.name == "PM10") {
    einheit_Blau = " in µg/m³";
    graph_rechts = 8;
  }
  tutorial_ueberspringen.show();
  fill(255, 0, 0);
  stroke(0);
  if (tutorial_Start) {
    fill(0, 255, 0);
  }
  ellipse(1075, 158, 20, 20);

  if (tutorial_Start) {
    tutorial_weiter.show();
  }

  textSize(20);
  pushMatrix();
  translate(width/2, height/2);
  rotate(3*PI/2);
  textAlign(CENTER);
  fill(255, 0, 0);
  if (tutorial_Rot.name != "Links") {
    text(tutorial_Rot.name + " " + einheit_Rot, height/2 -380, -width/2 + 50);
    textSize(16);
    if (tutorial_Rot.name == "CO") {
      text("2", height/2 -400, -width/2 + 60);
    } else if (tutorial_Rot.name == "eCO") {
      text("2", height/2 -395, -width/2 + 60);
    }
    textSize(20);
  }
  popMatrix();
  pushMatrix();
  translate(width/2, height/2);
  rotate(PI/2);
  textAlign(CENTER);
  fill(0, 0, 255);
  if (tutorial_Blau.name != "Rechts") {
    text(tutorial_Blau.name + " " + einheit_Blau, -height/2 +380, width/2 - 990);
    textSize(16);
    if (tutorial_Blau.name == "CO") {
      text("2", -height/2 +360, width/2 - 980);
    } else if (tutorial_Blau.name == "eCO") {
      text("2", -height/2 +365, width/2 - 980);
    }
    textSize(20);
  }
  popMatrix();
  textSize(20);
  fill(0);
  text("Optionen", 1165, 120);


  if (graph_links != 999) {
    tutorial_graph(graph_links, color(255, 0, 0), skalierung_rot, false, true, 0, 0);
  }
  if (graph_rechts != 999) {
    tutorial_graph(graph_rechts, color(0, 0, 255), skalierung_blau, false, true, 0, 0);
  }
  text("0", 125, 600);
  tutorial_back.show();
  tutorial_Rot.show();
  tutorial_Blau.show();
  tutorial_Start_Stopp.show();
}


int skalierung_rot = 0;
int skalierung_blau = 0;



void Tutorial4() {
  stroke(0);
  fill(255);
  rect(0.5, 0.5, 1279, 99);
  rect(0.5, 620, 1278, 98.5);
  fill(0);
  textAlign(CENTER);
  textSize(21);
  fill(0);
  text("Links und rechts, neben dem Graphen, kannst du die Skalierung der Ordinate einstellen.\nAufgabe: Wähle eine geeignete Skalierung!", 640, 40);
  textSize(16);
  text("Zeit in Sekunden", 540, 595);

  stroke(0);
  line(0, 100, 1280, 100);
  line(0, 620, 1280, 620);

  fill(220);
  rect(1050, 100, 229, 520);

  fill(255);
  rect(125, 175, 800, 400);
  String einheit_Rot = "";
  String einheit_Blau = "";
  int graph_links = 999;
  int graph_rechts = 999;




  if (tutorial_Rot.name == "TVOC") {
    einheit_Rot = " in ppb";
    graph_links = 3;
  } else if (tutorial_Rot.name == "eCO") {
    einheit_Rot = " in ppm";
    graph_links = 4;
  } else if (tutorial_Rot.name == "Temperatur") {
    einheit_Rot = " in °C";
    graph_links = 0;
  } else if (tutorial_Rot.name == "rel. Luftfeuchte") {
    einheit_Rot = " in %";
    graph_links = 1;
  } else if (tutorial_Rot.name == "CO") {
    einheit_Rot = " in ppm";
    graph_links = 2;
  } else if (tutorial_Rot.name == "PM1") {
    einheit_Rot = " in µg/m³";
    graph_links = 5;
  } else if (tutorial_Rot.name == "PM2.5") {
    einheit_Rot = " in µg/m³";
    graph_links = 6;
  } else if (tutorial_Rot.name == "PM4") {
    einheit_Rot = " in µg/m³";
    graph_links = 7;
  } else if (tutorial_Rot.name == "PM10") {
    einheit_Rot = " in µg/m³";
    graph_links = 8;
  }

  if (tutorial_Blau.name == "TVOC") {
    einheit_Blau = " in ppb";
    graph_rechts = 3;
  } else if (tutorial_Blau.name == "eCO") {
    einheit_Blau = " in ppm";
    graph_rechts = 4;
  } else if (tutorial_Blau.name == "Temperatur") {
    einheit_Blau = " in °C";
    graph_rechts = 0;
  } else if (tutorial_Blau.name == "rel. Luftfeuchte") {
    einheit_Blau = " in %";
    graph_rechts = 1;
  } else if (tutorial_Blau.name == "CO") {
    einheit_Blau = " in ppm";
    graph_rechts = 2;
  } else if (tutorial_Blau.name == "PM1") {
    einheit_Blau = " in µg/m³";
    graph_rechts = 5;
  } else if (tutorial_Blau.name == "PM2.5") {
    einheit_Blau = " in µg/m³";
    graph_rechts = 6;
  } else if (tutorial_Blau.name == "PM4") {
    einheit_Blau = " in µg/m³";
    graph_rechts = 7;
  } else if (tutorial_Blau.name == "PM10") {
    einheit_Blau = " in µg/m³";
    graph_rechts = 8;
  }
  tutorial_ueberspringen.show();
  fill(255, 0, 0);
  stroke(0);
  if (tutorial_Start) {
    fill(0, 255, 0);
  }
  ellipse(1075, 158, 20, 20);

  if (tutorial_Start) {
    tutorial_weiter.show();
  }

  textSize(20);
  pushMatrix();
  translate(width/2, height/2);
  rotate(3*PI/2);
  textAlign(CENTER);
  fill(255, 0, 0);
  if (tutorial_Rot.name != "Links") {
    text(tutorial_Rot.name + " " + einheit_Rot, height/2 -380, -width/2 + 50);
    textSize(16);
    if (tutorial_Rot.name == "CO") {
      text("2", height/2 -400, -width/2 + 60);
    } else if (tutorial_Rot.name == "eCO") {
      text("2", height/2 -395, -width/2 + 60);
    }
    textSize(20);
  }
  popMatrix();
  pushMatrix();
  translate(width/2, height/2);
  rotate(PI/2);
  textAlign(CENTER);
  fill(0, 0, 255);
  if (tutorial_Blau.name != "Rechts") {
    text(tutorial_Blau.name + " " + einheit_Blau, -height/2 +380, width/2 - 990);
    textSize(16);
    if (tutorial_Blau.name == "CO") {
      text("2", -height/2 +360, width/2 - 980);
    } else if (tutorial_Blau.name == "eCO") {
      text("2", -height/2 +365, width/2 - 980);
    }
    textSize(20);
  }
  popMatrix();
  textSize(20);
  fill(0);
  text("Optionen", 1165, 120);


  if (tutorial_skalierung_rot_up.isClicked()) {
    skalierung_rot += 1;
    if (skalierung_rot == 5) {
      skalierung_rot = 0;
    }
  }
  if (tutorial_skalierung_rot_down.isClicked()) {
    skalierung_rot -= 1;
    if (skalierung_rot == -1) {
      skalierung_rot = 4;
    }
  }

  if (tutorial_skalierung_blau_up.isClicked()) {
    skalierung_blau += 1;
    if (skalierung_blau == 5) {
      skalierung_blau = 0;
    }
  }
  if (tutorial_skalierung_blau_down.isClicked()) {
    skalierung_blau -= 1;
    if (skalierung_blau == -1) {
      skalierung_blau = 4;
    }
  }









  if (graph_links != 999) {
    tutorial_graph(graph_links, color(255, 0, 0), skalierung_rot, false, true, 0, 0);
  }
  if (graph_rechts != 999) {
    tutorial_graph(graph_rechts, color(0, 0, 255), skalierung_blau, false, true, 0, 0);
  }
  // text(index_tutorial, 925, 600);
  text("0", 125, 600);

  noFill();
  strokeWeight(4);
  stroke(255, 0, 0);
  ellipse(27.5, 215, 50, 150);
  ellipse(1017.5, 215, 50, 150);

  tutorial_back.show();
  tutorial_Rot.show();
  tutorial_Blau.show();
  tutorial_Start_Stopp.show();
  tutorial_skalierung_rot_up.show();
  tutorial_skalierung_rot_down.show();
  tutorial_skalierung_blau_up.show();
  tutorial_skalierung_blau_down.show();
}



void Tutorial5() {
  stroke(0);
  fill(255);
  rect(0.5, 0.5, 1279, 99);
  rect(0.5, 620, 1278, 98.5);
  fill(0);
  textAlign(CENTER);
  textSize(21);
  fill(0);
  text("In den Optionen hast du die Möglichkeit deine bisherigen Messwerte zu löschen.\nAufgabe: Lösche die bisherigen Daten!", 640, 40);
  textSize(16);
  text("Zeit in Sekunden", 540, 595);

  stroke(0);
  line(0, 100, 1280, 100);
  line(0, 620, 1280, 620);

  fill(220);
  rect(1050, 100, 229, 520);

  fill(255);
  rect(125, 175, 800, 400);
  String einheit_Rot = "";
  String einheit_Blau = "";
  int graph_links = 999;
  int graph_rechts = 999;

  if (tutorial_Rot.name == "TVOC") {
    einheit_Rot = " in ppb";
    graph_links = 3;
  } else if (tutorial_Rot.name == "eCO") {
    einheit_Rot = " in ppm";
    graph_links = 4;
  } else if (tutorial_Rot.name == "Temperatur") {
    einheit_Rot = " in °C";
    graph_links = 0;
  } else if (tutorial_Rot.name == "rel. Luftfeuchte") {
    einheit_Rot = " in %";
    graph_links = 1;
  } else if (tutorial_Rot.name == "CO") {
    einheit_Rot = " in ppm";
    graph_links = 2;
  } else if (tutorial_Rot.name == "PM1") {
    einheit_Rot = " in µg/m³";
    graph_links = 5;
  } else if (tutorial_Rot.name == "PM2.5") {
    einheit_Rot = " in µg/m³";
    graph_links = 6;
  } else if (tutorial_Rot.name == "PM4") {
    einheit_Rot = " in µg/m³";
    graph_links = 7;
  } else if (tutorial_Rot.name == "PM10") {
    einheit_Rot = " in µg/m³";
    graph_links = 8;
  }

  if (tutorial_Blau.name == "TVOC") {
    einheit_Blau = " in ppb";
    graph_rechts = 3;
  } else if (tutorial_Blau.name == "eCO") {
    einheit_Blau = " in ppm";
    graph_rechts = 4;
  } else if (tutorial_Blau.name == "Temperatur") {
    einheit_Blau = " in °C";
    graph_rechts = 0;
  } else if (tutorial_Blau.name == "rel. Luftfeuchte") {
    einheit_Blau = " in %";
    graph_rechts = 1;
  } else if (tutorial_Blau.name == "CO") {
    einheit_Blau = " in ppm";
    graph_rechts = 2;
  } else if (tutorial_Blau.name == "PM1") {
    einheit_Blau = " in µg/m³";
    graph_rechts = 5;
  } else if (tutorial_Blau.name == "PM2.5") {
    einheit_Blau = " in µg/m³";
    graph_rechts = 6;
  } else if (tutorial_Blau.name == "PM4") {
    einheit_Blau = " in µg/m³";
    graph_rechts = 7;
  } else if (tutorial_Blau.name == "PM10") {
    einheit_Blau = " in µg/m³";
    graph_rechts = 8;
  }
  tutorial_ueberspringen.show();
  fill(255, 0, 0);
  stroke(0);
  if (tutorial_Start) {
    fill(0, 255, 0);
  }
  ellipse(1075, 158, 20, 20);

  if (tutorial_resettet) {
    tutorial_weiter.show();
  }

  textSize(20);
  pushMatrix();
  translate(width/2, height/2);
  rotate(3*PI/2);
  textAlign(CENTER);
  fill(255, 0, 0);
  if (tutorial_Rot.name != "Links") {
    text(tutorial_Rot.name + " " + einheit_Rot, height/2 -380, -width/2 + 50);
    textSize(16);
    if (tutorial_Rot.name == "CO") {
      text("2", height/2 -400, -width/2 + 60);
    } else if (tutorial_Rot.name == "eCO") {
      text("2", height/2 -395, -width/2 + 60);
    }
    textSize(20);
  }
  popMatrix();
  pushMatrix();
  translate(width/2, height/2);
  rotate(PI/2);
  textAlign(CENTER);
  fill(0, 0, 255);
  if (tutorial_Blau.name != "Rechts") {
    text(tutorial_Blau.name + " " + einheit_Blau, -height/2 +380, width/2 - 990);
    textSize(16);
    if (tutorial_Blau.name == "CO") {
      text("2", -height/2 +360, width/2 - 980);
    } else if (tutorial_Blau.name == "eCO") {
      text("2", -height/2 +365, width/2 - 980);
    }
    textSize(20);
  }
  popMatrix();
  textSize(20);
  fill(0);
  text("Optionen", 1165, 120);


  if (tutorial_skalierung_rot_up.isClicked()) {
    skalierung_rot += 1;
    if (skalierung_rot == 5) {
      skalierung_rot = 0;
    }
  }
  if (tutorial_skalierung_rot_down.isClicked()) {
    skalierung_rot -= 1;
    if (skalierung_rot == -1) {
      skalierung_rot = 4;
    }
  }

  if (tutorial_skalierung_blau_up.isClicked()) {
    skalierung_blau += 1;
    if (skalierung_blau == 5) {
      skalierung_blau = 0;
    }
  }
  if (tutorial_skalierung_blau_down.isClicked()) {
    skalierung_blau -= 1;
    if (skalierung_blau == -1) {
      skalierung_blau = 4;
    }
  }

  if (graph_links != 999) {
    tutorial_graph(graph_links, color(255, 0, 0), skalierung_rot, false, true, 0, 0);
  }
  if (graph_rechts != 999) {
    tutorial_graph(graph_rechts, color(0, 0, 255), skalierung_blau, false, true, 0, 0);
  }
  text("0", 125, 600);

  tutorial_back.show();
  tutorial_Rot.show();
  tutorial_Blau.show();
  tutorial_Start_Stopp.show();
  tutorial_skalierung_rot_up.show();
  tutorial_skalierung_rot_down.show();
  tutorial_skalierung_blau_up.show();
  tutorial_skalierung_blau_down.show();
  tutorial_reset.show();
}







void Tutorial6() {
  stroke(0);
  fill(255);
  rect(0.5, 0.5, 1279, 99);
  rect(0.5, 620, 1278, 98.5);
  fill(0);
  textAlign(CENTER);
  textSize(21);
  fill(0);
  text("Jede Messgröße ist fehlerbehaftet, und es ist nicht immer sinnvoll Messwerte zu verbinden.\nAufgabe: Lasse die Messunsicherheit anzeigen!", 640, 40);
  textSize(16);
  text("Zeit in Sekunden", 540, 595);

  stroke(0);
  line(0, 100, 1280, 100);
  line(0, 620, 1280, 620);

  fill(220);
  rect(1050, 100, 229, 520);

  fill(255);
  rect(125, 175, 800, 400);
  String einheit_Rot = "";
  String einheit_Blau = "";
  int graph_links = 999;
  int graph_rechts = 999;

  if (tutorial_Rot.name == "TVOC") {
    einheit_Rot = " in ppb";
    graph_links = 3;
  } else if (tutorial_Rot.name == "eCO") {
    einheit_Rot = " in ppm";
    graph_links = 4;
  } else if (tutorial_Rot.name == "Temperatur") {
    einheit_Rot = " in °C";
    graph_links = 0;
  } else if (tutorial_Rot.name == "rel. Luftfeuchte") {
    einheit_Rot = " in %";
    graph_links = 1;
  } else if (tutorial_Rot.name == "CO") {
    einheit_Rot = " in ppm";
    graph_links = 2;
  } else if (tutorial_Rot.name == "PM1") {
    einheit_Rot = " in µg/m³";
    graph_links = 5;
  } else if (tutorial_Rot.name == "PM2.5") {
    einheit_Rot = " in µg/m³";
    graph_links = 6;
  } else if (tutorial_Rot.name == "PM4") {
    einheit_Rot = " in µg/m³";
    graph_links = 7;
  } else if (tutorial_Rot.name == "PM10") {
    einheit_Rot = " in µg/m³";
    graph_links = 8;
  }

  if (tutorial_Blau.name == "TVOC") {
    einheit_Blau = " in ppb";
    graph_rechts = 3;
  } else if (tutorial_Blau.name == "eCO") {
    einheit_Blau = " in ppm";
    graph_rechts = 4;
  } else if (tutorial_Blau.name == "Temperatur") {
    einheit_Blau = " in °C";
    graph_rechts = 0;
  } else if (tutorial_Blau.name == "rel. Luftfeuchte") {
    einheit_Blau = " in %";
    graph_rechts = 1;
  } else if (tutorial_Blau.name == "CO") {
    einheit_Blau = " in ppm";
    graph_rechts = 2;
  } else if (tutorial_Blau.name == "PM1") {
    einheit_Blau = " in µg/m³";
    graph_rechts = 5;
  } else if (tutorial_Blau.name == "PM2.5") {
    einheit_Blau = " in µg/m³";
    graph_rechts = 6;
  } else if (tutorial_Blau.name == "PM4") {
    einheit_Blau = " in µg/m³";
    graph_rechts = 7;
  } else if (tutorial_Blau.name == "PM10") {
    einheit_Blau = " in µg/m³";
    graph_rechts = 8;
  }
  tutorial_ueberspringen.show();
  fill(255, 0, 0);
  stroke(0);
  if (tutorial_Start) {
    fill(0, 255, 0);
  }
  ellipse(1075, 158, 20, 20);



  textSize(20);
  pushMatrix();
  translate(width/2, height/2);
  rotate(3*PI/2);
  textAlign(CENTER);
  fill(255, 0, 0);
  if (tutorial_Rot.name != "Links") {
    text(tutorial_Rot.name + " " + einheit_Rot, height/2 -380, -width/2 + 50);
    textSize(16);
    if (tutorial_Rot.name == "CO") {
      text("2", height/2 -400, -width/2 + 60);
    } else if (tutorial_Rot.name == "eCO") {
      text("2", height/2 -395, -width/2 + 60);
    }
    textSize(20);
  }
  popMatrix();
  pushMatrix();
  translate(width/2, height/2);
  rotate(PI/2);
  textAlign(CENTER);
  fill(0, 0, 255);
  if (tutorial_Blau.name != "Rechts") {
    text(tutorial_Blau.name + " " + einheit_Blau, -height/2 +380, width/2 - 990);
    textSize(16);
    if (tutorial_Blau.name == "CO") {
      text("2", -height/2 +360, width/2 - 980);
    } else if (tutorial_Blau.name == "eCO") {
      text("2", -height/2 +365, width/2 - 980);
    }
    textSize(20);
  }
  popMatrix();
  textSize(20);
  fill(0);
  text("Optionen", 1165, 120);
  textSize(15);
  fill(240);
  stroke(0);
  rect(1080, 235, 170, 70);
  fill(0);
  textSize(13);
  textAlign(CENTER);
  text("Messunsicherheit", 1145, 255);
  textSize(16);
  text("verbinden", 1145, 290);


  if (tutorial_skalierung_rot_up.isClicked()) {
    skalierung_rot += 1;
    if (skalierung_rot == 5) {
      skalierung_rot = 0;
    }
  }
  if (tutorial_skalierung_rot_down.isClicked()) {
    skalierung_rot -= 1;
    if (skalierung_rot == -1) {
      skalierung_rot = 4;
    }
  }

  if (tutorial_skalierung_blau_up.isClicked()) {
    skalierung_blau += 1;
    if (skalierung_blau == 5) {
      skalierung_blau = 0;
    }
  }
  if (tutorial_skalierung_blau_down.isClicked()) {
    skalierung_blau -= 1;
    if (skalierung_blau == -1) {
      skalierung_blau = 4;
    }
  }
  boolean error = false;
  boolean connect = false;
  if (fehler_tutorial.checked) {
    error = true;
  }
  if (verbinde_tutorial.checked) {
    connect = true;
  }

  if (graph_links != 999) {
    tutorial_graph(graph_links, color(255, 0, 0), skalierung_rot, error, connect, 0, 0);
  }
  if (graph_rechts != 999) {
    tutorial_graph(graph_rechts, color(0, 0, 255), skalierung_blau, error, connect, 0, 0);
  }

  text("0", 125, 600);

  if (fehler_tutorial.checked) {
    tutorial_weiter.show();
  }



  tutorial_back.show();
  tutorial_Rot.show();
  tutorial_Blau.show();
  tutorial_Start_Stopp.show();
  tutorial_skalierung_rot_up.show();
  tutorial_skalierung_rot_down.show();
  tutorial_skalierung_blau_up.show();
  tutorial_skalierung_blau_down.show();
  tutorial_reset.show();
  fehler_tutorial.show();
  verbinde_tutorial.show();
}


int tutorial_anzeige = 0;



void Tutorial7() {
  stroke(0);
  fill(255);
  rect(0.5, 0.5, 1279, 99);
  rect(0.5, 620, 1278, 98.5);
  fill(0);
  textAlign(CENTER);
  textSize(21);
  fill(0);
  text("Manchmal sind nicht alle Messwerte von Interesse, sondern nur die aktuellsten.\nAufgabe: Lasse die Messwerte der letzten 60 Sekunden anzeigen!", 640, 40);
  textSize(16);
  text("Zeit in Sekunden", 540, 595);

  stroke(0);
  line(0, 100, 1280, 100);
  line(0, 620, 1280, 620);

  fill(220);
  rect(1050, 100, 229, 520);

  fill(255);
  rect(125, 175, 800, 400);
  String einheit_Rot = "";
  String einheit_Blau = "";
  int graph_links = 999;
  int graph_rechts = 999;

  if (tutorial_Rot.name == "TVOC") {
    einheit_Rot = " in ppb";
    graph_links = 3;
  } else if (tutorial_Rot.name == "eCO") {
    einheit_Rot = " in ppm";
    graph_links = 4;
  } else if (tutorial_Rot.name == "Temperatur") {
    einheit_Rot = " in °C";
    graph_links = 0;
  } else if (tutorial_Rot.name == "rel. Luftfeuchte") {
    einheit_Rot = " in %";
    graph_links = 1;
  } else if (tutorial_Rot.name == "CO") {
    einheit_Rot = " in ppm";
    graph_links = 2;
  } else if (tutorial_Rot.name == "PM1") {
    einheit_Rot = " in µg/m³";
    graph_links = 5;
  } else if (tutorial_Rot.name == "PM2.5") {
    einheit_Rot = " in µg/m³";
    graph_links = 6;
  } else if (tutorial_Rot.name == "PM4") {
    einheit_Rot = " in µg/m³";
    graph_links = 7;
  } else if (tutorial_Rot.name == "PM10") {
    einheit_Rot = " in µg/m³";
    graph_links = 8;
  }

  if (tutorial_Blau.name == "TVOC") {
    einheit_Blau = " in ppb";
    graph_rechts = 3;
  } else if (tutorial_Blau.name == "eCO") {
    einheit_Blau = " in ppm";
    graph_rechts = 4;
  } else if (tutorial_Blau.name == "Temperatur") {
    einheit_Blau = " in °C";
    graph_rechts = 0;
  } else if (tutorial_Blau.name == "rel. Luftfeuchte") {
    einheit_Blau = " in %";
    graph_rechts = 1;
  } else if (tutorial_Blau.name == "CO") {
    einheit_Blau = " in ppm";
    graph_rechts = 2;
  } else if (tutorial_Blau.name == "PM1") {
    einheit_Blau = " in µg/m³";
    graph_rechts = 5;
  } else if (tutorial_Blau.name == "PM2.5") {
    einheit_Blau = " in µg/m³";
    graph_rechts = 6;
  } else if (tutorial_Blau.name == "PM4") {
    einheit_Blau = " in µg/m³";
    graph_rechts = 7;
  } else if (tutorial_Blau.name == "PM10") {
    einheit_Blau = " in µg/m³";
    graph_rechts = 8;
  }
  tutorial_ueberspringen.show();
  fill(255, 0, 0);
  stroke(0);
  if (tutorial_Start) {
    fill(0, 255, 0);
  }
  ellipse(1075, 158, 20, 20);



  textSize(20);
  pushMatrix();
  translate(width/2, height/2);
  rotate(3*PI/2);
  textAlign(CENTER);
  fill(255, 0, 0);
  if (tutorial_Rot.name != "Links") {
    text(tutorial_Rot.name + " " + einheit_Rot, height/2 -380, -width/2 + 50);
    textSize(16);
    if (tutorial_Rot.name == "CO") {
      text("2", height/2 -400, -width/2 + 60);
    } else if (tutorial_Rot.name == "eCO") {
      text("2", height/2 -395, -width/2 + 60);
    }
    textSize(20);
  }
  popMatrix();
  pushMatrix();
  translate(width/2, height/2);
  rotate(PI/2);
  textAlign(CENTER);
  fill(0, 0, 255);
  if (tutorial_Blau.name != "Rechts") {
    text(tutorial_Blau.name + " " + einheit_Blau, -height/2 +380, width/2 - 990);
    textSize(16);
    if (tutorial_Blau.name == "CO") {
      text("2", -height/2 +360, width/2 - 980);
    } else if (tutorial_Blau.name == "eCO") {
      text("2", -height/2 +365, width/2 - 980);
    }
    textSize(20);
  }
  popMatrix();
  textSize(20);
  fill(0);
  text("Optionen", 1165, 120);
  textSize(15);
  fill(240);
  stroke(0);
  rect(1080, 235, 170, 70);
  rect(1080, 315, 170, 150);
  fill(0);
  textSize(13);
  textAlign(CENTER);
  text("Messunsicherheit", 1145, 255);
  textSize(16);
  text("verbinden", 1145, 290);
  textSize(18);
  text("Anzeige\nMesswerte", 1163, 335);
  String txt = "";
  if (tutorial_anzeige == 0) {
    txt = "Zeige alle\nMesswerte";
  } else if (tutorial_anzeige == 1) {
    txt = "Zeige letzte\n60 Sekunden";
    tutorial_weiter.show();
  } else if (tutorial_anzeige == 2) {
    txt = "Zeige letzte\n180 Sekunden";
  } else if (tutorial_anzeige == 3) {
    txt = "Zeige letzte\n360 Sekunden";
  } else if (tutorial_anzeige == 4) {
    txt = "Zeige letzte\n720 Sekunden";
  }
  textAlign(CENTER);
  textSize(18);
  text(txt, 1163, 430);

  if (tutorial_skalierung_rot_up.isClicked()) {
    skalierung_rot += 1;
    if (skalierung_rot == 5) {
      skalierung_rot = 0;
    }
  }
  if (tutorial_skalierung_rot_down.isClicked()) {
    skalierung_rot -= 1;
    if (skalierung_rot == -1) {
      skalierung_rot = 4;
    }
  }

  if (tutorial_skalierung_blau_up.isClicked()) {
    skalierung_blau += 1;
    if (skalierung_blau == 5) {
      skalierung_blau = 0;
    }
  }
  if (tutorial_skalierung_blau_down.isClicked()) {
    skalierung_blau -= 1;
    if (skalierung_blau == -1) {
      skalierung_blau = 4;
    }
  }
  boolean error = false;
  boolean connect = false;
  if (fehler_tutorial.checked) {
    error = true;
  }
  if (verbinde_tutorial.checked) {
    connect = true;
  }


  if (left_tutorial.isClicked()) {
    tutorial_anzeige -= 1;
    if (tutorial_anzeige <= -1) {
      tutorial_anzeige = 4;
    }
  }
  if (right_tutorial.isClicked()) {
    tutorial_anzeige += 1;
    if (tutorial_anzeige >= 5) {
      tutorial_anzeige = 0;
    }
  }




  if (graph_links != 999) {
    tutorial_graph(graph_links, color(255, 0, 0), skalierung_rot, error, connect, tutorial_anzeige, 0);
  }
  if (graph_rechts != 999) {
    tutorial_graph(graph_rechts, color(0, 0, 255), skalierung_blau, error, connect, tutorial_anzeige, 0);
  }

  text("0", 125, 600);

  tutorial_back.show();
  tutorial_Rot.show();
  tutorial_Blau.show();
  tutorial_Start_Stopp.show();
  tutorial_skalierung_rot_up.show();
  tutorial_skalierung_rot_down.show();
  tutorial_skalierung_blau_up.show();
  tutorial_skalierung_blau_down.show();
  tutorial_reset.show();
  fehler_tutorial.show();
  verbinde_tutorial.show();
  left_tutorial.show();
  right_tutorial.show();
}






int intervall = 0;
void Tutorial8() {
  stroke(0);
  fill(255);
  rect(0.5, 0.5, 1279, 99);
  rect(0.5, 620, 1278, 98.5);
  fill(0);

  textAlign(CENTER);
  textSize(21);
  fill(0);
  text("Zum Schluss kannst du noch das Messintervall, also den Abstand zwischen zwei Messwerten, variieren.\nAufgabe: Stelle ein Messintervall von 5 Sekunden ein!", 640, 40);
  textSize(16);
  text("Zeit in Sekunden", 540, 595);

  stroke(0);
  line(0, 100, 1280, 100);
  line(0, 620, 1280, 620);

  fill(220);
  rect(1050, 100, 229, 520);

  fill(255);
  rect(125, 175, 800, 400);
  String einheit_Rot = "";
  String einheit_Blau = "";
  int graph_links = 999;
  int graph_rechts = 999;

  if (tutorial_Rot.name == "TVOC") {
    einheit_Rot = " in ppb";
    graph_links = 3;
  } else if (tutorial_Rot.name == "eCO") {
    einheit_Rot = " in ppm";
    graph_links = 4;
  } else if (tutorial_Rot.name == "Temperatur") {
    einheit_Rot = " in °C";
    graph_links = 0;
  } else if (tutorial_Rot.name == "rel. Luftfeuchte") {
    einheit_Rot = " in %";
    graph_links = 1;
  } else if (tutorial_Rot.name == "CO") {
    einheit_Rot = " in ppm";
    graph_links = 2;
  } else if (tutorial_Rot.name == "PM1") {
    einheit_Rot = " in µg/m³";
    graph_links = 5;
  } else if (tutorial_Rot.name == "PM2.5") {
    einheit_Rot = " in µg/m³";
    graph_links = 6;
  } else if (tutorial_Rot.name == "PM4") {
    einheit_Rot = " in µg/m³";
    graph_links = 7;
  } else if (tutorial_Rot.name == "PM10") {
    einheit_Rot = " in µg/m³";
    graph_links = 8;
  }

  if (tutorial_Blau.name == "TVOC") {
    einheit_Blau = " in ppb";
    graph_rechts = 3;
  } else if (tutorial_Blau.name == "eCO") {
    einheit_Blau = " in ppm";
    graph_rechts = 4;
  } else if (tutorial_Blau.name == "Temperatur") {
    einheit_Blau = " in °C";
    graph_rechts = 0;
  } else if (tutorial_Blau.name == "rel. Luftfeuchte") {
    einheit_Blau = " in %";
    graph_rechts = 1;
  } else if (tutorial_Blau.name == "CO") {
    einheit_Blau = " in ppm";
    graph_rechts = 2;
  } else if (tutorial_Blau.name == "PM1") {
    einheit_Blau = " in µg/m³";
    graph_rechts = 5;
  } else if (tutorial_Blau.name == "PM2.5") {
    einheit_Blau = " in µg/m³";
    graph_rechts = 6;
  } else if (tutorial_Blau.name == "PM4") {
    einheit_Blau = " in µg/m³";
    graph_rechts = 7;
  } else if (tutorial_Blau.name == "PM10") {
    einheit_Blau = " in µg/m³";
    graph_rechts = 8;
  }
  tutorial_ueberspringen.show();
  fill(255, 0, 0);
  stroke(0);
  if (tutorial_Start) {
    fill(0, 255, 0);
  }
  ellipse(1075, 158, 20, 20);



  textSize(20);
  pushMatrix();
  translate(width/2, height/2);
  rotate(3*PI/2);
  textAlign(CENTER);
  fill(255, 0, 0);
  if (tutorial_Rot.name != "Links") {
    text(tutorial_Rot.name + " " + einheit_Rot, height/2 -380, -width/2 + 50);
    textSize(16);
    if (tutorial_Rot.name == "CO") {
      text("2", height/2 -400, -width/2 + 60);
    } else if (tutorial_Rot.name == "eCO") {
      text("2", height/2 -395, -width/2 + 60);
    }
    textSize(20);
  }
  popMatrix();
  pushMatrix();
  translate(width/2, height/2);
  rotate(PI/2);
  textAlign(CENTER);
  fill(0, 0, 255);
  if (tutorial_Blau.name != "Rechts") {
    text(tutorial_Blau.name + " " + einheit_Blau, -height/2 +380, width/2 - 990);
    textSize(16);
    if (tutorial_Blau.name == "CO") {
      text("2", -height/2 +360, width/2 - 980);
    } else if (tutorial_Blau.name == "eCO") {
      text("2", -height/2 +365, width/2 - 980);
    }
    textSize(20);
  }
  popMatrix();
  textSize(20);
  fill(0);
  text("Optionen", 1165, 120);
  textSize(15);
  fill(240);
  stroke(0);
  rect(1080, 235, 170, 70);
  rect(1080, 315, 170, 150);
  rect(1080, 475, 170, 130);
  fill(0);
  textSize(13);
  textAlign(CENTER);
  text("Messunsicherheit", 1145, 255);
  textSize(16);
  text("verbinden", 1145, 290);
  textSize(18);
  text("Anzeige\nMesswerte", 1163, 335);
  text("Messintervall", 1163, 500);
  String txt = "";
  if (tutorial_anzeige == 0) {
    txt = "Zeige alle\nMesswerte";
  } else if (tutorial_anzeige == 1) {
    txt = "Zeige letzte\n60 Sekunden";
  } else if (tutorial_anzeige == 2) {
    txt = "Zeige letzte\n180 Sekunden";
  } else if (tutorial_anzeige == 3) {
    txt = "Zeige letzte\n360 Sekunden";
  } else if (tutorial_anzeige == 4) {
    txt = "Zeige letzte\n720 Sekunden";
  }
  textAlign(CENTER);
  textSize(18);
  text(txt, 1163, 430);

  if (aktualisierung_right_tutorial.isClicked()) {
    intervall += 1;
    if (intervall == 4) {
      intervall = 0;
    }
  }
  if (aktualisierung_left_tutorial.isClicked()) {
    intervall -= 1;
    if (intervall == -1) {
      intervall = 3;
    }
  }
  String txt2 = "";
  if (intervall == 0) {
    txt2 = "1 Sekunde";
  } else if (intervall == 1) {
    txt2 = "2 Sekunden";
  } else if (intervall == 2) {
    txt2 = "5 Sekunden";
    tutorial_weiter.show();
  } else if (intervall == 3) {
    txt2 = "10 Sekunden";
  } 
  textSize(18);
  textAlign(CENTER);
  text(txt2, 1163, 580);

  if (tutorial_skalierung_rot_up.isClicked()) {
    skalierung_rot += 1;
    if (skalierung_rot == 5) {
      skalierung_rot = 0;
    }
  }

  if (tutorial_skalierung_rot_down.isClicked()) {
    skalierung_rot -= 1;
    if (skalierung_rot == -1) {
      skalierung_rot = 4;
    }
  }

  if (tutorial_skalierung_blau_up.isClicked()) {
    skalierung_blau += 1;
    if (skalierung_blau == 5) {
      skalierung_blau = 0;
    }
  }
  if (tutorial_skalierung_blau_down.isClicked()) {
    skalierung_blau -= 1;
    if (skalierung_blau == -1) {
      skalierung_blau = 4;
    }
  }





  boolean error = false;
  boolean connect = false;
  if (fehler_tutorial.checked) {
    error = true;
  }
  if (verbinde_tutorial.checked) {
    connect = true;
  }


  if (left_tutorial.isClicked()) {
    tutorial_anzeige -= 1;
    if (tutorial_anzeige <= -1) {
      tutorial_anzeige = 4;
    }
  }
  if (right_tutorial.isClicked()) {
    tutorial_anzeige += 1;
    if (tutorial_anzeige >= 5) {
      tutorial_anzeige = 0;
    }
  }




  if (graph_links != 999) {
    tutorial_graph(graph_links, color(255, 0, 0), skalierung_rot, error, connect, tutorial_anzeige, intervall);
  }
  if (graph_rechts != 999) {
    tutorial_graph(graph_rechts, color(0, 0, 255), skalierung_blau, error, connect, tutorial_anzeige, intervall);
  }

  text("0", 125, 600);

  tutorial_back.show();
  tutorial_Rot.show();
  tutorial_Blau.show();
  tutorial_Start_Stopp.show();
  tutorial_skalierung_rot_up.show();
  tutorial_skalierung_rot_down.show();
  tutorial_skalierung_blau_up.show();
  tutorial_skalierung_blau_down.show();
  tutorial_reset.show();
  fehler_tutorial.show();
  verbinde_tutorial.show();
  left_tutorial.show();
  right_tutorial.show();
  aktualisierung_right_tutorial.show();
  aktualisierung_left_tutorial.show();
}



void Tutorial9() {
  stroke(0);
  fill(255);
  rect(0.5, 0.5, 1279, 99);
  rect(0.5, 620, 1278, 98.5);
  textAlign(CENTER);
  textSize(30);
  fill(0);
  text("Tutorial erfolgreich beendet!", 640, 50); 
  textSize(24);
  text("Du hast damit das Tutorial abgeschlossen. Klicke auf 'weiter', um in das Hauptmenü zu gelangen.", 640, 300);
  tutorial_weiter.show();
  tutorial_back.show();
  back.visible = false;
}




int index_tutorial2 = 0;
float time_tutorial = 0;

void tutorial_graph(int index, color c, int scale, boolean error, boolean connect, int anzeige, int intervall) {

  println(scale);
  float max = 0;
  float min = 9999;
  float error_val = 0;

  float factor = 1000;

  if (intervall == 0) {
    factor = 1000;
  } else if (intervall == 1) {
    factor = 2000;
  } else if (intervall == 2) {
    factor = 5000;
  } else if (intervall == 3) {
    factor = 10000;
  } 

  int anzahl_werte = 0;
  if (anzeige == 0) {
    anzahl_werte = index_tutorial;
  } else if (anzeige == 1) {
    anzahl_werte = 60;
  } else if (anzeige == 2) {
    anzahl_werte = 180;
  } else if (anzeige == 3) {
    anzahl_werte = 360;
  } else if (anzeige == 4) {
    anzahl_werte = 720;
  }



  if (tutorial_Start_first_time && tutorial_Start) {
    index_tutorial = floor((millis() - start_time_tutorial)/factor);
  }
// ArrayIndexOutOfBoundsException: -1

  if (!tutorial_Start && tutorial_Start_first_time) {
    for (int i = 0; i < 9; i++) {
      for (int j = index_tutorial; j < floor((millis() - start_time_tutorial)/factor); j++) {
        tutorial_data[i][j] = tutorial_data[i][j-1];
      }
    }
  }


  if (index_tutorial == 1000) {
    start_time_tutorial = millis();
    index_tutorial = 0;
  }
  int temp = index_tutorial - anzahl_werte;
  if (temp <= 1) {
    temp = 1;
  }
  if (scale == 0) {
    for (int i = temp; i < index_tutorial + 1; i++) {
      if ( tutorial_data[index][i] > max) {
        max =  tutorial_data[index][i];
      }
      if (tutorial_data[index][i] < min) {
        min = tutorial_data[index][i] ;
      }
    }
  }
  if (scale != 0) {
    min = 0;
    for (int i = 1; i< 5; i++) {
      stroke(200);
      line(125, 175 + 80*i, 925, 175 + 80*i);
    }
  }
  for (int i = 0; i < 5; i++) {
    if (scale == i) {
      if (index == 0) { //Temperatur
        max = 20 + 5*i;
      }
      if (index == 1) { //Luftfeuchte
        max = 25 + 25*i;
        if(max == 125){
         max = 100; 
        }
      }
      if (index == 2) { //CO2
        max = 500 + 500*i;
      }
      if (index == 3) { //TVOC
        max = 50 + 50*i;
      }
      if (index == 4) { //eCO2
        max = 500 + 50*i;
      }
      if (index > 4 && index < 9) { //PM1
        max = 25 + 25*i;
      }
    }
  }

  //0: Temperatur
  //1: Luftfeuchte
  //2: CO2
  //3: TVOC
  //4: eCO2
  //5-8: PM

  strokeWeight(1);
  float x_abstand;
  if (anzahl_werte > 0) {
    x_abstand = 800/(tutorial_data[9][anzahl_werte-1] - tutorial_data[9][0]);
  } else {
    x_abstand = 1;
  }



  boolean erstegezeichnet = false;
  boolean erstegezeichnet2 = false;



  for (int i = temp+1; i < index_tutorial + 1; i++) {
    if (error) {
      if (index == 0) {
        error_val = 0.5;
      } else if (index == 1) {
        error_val = 2;
      } else if (index == 2) {
        error_val = 30 + 0.03*tutorial_data[index][i];
      } else if (index == 3) {
        error_val = 0.15*tutorial_data[index][i];
      } else if (index == 4) {
        error_val = 0.1*tutorial_data[index][i];
      } else {
        if (tutorial_data[index][i] < 100) {
          error_val = 10;
        } else {
          error_val = 0.1*tutorial_data[index][i];
        }
      }
    }
    float x1 = 125 + factor*800*(tutorial_data[9][i-1] - tutorial_data[9][temp])/(1000*(anzahl_werte-1));
    float x2 = 125 + factor*800*(tutorial_data[9][i] - tutorial_data[9][temp])/(1000*(anzahl_werte-1));
    float y1 = 575 - 400*(tutorial_data[index][i-1] - min)/(max - min);
    float y2 = 575 - 400*(tutorial_data[index][i] - min)/(max - min);
    stroke(c);

    if (error) {
      float e1 = 575 - 400*(tutorial_data[index][i] - error_val - min)/(max - min);
      float e2 = 575 - 400*(tutorial_data[index][i] + error_val - min)/(max - min);
      if (e1 < 175) {
        e1 = 175;
      }
      if (e1 > 575) {
        e1 = 575;
      }
      if (e2 < 175) {
        e2 = 175;
      }
      if (e2 > 575) {
        e2 = 575;
      }
      if (!erstegezeichnet2) {
        float e11 = 575 - 400*(tutorial_data[index][i-1] - error_val - min)/(max - min);
        float e21 = 575 - 400*(tutorial_data[index][i-1] + error_val - min)/(max - min);
        if (e11 < 175) {
          e11 = 175;
        }
        if (e11 > 575) {
          e11 = 575;
        }
        if (e21 < 175) {
          e21 = 175;
        }
        if (e21 > 575) {
          e21 = 575;
        }
        if (x2 <= 925 && y1 >= 175 && y2 > 175 && y1 <= 575 && y2 <= 575) {
          line(x1, e11, x1, e21);
          line(x1-2, e11, x1+2, e11);
          line(x1-2, e21, x1+2, e21);
        }
        erstegezeichnet2 = true;
      }

      if (x2 <= 925 && y1 >= 175 && y2 > 175 && y1 <= 575 && y2 <= 575) {
        line(x2, e1, x2, e2);
        line(x2-2, e1, x2+2, e1);
        line(x2-2, e2, x2+2, e2);
      }
    }

    if (connect) {
      if (x2 <= 925 && y1 >= 175 && y2 > 175 && y1 <= 575 && y2 <= 575) {
        line(x1, y1, x2, y2);
      }
    } else {
      if (!erstegezeichnet) {
        if (x2 <= 925 && y1 >= 175 && y2 > 175 && y1 <= 575 && y2 <= 575) {
          line(x1-3, y1, x1 + 3, y1);
          line(x1, y1-3, x1, y1 + 3);
          erstegezeichnet = true;
        }
      }
      if (x2 <= 925 && y1 >= 175 && y2 > 175 && y1 <= 575 && y2 <= 575) {
        line(x2-3, y2, x2 + 3, y2);
        line(x2, y2-3, x2, y2 + 3);
      }
    }
  }
  fill(c);
  textSize(17);
  if (min != 9999) {
    if (c == color(255, 0, 0)) {
      text(nf(max, 0, 1), 90, 175);
      text(nf(min, 0, 1), 90, 580);
    } else if ( c == color(0, 0, 255)) {
      text(nf(max, 0, 1), 970, 175);
      text(nf(min, 0, 1), 970, 580);
    }
  }
  fill(0);
  text(round(tutorial_data[9][anzahl_werte]), 925, 600);
}


void resetTutorial() {
  tutorial_Rot.name = "Links";
  tutorial_Blau.name = "Rechts";
  tutorial_Start = false;
  start_time_tutorial = millis();
  reset_bool_tutorial = false;
  //  tutorial_resettet = true;
  skalierung_rot = 0;
  skalierung_blau = 0;
  fehler_tutorial.checked = false;
  verbinde_tutorial.checked = true;
  tutorial_Start_first_time = false;
  index_tutorial = 0;

  for (int j = 0; j < 1000; j++) {
    tutorial_data[0][j] = 20 + noise(0.1*j + 123);
    tutorial_data[1][j] = 50 + 5*noise(0.1*j+ 234);
    tutorial_data[2][j] = 450 + 100*noise(0.1*j+ 345);
    tutorial_data[3][j] = 30 + 20*noise(0.1*j+ 456);
    tutorial_data[4][j] = 450 + 100*noise(0.1*j+ 2344);
    tutorial_data[5][j] = 30 + 5*noise(0.01*j+ 3412);
    tutorial_data[6][j] =  tutorial_data[5][j] + 1*noise(0.1*j+ 1231);
    tutorial_data[7][j] =  tutorial_data[6][j] + 2*noise(0.1*j+ 1);
    tutorial_data[8][j] =  tutorial_data[7][j] + 3*noise(0.1*j+ 3);
    tutorial_data[9][j] =  1*j;
  }
}

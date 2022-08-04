float page = -1;

/*
Software zur Aufnahme von Sensordaten und Durchführung verschiedener Messstationen im Rahmen des DBU-Projekts "SUSmobil: Modul 3 - Umweltmesstechnik".
 Um die Software zu verwenden muss der beiliegende Arduino Code auf den Mikrocontroller geladen werden.
 */

// Dieses Programm nutzt die beiden Bibliotheken "processing.serial." (Herstellung einer seriellen Verbindung).
import processing.serial.*;
Serial myPort;

//import controlP5.*;


PImage[] fan = new PImage[8];
PImage fan_aus;
//

dropdown Aufloesung, Alle_Sensoren_Rot, Alle_Sensoren_Blau, SPS_Rot_Station1, SPS_Blau_Station1, SPS_Rot_Station1_Auswertung, SPS_Blau_Station1_Auswertung, SPS_Gruen_Station1_Auswertung, Station4_Rot, Station4_Blau, Station4_Auswertung_Rot, Station4_Auswertung_Blau;
dropdown dateiformat, autosave, connect, error_bars, freie_stationen, strichdicke;
checkbox verbinde, fehler, verbinde_tutorial, fehler_tutorial, fehler_innenraum, verbinde_innenraum;

Aufgabentext Station1_Aufgabentext, TVOC_Duelle_uebertragen;
Aufgabentext Station2_Aufgabentext_a, Station2_Aufgabentext_a2, Station2_Aufgabentext_b1, Station2_Aufgabentext_b2, Station2_Aufgabentext_b3, Station2_Aufgabentext_b4, Station2_Aufgabentext_b5, Station2_Aufgabentext_c;
Aufgabentext Station3_Aufgabentext_a1, Station3_Aufgabentext_a2, Station3_Aufgabentext_b1;
Aufgabentext Station4_Aufgabentext_a, Station4_Aufgabentext_a2, Station4_Aufgabentext_b, Station4_Aufgabentext_c;
Aufgabentext TVOC_Duelle_Analyse, Duell_Aufgabentext;


dropdown tutorial_Rot, tutorial_Blau;
checkbox skalierung_angleichen;

String[] myText = {"", "", "", "", ""};
String[] myText2 = {"", "", "", "", ""};
String[] myText_Sorted = {"", "", "", "", ""};
String[] myText2_Sorted = {"", "", "", "", ""};


String Kalibrierung_Station2_2 = "1";
String Kalibrierung_Station3 = "480";
Textfield a, b, c, d, e;
Textfield a2, b2, c2, d2, e2;

Textfield22 Kalibrierung2_2; 
Textfield22 Zeit_Station3; 

String[] Aufloesung_Strings = {"Niedrig (800x450)", "Mittel (1024x600)", "Standard (1280x720)", "Hoch (1440x810)", "Fullscreen", "frei"};
//String[] Alle_Sensoren_Strings = {"", "TVOC", "eCO2", "Temperatur", "Luftfeuchte", "CO2", "PM1", "PM2.5", "PM4", "PM10"};
String[] Alle_Sensoren_Strings = {"", "TVOC", "Temperatur", "rel. Luftfeuchte", "CO2", "PM1", "PM2.5", "PM4", "PM10"};
String[] strichdicke_Strings = {"1 (dünn)", "2 (Standard)", "3 (dick)"};

String[] SPS_Strings_Station1 = {"", "PM2.5", "PM10"};
String[] SPS_Strings_Station1_Auswertung = {"", "PM2.5 (Referenz)", "PM10 (Referenz)", "PM2.5 (trocken)", "PM10 (trocken)", "PM2.5 (nass)", "PM10 (nass)"};
//String[] Station4_Strings = {"", "Temperatur", "Luftfeuchte", "CO2", "TVOC", "eCO2"};
String[] Station4_Strings = {"", "Temperatur", "rel. Luftfeuchte", "CO2", "TVOC"};

//String[] Station4_Auswertung_Strings = {"Zeit", "Temperatur", "Luftfeuchte", "CO2", "TVOC", "eCO2"};
//String[] Station4_Auswertung_Strings2 = {"Temperatur", "Luftfeuchte", "CO2", "TVOC", "eCO2"};

String[] Station4_Auswertung_Strings = {"Zeit", "Temperatur", "rel. Luftfeuchte", "CO2", "TVOC"};
String[] Station4_Auswertung_Strings2 = {"Temperatur", "rel. Luftfeuchte", "CO2", "TVOC"};
String[] dateiformat_Strings = {"Format: .csv", "Format: .txt"};
String[] autosave_Strings = {"nicht speichern", "speichern bei 'zurück'", "autosave (jede Minute)", "autosave (jede Stunde)", "autosave (jeden Tag)"};
String[] connect_Strings = {"verbinden", "nicht verbinden"};
String[] error_bars_Strings = {"anzeigen", "nicht anzeigen"};
String[] freie_stationen_Strings = {"nicht freigeben", "freigeben"};

//String[] tutorial_Rot_Strings = {"", "TVOC", "eCO2", "Temperatur", "Luftfeuchte", "CO2", "PM1", "PM2.5", "PM4", "PM10"};
//String[] tutorial_Blau_Strings = {"", "TVOC", "eCO2", "Temperatur", "Luftfeuchte", "CO2", "PM1", "PM2.5", "PM4", "PM10"};
String[] tutorial_Rot_Strings = {"", "TVOC", "Temperatur", "rel. Luftfeuchte", "CO2", "PM1", "PM2.5", "PM4", "PM10"};
String[] tutorial_Blau_Strings = {"", "TVOC", "Temperatur", "rel. Luftfeuchte", "CO2", "PM1", "PM2.5", "PM4", "PM10"};
//Logos und Hintergrundbilder
PImage sps, sgp, scd, nodemcu, DBU, SUSmobil;
PImage Vorschau_Station1, Vorschau_Station2, Vorschau_Station2a, Vorschau_Station2b, Vorschau_Station3, Vorschau_Station4;
PImage Versuchsaufbau_Feinstaub, Versuchsaufbau_Feinstaub2;
// Bilder der zu messenden Stoffe für Station 3 - TVOC-Duelle
PImage Stoff1_bild, Stoff2_bild, Stoff3_bild, Stoff4_bild, Stoff5_bild, Stoff6_bild, Stoff7_bild, Stoff8_bild;
PImage nasserSchwamm, trockenerSchwamm, Aufbau_Feinstaub_Vorschau;

// Tabelle, in der Messdaten gespeichert werden
Table table;

PImage Feinstaub_Oeffnung, Feinstaub_Einfaedeln1, Feinstaub_Einfaedeln2;



button one, two, two_a, two_b, three, four;

button TVOC_analyse;

// Buttons der Stationen
//station one, two_three, two, three, four, settings;

// Buttons zur Steuerung der Skalierung des Graphen (up, down) und 
button back, up1, down1, up2, down2, left1, right1, start_stopp, x_up, x_down, y_up, y_down, up_Feinstaub1, down_Feinstaub1, up_Feinstaub2, down_Feinstaub2;
button reset, sicher_ja, sicher_nein;
button aktualisierung_right, aktualisierung_left;
button Stationen, Sensoren, zumObermenu;
button SPS30, SGP30, SCD30, alle_Sensoren, alle_Sensoren2;
button einstellungen;
button Port1, Port2, Port3, Port4, Port5, Port6;
button station1_referenz, station1_trocken, station1_nass, station1_MessungStarten, station1_MessungWiederholen, station1_weiter_ab, station1_weiter_bc, station1_zur_Auswertung;
button TVOC_Duelle_Start, naechstes_Duell, vorheriges_Duell, weiter_zum_Sensor, naechster_Stoff, vorheriger_Stoff, zur_Auswertung, zur_Auswertung2, zur_Auswertung3;
button Sensormessung, messen, letzteWiederholen, ja_zufrieden, reset_Station2;
button reset_innenraum;
button Station4a, Station4b, Station4c, Station4Auswertung, Station4Start, station4_MessungWiederholen, zero, fifty, hundred, genaueAnalyse, up2_Station4, down2_Station4;

button auswertung_Geruchstest;

button Feinstaub_weiter, zurAuswertung_Feinstaub;
button Geruchstest;

button tutorial_ueberspringen, tutorial_weiter, tutorial_zum, tutorial_back, tutorial_Start_Stopp;
button tutorial_skalierung_rot_up, tutorial_skalierung_rot_down, tutorial_skalierung_blau_up, tutorial_skalierung_blau_down;
button tutorial_reset, sicher_ja_reset, sicher_nein_reset, left_tutorial, right_tutorial, aktualisierung_right_tutorial, aktualisierung_left_tutorial;

button setBaseline;
button zumObermenu2;
button Station2_Riechen2, A_wiederholen, B_wiederholen, C_wiederholen, D_wiederholen, E_wiederholen;
button abbruch_Station2;
button Temperatur_Doppfelpfeil_down1, Temperatur_Doppfelpfeil_up1, Temperatur_Doppfelpfeil_down2, Temperatur_Doppfelpfeil_up2;

button Duell1, Duell2, Duell3, Duell4;

Probe A, B, C, D, E;
Probe A2, B2, C2, D2, E2;
TVOC_Kandidat Stoff1, Stoff2, Stoff3, Stoff4, Stoff5, Stoff6, Stoff7, Stoff8, Stoff9, Stoff10;

button Station2_Werte_konstant;

slider s, sFeinstaub;
slider_MS slider_Mensch_Sensor;
PFont bold, normal, bold1, bold2, bold3;

boolean measure = true;
boolean tutorial_Start = false;
boolean tutorial_Start_first_time = false;
boolean tutorial_resettet = false;


boolean gotSerial = false;
float zeroTime2 = 0;
float zeroTime3 = 0; //Feinstaubzeit
float zeroTime4 = 0;
float zeroTime5 = 0;

float time_Station4 = 480;

int anzahlCOMPorts = 0;
int ausgewaehlterPort = 0;


boolean MenschSensorAbgeschlossen = false;


PImage Board, KreideA, KreideB, Tafel, Schwaemme;
PImage Eco_Boden, Eco_Edding, Eco_Kleber, Kork, Sekundenkleber, Edding, Stinkelack, Eco_Lack;
PImage blauer_engel;
PImage aetzend, entzuendlich, gesundheitsschaedlich, giftig, reizend, umweltschaedlich;
PImage Aufbau_Feinstaub;
PImage alle_Logos;

// Das Programm ist in Seiten unterteilt

// -7: Tutorial
// -7.1: Tutorial
// -1: Hauptmenü
// -2: Sensoren - Auswahl


// -3: Sensoren - Feinstaub
// -4: Sensoren - TVOC, eCO2
// -5: Sensoren - Temperatur, Luftfeuchte, CO2


// -5: Sensoren - Messwert gegen Messwert
// -6: Sensoren - Messwert gegen Zeit


// 0: Stationen - Auswahl
// 1: Stationen - Station 1 Hauptmenü
// 1.1: Stationen - Station 1 - Aufgabe a)
// 1.11: Stationen - Station 1 - Aufgabe b)
// 1.111: Stationen - Station 1 - Aufgabe c)
// 1.1111: Stationen - Station 1 - Aufgabenstellung
// 1.11111: Stationen - Station 1 - Auswertung

// 2.5: Stationen - Station 2/3

// 2: Stationen - Station 2 - Aufgabenstellung + menschliche Messung
// 2.1: Stationen - Station 2 - Sensormessung
// 2.2: Stationen - Station 2 - Vergleich Sensor - Mensch

// 3: Stationen - Station 3 - Aufgabenstellung
// 3.1: Stationen - Station 3 - Aufgabe a): Riechen
// 3.11: Stationen - Station 3 - Aufgabe b): Sensormessung
// 3.111: Stationen - Station 3 - Vergleich Mensch - Sensor


// 4: Stationen - Station 4 - Aufgabenstellung
// 4.1: Stationen - Station 4 - Aufgabe a)
// 4.11: Stationen - Station 4 - Aufgabe b)
// 4.111: Stationen - Station 4 - Aufgabe c)
// 4.1111: Stationen - Station 4 - Vergleich

// 10: Einstellungen


void setup() {
  size(1280, 720);
  PImage icon = loadImage("img/SUSmobil.png");
  alle_Logos = loadImage("img/Alle_Logos.png");
  Vorschau_Station1 = loadImage("img/Vorschau_Station1.png");
  Vorschau_Station2 = loadImage("img/Vorschau_Station2.png");
  Vorschau_Station2a = loadImage("img/Vorschau_Station2a.png");
  Vorschau_Station2b = loadImage("img/Vorschau_Station2b.png");
  Vorschau_Station3 = loadImage("img/MenschInMesskammer.png");
  Vorschau_Station4 = loadImage("img/Vorschau_Station4.png");
  Versuchsaufbau_Feinstaub = loadImage("img/Versuchsaufbau_Feinstaub.png");
  Versuchsaufbau_Feinstaub2 = loadImage("img/Versuchsaufbau_Feinstaub2.png");


  Eco_Boden = loadImage("img/Eco_Boden.png");
  Eco_Edding = loadImage("img/Eco_Edding.png");
  Eco_Kleber = loadImage("img/Eco_Kleber.png");
  Kork = loadImage("img/Kork.png"); 
  Sekundenkleber = loadImage("img/Sekundenkleber.png");
  Edding = loadImage("img/Edding.png"); 
  Stinkelack = loadImage("img/Stinkelack.png");
  Eco_Lack = loadImage("img/Eco_Lack.png");

  Board= loadImage("img/Board.png");
  KreideA= loadImage("img/KreideA.png");
  KreideB= loadImage("img/KreideB.png");
  Tafel= loadImage("img/Tafel.png");
  Schwaemme = loadImage("img/Schwaemme.png");

  Aufbau_Feinstaub = loadImage("img/Aufbau_Feinstaub.png");
  nasserSchwamm =  loadImage("img/Schwamm_nass.png");
  trockenerSchwamm = loadImage("img/Schwamm_trocken.png");
  Aufbau_Feinstaub_Vorschau = loadImage("img/Aufbau_Feinstaub_Vorschau.png");

  aetzend = loadImage("img/ätzend.png");
  entzuendlich = loadImage("img/entzündlich.png");
  gesundheitsschaedlich = loadImage("img/gesundheitsschädlich.png");
  giftig = loadImage("img/giftig.png");
  reizend = loadImage("img/reizend.png");
  umweltschaedlich  = loadImage("img/umweltschädlich.png");

  Feinstaub_Oeffnung = loadImage("img/Feinstaub_Oeffnung.png");
  Feinstaub_Einfaedeln1 = loadImage("img/Feinstaub_Einfaedeln1.png");
  Feinstaub_Einfaedeln2 = loadImage("img/Feinstaub_Einfaedeln2.png");




  surface.setIcon(icon);
  surface.setTitle("SUSmobil - Umweltmesstechnik");
  surface.setResizable(true);
  anzahlCOMPorts = Serial.list().length;
  bold = createFont("Arial Bold", 22);
  normal = createFont("Lucida Sans", 20);
  bold1 = createFont("Arial Bold", 30);
  bold2 = createFont("Arial Bold", 25);
  bold3 = createFont("Arial Bold", 16);
  try {
    myPort = new Serial(this, Serial.list()[ausgewaehlterPort], 57600);
    gotSerial = true;
  }
  catch(Exception e) {
    gotSerial = false;
  }
  Aufloesung = new dropdown("frei", 220, 230, 250, 30, 6, Aufloesung_Strings, false, color(123, 120, 20));


  fan[0] = loadImage("fan1.gif");
  fan[1] = loadImage("fan2.gif");
  fan[2] = loadImage("fan3.gif");
  fan[3] = loadImage("fan4.gif");
  fan[4] = loadImage("fan5.gif");
  fan[5] = loadImage("fan6.gif");
  fan[6] = loadImage("fan7.gif");
  fan[7] = loadImage("fan8.gif");
  fan_aus = loadImage("img/Ventilator_aus.jpg");
  for (int i = 0; i< 8; i++) {
    fan[i].resize(110, 100);
  }
  fan_aus.resize(110, 100);


  a = new Textfield(300, 320, 110, 100, myText[0], true);
  b = new Textfield(450, 320, 110, 100, myText[1], true);
  c = new Textfield(600, 320, 110, 100, myText[2], true);
  d = new Textfield(750, 320, 110, 100, myText[3], true);
  e = new Textfield(900, 320, 110, 100, myText[4], true);


  a2 = new Textfield(300, 450, 110, 100, myText2[0], true);
  b2 = new Textfield(450, 450, 110, 100, myText2[1], true);
  c2 = new Textfield(600, 450, 110, 100, myText2[2], true);
  d2 = new Textfield(750, 450, 110, 100, myText2[3], true);
  e2 = new Textfield(900, 450, 110, 100, myText2[4], true);

  Kalibrierung2_2 = new Textfield22(650, 390, 100, 50, Kalibrierung_Station2_2, false);
  Zeit_Station3 = new Textfield22(240, 315, 100, 50, Kalibrierung_Station3, false);


  A_wiederholen = new button(600, 20, 210, 35, "Probe A vermessen", 5, true, 20);
  B_wiederholen = new button(600, 60, 210, 35, "Probe B vermessen", 5, true, 20);
  C_wiederholen = new button(600, 100, 210, 35, "Probe C vermessen", 5, true, 20);
  D_wiederholen = new button(870, 20, 210, 35, "Probe D vermessen", 5, true, 20);
  E_wiederholen = new button(870, 60, 210, 35, "Probe E vermessen", 5, true, 20);


  Station1_Aufgabentext = new Aufgabentext(" In diesem Versuch wirst du die Feinstaubemission von Kreide messen. Dir stehen zwei unterschiedliche Kreidearten zur Verfügung (fein und grob). ", 25, 75, 1200, 85);

  Station2_Aufgabentext_a = new Aufgabentext(" Übertrage deine beiden Messungen mit der Nase in die unteren Felder! Nutze nur die Großbuchstaben A, B, C, D und E! Wenn du alles eingetragen hast, gelangst du zur Sensormessung.", 15, 75, 1245, 90);
  Station2_Aufgabentext_a2 = new Aufgabentext(" Mische die Proben und ordne sie erneut. Klicke anschließend auf 'Sensormessung' und lasse den Sensor an den Proben 'riechen'!", 15, 75, 1245, 90);

  Station2_Aufgabentext_b1 = new Aufgabentext(" Eine Messung dauert 60 Sekunden. Lege Probe A in die Plexiglasbox und stelle die Platine darüber. Klicke nun auf 'Messen'. Die durchschnittliche Konzentration wird in der Tabelle angezeigt.", 20, 20, 850, 110);
  Station2_Aufgabentext_b2 = new Aufgabentext(" Legt nun Probe B in die Plexiglasbox und stellt die Platine darüber.", 20, 20, 750, 55);
  Station2_Aufgabentext_b3 = new Aufgabentext(" Legt nun Probe C in die Plexiglasbox und stellt die Platine darüber.", 20, 20, 750, 55);
  Station2_Aufgabentext_b4 = new Aufgabentext(" Legt nun Probe D in die Plexiglasbox und stellt die Platine darüber..", 20, 20, 750, 55);
  Station2_Aufgabentext_b5 = new Aufgabentext(" Legt nun Probe E in die Plexiglasbox und stellt die Platine darüber..", 20, 20, 750, 55);

  Station2_Aufgabentext_c = new Aufgabentext(" Hier siehst du die Vorhersage deiner Nase und des Sensors. Vergleiche die Ergebnisse nun mit den wahren Werten. Konntest du gegen den Sensor gewinnen?", 20, 20, 1250, 80);

  Station3_Aufgabentext_a1 = new Aufgabentext(" Vergleiche verschiedene Materialien auf dei Ausdünstung von flüchtigen organischen Verbindungen (TVOC). Welche Stoffe emittieren am meisten?", 20, 60, 1250, 100);
  Station3_Aufgabentext_a2 = new Aufgabentext(" Ordne die Emission der folgenden Stoffe auf der unteren Skala an, indem du zunächst daran riechst. Vergib Punkte von 0 (nicht wahrnehmbar) bis 6 (extrem stark). Notiere deine Einschätzung auch in der Broschüre.", 20, 230, 1250, 90);

  Station3_Aufgabentext_b1 = new Aufgabentext(" Miss nun die verschiedenen Stoffe mit dem Sensor. Lege die Proben in die Plexiglasbox und stelle das Sensorboard darüber. Warte bis der Sensor ein Gleichgewicht erreicht hat und notiere die auch diese Einschätzung in der Broschüre.", 20, 60, 1250, 90);
  TVOC_Duelle_uebertragen = new Aufgabentext(" Falls noch nicht geschehen, übertragt die Ergebnisse in die Tabelle in der Bröschüre.", 20, 10, 980, 55);

  TVOC_Duelle_Analyse = new Aufgabentext(" Mal sehen, was die einzelnen Proben enthalten. Halten die alternativen Produkte, was sie versprechen? Wählt eines der Duelle aus und seht euch die Zusammensetzung der Proben genauer an.", 20, 20, 1240, 90);
  Duell_Aufgabentext = new Aufgabentext(" Hinweise: Wenn ihr mit der Maus über die (?) fahrt, könnt ihr zusätzliche Infos zu den Peaks einholen. Achtet bei eurer Einschätzung auch auf eine geeignete Skalierung.", 20, 20, 1240, 90);


  Station4_Aufgabentext_a = new Aufgabentext(" In diesem Experiment wirst du Messungen der Innenraumluftqualität durchführen. Eine Messung besteht aus 2 Phasen:", 25, 70, 1200, 235);
  Station4_Aufgabentext_a2 = new Aufgabentext(" Klicke auf diesen Button, um eine Messung mit ausgeschaltetem Ventilator durchzu- führen", 380, 450, 500, 170);
  SPS_Blau_Station1 = new dropdown("Rechts", 750, 20, 200, 30, 3, SPS_Strings_Station1, false, color(0, 0, 255));
  SPS_Rot_Station1 = new dropdown("Links", 120, 20, 200, 30, 3, SPS_Strings_Station1, false, color(255, 0, 0));
  SPS_Blau_Station1_Auswertung = new dropdown("Rechts", 750, 20, 200, 30, 7, SPS_Strings_Station1_Auswertung, false, color(0, 0, 255));
  SPS_Rot_Station1_Auswertung = new dropdown("Links", 120, 20, 200, 30, 7, SPS_Strings_Station1_Auswertung, false, color(255, 0, 0));
  SPS_Gruen_Station1_Auswertung = new dropdown("Mitte", 435, 20, 200, 30, 7, SPS_Strings_Station1_Auswertung, false, color(0, 255, 0));


  //Station4_Rot = new dropdown("Links", 120, 20, 200, 30, 6, Station4_Strings, false, color(255, 0, 0));
  //Station4_Blau = new dropdown("Rechts", 750, 20, 200, 30, 6, Station4_Strings, false, color(0, 0, 255));

  Station4_Rot = new dropdown("Links", 120, 20, 200, 30, 5, Station4_Strings, false, color(255, 0, 0));
  Station4_Blau = new dropdown("Rechts", 750, 20, 200, 30, 5, Station4_Strings, false, color(0, 0, 255));


  //  Station4_Auswertung_Rot = new dropdown("Zeit", 120, 15, 200, 30, 6, Station4_Auswertung_Strings, false, color(255, 0, 0));
  //  Station4_Auswertung_Blau = new dropdown("Temperatur", 750, 15, 200, 30, 5, Station4_Auswertung_Strings2, false, color(0, 0, 255));

  Station4_Auswertung_Rot = new dropdown("Zeit", 120, 15, 200, 30, 5, Station4_Auswertung_Strings, false, color(255, 0, 0));
  Station4_Auswertung_Blau = new dropdown("Temperatur", 750, 15, 200, 30, 4, Station4_Auswertung_Strings2, false, color(0, 0, 255));


  // Alle_Sensoren_Rot = new dropdown("", 120, 10, 200, 30, 10, Alle_Sensoren_Strings, false, color(255, 0, 0));
  // Alle_Sensoren_Blau = new dropdown("", 750, 10, 200, 30, 10, Alle_Sensoren_Strings, false, color(0, 0, 255));
  Alle_Sensoren_Rot = new dropdown("", 120, 10, 200, 30, 9, Alle_Sensoren_Strings, false, color(255, 0, 0));
  Alle_Sensoren_Blau = new dropdown("", 750, 10, 200, 30, 9, Alle_Sensoren_Strings, false, color(0, 0, 255));

  dateiformat = new dropdown("Format: .csv", 200, 5, 200, 30, 2, dateiformat_Strings, false, color(255, 12, 23));
  autosave = new dropdown("autosave (jeden Tag)", 450, 5, 300, 30, 5, autosave_Strings, false, color(255, 34, 23));

  connect = new dropdown("verbinden", 350, 180, 200, 30, 2, connect_Strings, false, color(12, 4, 45));
  error_bars = new dropdown("anzeigen", 700, 180, 200, 30, 2, error_bars_Strings, false, color(23, 4, 5));
  freie_stationen = new dropdown("nicht freigeben", 800, 230, 200, 30, 2, freie_stationen_Strings, false, color(1, 2, 3));

  fehler = new checkbox(1225, 160, 30, false);
  verbinde = new checkbox(1225, 200, 30, false);
  fehler_tutorial = new checkbox(1215, 240, 25, false);
  verbinde_tutorial = new checkbox(1215, 275, 25, true);


  skalierung_angleichen = new checkbox(730, 678, 30, false);

  fehler_innenraum = new checkbox(1225, 195, 30, false);
  verbinde_innenraum = new checkbox(1225, 240, 30, true);

  // tutorial_Rot = new dropdown("Links", 125, 115, 200, 30, 10, tutorial_Rot_Strings, false, color(255, 0, 0));
  // tutorial_Blau = new dropdown("Rechts", 725, 115, 200, 30, 10, tutorial_Blau_Strings, false, color(0, 0, 255));

  tutorial_Rot = new dropdown("Links", 125, 115, 200, 30, 9, tutorial_Rot_Strings, false, color(255, 0, 0));
  tutorial_Blau = new dropdown("Rechts", 725, 115, 200, 30, 9, tutorial_Blau_Strings, false, color(0, 0, 255));


  strichdicke = new dropdown("2 (Standard)", 900, 5, 200, 30, 3, strichdicke_Strings, false, color(1, 0, 255));


  table = new Table();
  table.addColumn("Zeit");
  table.addColumn("Temperatur");
  table.addColumn("rel. Luftfeuchte");
  table.addColumn("CO2");
  table.addColumn("eCO2");
  table.addColumn("TVOC");
  table.addColumn("PM1");
  table.addColumn("PM2.5");
  table.addColumn("PM4");
  table.addColumn("PM10");


  back = new button(1115, 660, 140, 50, "zurück", 5, true, 20);
  up1 = new button(25, 140, 30, 50, "up_arrow", 5, true, 20);
  down1 = new button(25, 195, 30, 50, "down_arrow", 5, true, 20);
  up2 = new button(1025, 140, 30, 50, "up_arrow", 5, true, 20);
  down2 = new button(1025, 195, 30, 50, "down_arrow", 5, true, 20);


  Temperatur_Doppfelpfeil_down1 = new button(25, 595, 30, 50, "down_arrow", 5, true, 20);
  Temperatur_Doppfelpfeil_up1 = new button(25, 540, 30, 50, "up_arrow", 5, true, 20);
  Temperatur_Doppfelpfeil_down2 = new button(1025, 595, 30, 50, "down_arrow", 5, true, 20);
  Temperatur_Doppfelpfeil_up2 = new button(1025, 540, 30, 50, "up_arrow", 5, true, 20);


  left1 = new button(1115, 330, 50, 30, "left_arrow", 5, true, 20);
  right1 = new button(1200, 330, 50, 30, "right_arrow", 5, true, 20);
  start_stopp = new button(1115, 35, 140, 50, "Start/Stopp", 5, true, 20);
  aktualisierung_right = new button(1200, 500, 50, 30, "right_arrow", 5, true, 20);
  aktualisierung_left = new button(1115, 500, 50, 30, "left_arrow", 5, true, 20);

  TVOC_analyse = new button(700, 250, 350, 150, "GC-MS Analyse", 5, true, 40);

  Feinstaub_weiter = new button(1115, 600, 140, 50, "weiter", 5, true, 20);



  Duell1 = new button(250, 200, 200, 100, "Duell 1 - Farben", 5, true, 20);
  Duell2  = new button(930, 200, 200, 100, "Duell 2 - Filzstifte", 5, true, 20);
  Duell3  = new button(250, 450, 200, 100, "Duell 3 - Kleber", 5, true, 20);
  Duell4 = new button(930, 450, 200, 100, "Duell 4 - Böden", 5, true, 20);

  Geruchstest = new button(250, 250, 350, 150, "Geruchstest", 5, true, 40);
  auswertung_Geruchstest = new button(250, 450, 350, 150, "Auswertung des\nGeruchstests", -20, true, 40);
  abbruch_Station2 = new button(1100, 20, 100, 50, "Abbruch", 5, true, 20);
  Station2_Werte_konstant = new button(1100, 100, 100, 50, "Verlauf ist\nkonstant", -7, true, 15);


  ja_zufrieden = new button(1100, 120, 100, 50, "Weiter", 5, true, 20);

  x_up = new button(900, 680, 50, 30, "right_arrow", 5, true, 20);
  x_down = new button(840, 680, 50, 30, "left_arrow", 5, true, 20);
  y_up = new button(25, 140, 30, 50, "up_arrow", 5, true, 20);
  y_down = new button(25, 195, 30, 50, "down_arrow", 5, true, 20);


  up_Feinstaub1 = new button(635, 200, 30, 50, "up_arrow", 5, true, 20);
  down_Feinstaub1 = new button(635, 255, 30, 50, "down_arrow", 5, true, 20);
  up_Feinstaub2 = new button(1000, 380, 30, 50, "up_arrow", 5, true, 20);
  down_Feinstaub2 = new button(1000, 435, 30, 50, "down_arrow", 5, true, 20);

  zurAuswertung_Feinstaub = new button(1050, 20, 160, 50, "zur Auswertung", 5, true, 20);

  //
  reset = new button(1115, 90, 140, 50, "Reset", 5, true, 20);
  sicher_ja = new button(330, 340, 150, 75, "Ja", 5, true, 20);
  sicher_nein = new button(600, 340, 150, 75, "Nein", 5, true, 20);

  //

  sicher_ja_reset = new button(450, 340, 150, 75, "Ja", 5, true, 20);
  sicher_nein_reset = new button(700, 340, 150, 75, "Nein", 5, true, 20);
  left_tutorial = new button(1097, 375, 50, 30, "left_arrow", 5, true, 20);
  right_tutorial = new button(1187, 375, 50, 30, "right_arrow", 5, true, 20);
  //
  Stationen = new button(60, 100, 480, 420, "Stationen", 20, true, 70);
  Sensoren = new button(740, 100, 480, 420, "Sensoren", 20, true, 70);
  zumObermenu = new button(1125, 655, 140, 50, "Hauptmenü", 5, true, 20);
  zumObermenu2 =  new button(1115, 600, 140, 50, "Stationsmenü", 5, true, 20);
  zumObermenu.hide();

  //
  SPS30 = new button(100, 50, 450, 300, "Feinstaub", 15, true, 50);
  SGP30 = new button(650, 50, 450, 300, "TVOC, eCO2", 15, true, 50);
  SCD30 = new button(100, 375, 450, 300, "Temperatur,\nrel. Luftfeuchte,\nCO2", -40, true, 50);
  alle_Sensoren = new button(720, 100, 300, 150, "Messwert gegen\nZeit", -10, true, 30);
  alle_Sensoren2 = new button(720, 400, 300, 150, "Messwert gegen\nMesswert", -10, true, 30);

  //
  einstellungen = new button(565, 445, 150, 75, "Einstellungen", 5, true, 20);
  Port1 = new button(880, 97, 25, 25, " x ", 5, true, 20);
  Port2 = new button(880, 127, 30, 30, " x ", 5, true, 20);
  Port3 = new button(880, 157, 30, 30, " x ", 5, true, 20);
  Port4 = new button(880, 187, 30, 30, " x ", 5, true, 20);
  Port5 = new button(880, 217, 30, 30, " x ", 5, true, 20);
  Port6 = new button(880, 247, 30, 30, " x ", 5, true, 20);
  //
  station1_referenz = new button(150, 300, 300, 150, "Referenzmessung", 5, true, 30);
  station1_trocken = new button(500, 300, 300, 150, "trockener\nSchwamm", -20, true, 30);
  station1_nass = new button(850, 300, 300, 150, "nasser\nSchwamm", -20, true, 30);
  zur_Auswertung2 = new button(500, 570, 300, 140, "zur Auswertung", 5, true, 30);

  station1_MessungStarten = new button(1115, 70, 140, 65, "Messung\nstarten", -5, true, 20);
  station1_MessungWiederholen = new button(1115, 310, 140, 65, "Messung \nwiederholen", -5, false, 20);
  station1_weiter_ab = new button(1115, 390, 140, 50, "zu Aufgabe b)", 5, true, 20);
  station1_weiter_bc =  new button(1115, 390, 140, 50, "zu Aufgabe c)", 5, true, 20);
  station1_zur_Auswertung = new button(1105, 390, 160, 50, "zur Auswertung", 5, true, 20);
  zur_Auswertung3 = new button(1075, 600, 180, 50, "zu den Graphen", 5, true, 20);

  tutorial_ueberspringen = new button(550, 635, 170, 70, "Tutorial\nüberspringen", -10, true, 20);
  tutorial_weiter = new button(1120, 650, 140, 50, "weiter", 5, true, 20);
  tutorial_zum = new button(565, 100, 150, 75, "zum Tutorial", 5, true, 20);
  tutorial_back = new button(20, 650, 140, 50, "zurück", 5, true, 20);
  tutorial_Start_Stopp = new button(1100, 140, 130, 40, "Start/Stopp", 5, true, 20);

  tutorial_skalierung_rot_up = new button(15, 175, 25, 40, "up_arrow", 5, true, 20);
  tutorial_skalierung_rot_down = new button(15, 220, 25, 40, "down_arrow", 5, true, 20);
  tutorial_skalierung_blau_up = new button(1005, 175, 25, 40, "up_arrow", 5, true, 20);
  tutorial_skalierung_blau_down =new button(1005, 220, 25, 40, "down_arrow", 5, true, 20);
  tutorial_reset = new button(1100, 185, 130, 40, "Reset", 5, true, 20);
  aktualisierung_right_tutorial = new button(1183, 515, 50, 30, "right_arrow", 5, true, 20);
  aktualisierung_left_tutorial = new button(1098, 515, 50, 30, "left_arrow", 5, true, 20);

  setBaseline = new button(20, 120, 170, 75, "Baseline setzen", 5, true, 20);

  sps = loadImage("img/sps30.jpg");
  sgp = loadImage("img/sgp30.jpg");
  scd = loadImage("img/scd30.jpg");
  nodemcu = loadImage("img/nodemcu.png");
  SUSmobil = loadImage("img/SUSmobil.png");
  DBU = loadImage("img/DBU.png");

  //
  Stoff1_bild = loadImage("/img/Stoff1.png");
  Stoff2_bild = loadImage("/img/Stoff2.png");
  Stoff3_bild = loadImage("/img/Stoff3.png");
  Stoff4_bild = loadImage("/img/Stoff4.png");
  Stoff5_bild = loadImage("/img/Stoff5.png");
  Stoff6_bild = loadImage("/img/Stoff6.png");
  Stoff7_bild = loadImage("/img/Stoff7.png");
  Stoff8_bild = loadImage("/img/Stoff8.png");

  blauer_engel = loadImage("/img/blauer_engel.png");

  //


  //one = new station(50, 50, false);
  //two_three = new station(450, 50, false);
  //two = new station(200, 200, false);
  //three = new station(650, 200, false);
  //four = new station(50, 350, false);
  //settings = new station(450, 350, false);


  one = new button(30, 24, 400, 150, "Station 1\nDie Messsoftware", -8, true, 40);
  two = new button(30, 198, 400, 150, "Station 2\nNase vs. Sensor", -8, true, 40);
  two_a = new button(95, 25, 450, 200, "Station 2.1\nIch rieche was,\nwas du nicht riechst", -35, true, 40);
  two_b = new button(735, 25, 450, 200, "Station 2.2\nTVOC-Duelle", -8, true, 40);
  three = new button(30, 372, 400, 150, "Station 3\nDicke Luft", -8, true, 40);
  four = new button(30, 546, 400, 150, "Station 4\nFeinstaubalarm", -8, true, 40);

  A = new Probe(355, 460, "A", true, false);
  B = new Probe(505, 460, "B", true, false);
  C = new Probe(655, 460, "C", true, false);
  D = new Probe(805, 460, "D", true, false);
  E = new Probe(955, 460, "E", true, false);

  A2 = new Probe(355, 560, "A2", true, false);
  B2 = new Probe(505, 560, "B2", true, false);
  C2 = new Probe(655, 560, "C2", true, false);
  D2 = new Probe(805, 560, "D2", true, false);
  E2 = new Probe(955, 560, "E2", true, false);

  Sensormessung = new button(557, 615, 200, 100, "Sensormessung", 5, true, 20);
  Station2_Riechen2 = new button(557, 615, 200, 100, "2. Versuch", 5, false, 20);
  messen = new button(875, 70, 150, 100, "Messen", 5, true, 20);
  letzteWiederholen = new button(1050, 70, 150, 100, "letzte Messung\nwiederholen", -9, false, 20);
  reset_Station2 =  new button(970, 660, 140, 50, "Reset", 5, false, 20);


  station4_MessungWiederholen = new button(1115, 290, 140, 65, "Messung \nwiederholen", -5, false, 20);



  TVOC_Duelle_Start = new button(565, 400, 150, 100, "Start", 5, true, 20);
  Stoff1 = new TVOC_Kandidat(640, 360, Stoff1_bild, "Lack");
  Stoff2 = new TVOC_Kandidat(640, 600, Stoff2_bild, "Lack mit Umweltsiegel");
  Stoff3 = new TVOC_Kandidat(640, 360, Stoff3_bild, "Herkömmlicher Filzstift");
  Stoff4 = new TVOC_Kandidat(640, 600, Stoff4_bild, "VOC-freier Filzstift");
  Stoff5 = new TVOC_Kandidat(640, 360, Stoff5_bild, "VOC-freier Kleber");
  Stoff6 = new TVOC_Kandidat(640, 600, Stoff6_bild, "Herkömmlicher Klebstoff");
  Stoff7 = new TVOC_Kandidat(640, 360, Stoff7_bild, "Korkboden");
  Stoff8 = new TVOC_Kandidat(640, 600, Stoff8_bild, "Eco-Boden");

  naechstes_Duell = new button(1125, 200, 150, 75, "Nächstes\nDuell", -10, true, 20);
  naechster_Stoff = new button(1115, 200, 150, 75, "Nächster\nStoff", -10, true, 20);
  vorheriges_Duell = new button(1125, 280, 150, 75, "Vorheriges\nDuell", -10, true, 20);
  vorheriger_Stoff = new button(1115, 280, 150, 75, "Vorheriger\nStoff", -10, true, 20);
  weiter_zum_Sensor = new button(1125, 550, 150, 75, "Sensor-\nmessung", -10, true, 20);

  zur_Auswertung = new button(1115, 500, 160, 75, "Zur Aus-\nwertung", -10, true, 20);

  // Station 4
  Station4a = new button(570, 540, 180, 70, "zur Messung ohne\nVentilator", -10, true, 20); 
  Station4b = new button(1090, 370, 180, 70, "zur Messung mit\nVentilator", -10, true, 20); 
  Station4c = new button(1115, 390, 140, 50, "zu Aufgabe c)", 5, true, 20); 
  Station4Auswertung = new button(1115, 365, 140, 70, "zur\nAuswertung", -12, true, 20); 
  Station4Start = new button(1115, 100, 140, 65, "Messung\nstarten", -5, true, 20); 


  up2_Station4 = new button(900, 670, 50, 30, "right_arrow", 5, true, 20);
  down2_Station4 = new button(840, 670, 50, 30, "left_arrow", 5, true, 20);


  zero = new button(120, 90, 200, 50, "ohne Ventilator", 5, true, 20);
  fifty = new button(700, 90, 200, 50, "mit Ventilator", 5, true, 20);
  // hundred = new button(750, 90, 150, 50, "100% Lüfter", 5, true, 20);

  genaueAnalyse =  new button(1115, 550, 140, 50, "Analyse", 5, true, 20);
  s = new slider(200, 400, false, false);
  sFeinstaub = new slider(200, 400, false, false);
  slider_Mensch_Sensor = new slider_MS(500, 1200, false, false);


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

float mouse_time = 0;


void draw() {
  // Stationen freigeben:
  if (freie_stationen.name == "freigeben") {
    Station4aFertig = true;
    Station4bFertig = true;
    Station4cFertig = true;
  }
  time_Station4 = float(Kalibrierung_Station3);

  if (mouseX - pmouseX != 0 && !mousePressed && mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {
    mouse_time = millis();
  }
  if (millis() - mouse_time > 60000) {
    frameRate(20);
  } else {
    frameRate(60);
  }
    scale(scale_factor);
  textFont(normal);
  pushMatrix();
  //Aufloesung.setPosition(950/0.75, 150/0.75);
  popMatrix();
  scale(1);
  imageMode(CORNER);
  translate(0, scroll);
  // Die Performance wird durch ein Bild als Hintergrund verbessert
  background(250);
  //image(hintergrund, 0, 0);
  // Falls die serielle Verbinding unterbrochen wird, wird nach einer neuen gesucht
  if (!gotSerial) {
    try {
      myPort = new Serial(this, Serial.list()[ausgewaehlterPort], 57600);
      myPort.clear();
      gotSerial = true;
      anzahlCOMPorts = Serial.list().length;
    }
    catch(Exception e) {
      println(e);
      gotSerial = false;
    }
  }
  if (Serial.list().length != anzahlCOMPorts) {
    gotSerial = false;
  }

  //println(page);
  // Debug - Informationen
  //noStroke();
  //fill(0);
  //textSize(16);
  //text(nf(frameRate, 0, 0), 20, 20);
  //text("Aufgenommene Messwerte: " + index, 420, 20);
  Feinstaub_weiter.y = 600;
  Feinstaub_weiter.text = "weiter";
  // Buttons werden zunächst alle "versteckt", und nur die benötigten an den entsprechenden Stellen "sichtbar" gemacht.
  sicher_ja.hide();
  einstellungen.hide();
  sicher_nein.hide();
  station1_referenz.hide();
  station1_trocken.hide();
  station1_nass.hide();
  TVOC_Duelle_Start.hide();
  Sensormessung.hide();
  reset_Station2.hide();
  zero.hide();
  fifty.hide();
  //hundred.hide();
  setBaseline.hide();
  tutorial_zum.hide();
  tutorial_weiter.hide();
  tutorial_back.hide();
  Station4b.hide();
  Station4c.hide();
  Station4Auswertung.hide();
  Station4a.visible = false;
  tutorial_ueberspringen.hide();
  station1_weiter_ab.hide();
  station1_weiter_bc.hide();
  station1_zur_Auswertung.hide();
  zur_Auswertung2.hide();
  zur_Auswertung3.hide();
  TVOC_analyse.hide();
  Station2_Werte_konstant.hide();

  //one.hide();
  //two.hide();
  //three.hide();
  //four.hide();
  //two_a.hide();
  //two_b.hide();
  Duell1.hide();
  Duell2.hide();
  Duell3.hide();
  Duell4.hide();
  tutorial_reset.hide();

  verbinde.x = 1225;
  fehler.x = 1225;
  verbinde.y = 200;
  fehler.y = 160;


  if (page != 0) {
    one.hide();
    two.hide();
    three.hide();
    four.hide();
  }

  if (page != 2.5) {
    two_a.hide();
    two_b.hide();
  }


  aktualisierung_right.hide();
  aktualisierung_left.hide();
  start_stopp.hide();

  tutorial_back.hide();

  tutorial_Start_Stopp.hide();
  tutorial_reset.hide();

  alle_Sensoren2.hide();
  if (page == -2) {
    alle_Sensoren.show();
    alle_Sensoren2.show();
  } else {
    alle_Sensoren.hide();
    alle_Sensoren2.hide();
  }


  // Aufloesung.hide();
  ////////////////////////////////////////////////////////
  zumObermenu.x = 1115;

  if (page == 2.2) {
    Station2_Sensor();
    up2.y = 190;
    down2.y = 245;
    up2.x = 1210;
    down2.x = 1210;
  } else if (page != 4.1 && page != 4.11 && page != 4.111) {
    up2.y = 140;
    down2.y = 195;
    up2.x = 1025;
    down2.x = 1025;
  }

  if (page != -2) {
    SPS30.hide();
    SGP30.hide();
    SCD30.hide();
  }
  if (page != -1) {
    Stationen.hide();
    Sensoren.hide();
  }

  if (page != 0 && page != -1 && page != -7 && page != -7.1 && page != -7.11 && page != -7.111&& page != -7.1111 && page != -7.11111 && page != -7.111111 && page != -7.2 && page != -7.22 && page != -7.222) {
    back.show();
  }

  String auto = autosave.name;

  if (auto == "autosave (jede Minute)") {
    if (second() == 0 && savedDay == false) {
      saveData();
      savedDay = true;
      tagesIndex = 0;
    }
    if (second() > 0) {
      savedDay = false;
    }
  }
  if (auto == "autosave (jede Stunde)") {
    if (second() == 0 && minute() == 0 && savedDay == false) {
      saveData();
      savedDay = true;
      tagesIndex = 0;
    }
    if (second() > 0) {
      savedDay = false;
    }
  }
  if (auto == "autosave (jeden Tag)") {
    if (second() == 0 && minute() == 0 && hour() == 0 && savedDay == false) {
      saveData();
      savedDay = true;
      tagesIndex = 0;
    }
    if (second() > 0) {
      savedDay = false;
    }
  }
  Datenaufnahme();
  if (Stationen.isClicked()) {
    delay(200);
    page = 0;
  }
  if (Sensoren.isClicked()) {
    page = -2;
  }
  if (index > 0) {
    if (SPS30.isClicked()) {
      page = -3;
    }
    if (SGP30.isClicked()) {
      page = -4;
    }
    if (SCD30.isClicked()) {
      page = -5;
    }
    if (alle_Sensoren.isClicked()) {
      page = -6;
    }
    if (one.isClicked()) {
      delay(200);
      page = 100;
    }
    if (two.isClicked()) {
      delay(200);
      page = 2.5;
    }
    if (two_a.isClicked()) {
      delay(200);
      page = 2;
    }
    if (two_b.isClicked()) {
      delay(200);
      page = 2.75;
    }
    if (Geruchstest.isClicked()) {
      delay(200);
      page = 3;
    }


    if (three.isClicked()) {
      delay(200);
      page = 4;
    }
    if (four.isClicked()) {
      delay(200);
      page = 1;
    }
  }

  if (page == 100) {
    alleSensoren();
  }

  if (page == 1.11111) {
    verbinde.y = 570;
    fehler.y = 610;
  } else {
    verbinde.y = 200;
    fehler.y = 160;
  }
  //  println(page);
  if (page == -1) {
    Obermenu();
    einstellungen.show();
    reset.hide();

    one.hide();
    two.hide();
    two_a.hide();
    two_b.hide();
    three.hide();
    four.hide();
  } else if (page == 0) {
    hauptmenu();
    zumObermenu.show();
    Sensoren.hide();
    reset.hide();
  } else if (page == 1) {
    //Feinstaub();
    Feinstaub1();
    Sensoren.hide();
    zumObermenu.hide();
  } else if (page == 1.1) {
    Feinstaub2();
  } else if (page == 1.2) {
    Feinstaub3();
  } else if (page == 1.3) {
    Feinstaub4();
  } else if (page == 1.4) {
    Feinstaub5();
  } else if (page == 1.5) {
    Feinstaub6();
  } else if (page == 1.6) {
    Feinstaub7();
  } else if (page == 1.7) {
    Feinstaub8();
  } else if (page == 1.8) {
    Feinstaub9();
  } else if (page == 1.9) {
    Feinstaub_KreideA();
  } else if (page == 1.91) {
    Feinstaub11();
  } else if (page == 1.911) {
    Feinstaub_KreideB();
  } else if (page == 1.9111) {
    Feinstaub13();
  } else if (page == 1.91111) {
    Feinstaub14();
  } else if (page == 2) {
    MenschSensor();
    zumObermenu.hide();
  } else if (page == 2.1) {
    page = 2.0;
  } else if (page == 2.2) {
    Station2_Sensor();
  } else if (page == 2.3) {
    Station2_Vergleich();
  } else if (page == 2.5) {
    Station2Oder3();
    Geruchstest.hide();
    zumObermenu.hide();
  } else if (page == 2.75) {
    ZwischenFolieTVOC();
  } else if (page == 3) {
    TVOC_Duelle();
    zumObermenu.hide();
  } else if (page == 3.1) {
    TVOC_Duelle_Riechen();
  } else if (page == 3.11) {
    TVOC_Duelle_Messen();
  } else if (page == 3.111) {
    Zusammenfassung_Mensch_Sensor();
  } else if (page == 3.1111) {
    Auswertung_Station3();
  } else if (page == 3.11111) {
    Analyse();
  } else if (page == 3.2) {
    Duell1_();
  } else if (page == 3.3) {
    Duell2_();
  } else if (page == 3.4) {
    Duell3_();
  } else if (page == 3.5) {
    Duell4_();
  } else if (page == 4) {
    Innenraumluft();
    zumObermenu.hide();
    reset.hide();
  } else if (page == 4.1) {
    Innenraumluft_a();
    reset.hide();
  } else if (page == 4.11) {
    Innenraumluft_b();
    reset.hide();
  } else if (page == 4.1111) {
    AuswertungInnenraum(); 
    reset.hide();
  } else if (page == 10) {
    setting();
    Stationen.hide();
    Sensoren.hide();
    zumObermenu.hide();

    int anzahlPorts = Serial.list().length;
    if (anzahlPorts > 0) {
      Port1.show();
    } else {
      Port1.hide();
    }
    if (anzahlPorts > 1) {
      Port2.show();
    } else {
      Port2.hide();
    }
    if (anzahlPorts > 2) {
      Port3.show();
    } else {
      Port3.hide();
    }
    if (anzahlPorts > 3) {
      Port4.show();
    } else {
      Port4.hide();
    }
    if (anzahlPorts > 4) {
      Port5.show();
    } else {
      Port5.hide();
    }
    if (anzahlPorts > 5) {
      Port6.show();
    } else {
      Port6.hide();
    }
  } else if (page == -2) {
    SensorAuswahl();
  } else if (page == -3) {
    //Feinstaub();
    alle_Sensoren.hide();
    Stationen.hide();
  } else if (page == -5) {
    alleSensoren2();
    alle_Sensoren.hide();
    Stationen.hide();
  } else if (page == -6) {
    alleSensoren();
    alle_Sensoren.hide();
    alle_Sensoren2.hide();
    Stationen.hide();
  } else if (page == -7) {
    Tutorial0();
    time_tutorial = millis();
  } else if (page == -7.1) {
    Tutorial1();
  } else if (page == -7.11) {
    Tutorial2();
  } else if (page == -7.111) {
    Tutorial3();
  } else if (page == -7.1111) {
    Tutorial4();
  } else if (page == -7.11111) {
    Tutorial5();
  } else if (page == -7.111111) {
    Tutorial6();
  } else if (page == -7.2) {
    Tutorial7();
  } else if (page == -7.22) {
    Tutorial8();
  } else if (page == -7.222) {
    Tutorial9();
  }


  if (page != 10) {
    Port1.hide();
    Port2.hide();
    Port3.hide();
    Port4.hide();
    Port5.hide();
    Port6.hide();
  }

  if (Port1.isClicked()) {
    ausgewaehlterPort = 0;
    gotSerial = false;
  } else if (Port2.isClicked()) {
    ausgewaehlterPort = 1;
    gotSerial = false;
  } else if (Port3.isClicked()) {
    ausgewaehlterPort = 2;
    gotSerial = false;
  } else if (Port4.isClicked()) {
    ausgewaehlterPort = 3;
    gotSerial = false;
  } else if (Port5.isClicked()) {
    ausgewaehlterPort = 4;
    gotSerial = false;
  } else if (Port6.isClicked()) {
    ausgewaehlterPort = 5;
    gotSerial = false;
  }
  if (back.isClicked()) {
    if (auto == "speichern bei 'zurück") {
      saveData();
    }
    if (page > 0 && page != 10) {
      if (page == 1.1) {
        page = 1;
      } else if (page == 1.2) {
        page = 1.1;
      } else if (page == 1.3) {
        page = 1.2;
      } else if (page == 1.4) {
        page = 1.3;
      } else if (page == 1.5) {
        page = 1.4;
      } else if (page == 1.6) {
        page = 1.5;
      } else if (page == 1.7) {
        page = 1.6;
      } else if (page == 1.8) {
        page = 1.7;
      } else if (page == 1.9) {
        if (KreideAAbgeschlossen) {
          page = 1.8;
          Station1Start = false;
        } else {
          //page = 1.8;
          //Station1Start = false;
          back_bool_Feinstaub2 = true;
        }
      } else if (page == 1.91) {
        page = 1.9;
      } else if (page == 1.911) {
        if (KreideBAbgeschlossen) {
          page = 1.91;
          Station1_trocken_Start = false;
        } else {
          //page = 1.8;
          //Station1Start = false;
          back_bool_Feinstaub2 = true;
        }
      } else if (page == 1.9111) {
        page = 1.911;
      } else if (page == 1.91111) {
        page = 1.9111;
      } else if (page == 1.1 || page == 1.11 || page == 1.111 || page == 1.1111) {
        Station1Start = false;
        page = 1;
      } else if (page == 1.11111) {
        page = 1.1111;
      } else if (page == 2.1) {
        prob = 0;
        page = 2;
      } else if (page == 2.2) {
        page = 2.1;
      } else if (page == 2.3) {
        page = 2.2;
      } else if (page == 3.1) {
        page = 3;
      } else if (page == 3.11) {
        page = 3.1;
      } else if (page == 3.111) {
        page = 3.11;
      } else if (page == 3.1111) {
        page = 3.111;
      } else if (page == 2.75) {
        page = 2.5;
      } else if (page == 3.11111) {
        page = 2.75;
      } else if (page == 3.2 || page == 3.3 || page == 3.4 || page == 3.5) {
        page = 3.11111;
      } else if (page == 4.1) {
        //page = 4;
        if (Station4aFertig || !Station4agestartet) {
          page = 4;
        } else {
          back_bool_Innenraum = true;
        }
      } else if (page == 4.11) {
        if (Station4bFertig || !Station4bgestartet) {
          page = 4.1;
        } else {
          back_bool_Innenraum = true;
        }
      } else if (page == 4.111) {
        page = 4.11;
      } else if (page == 4.1111) {
        page = 4.11;
      } else if (page == 3) {
        page = 2.75;
      } else if (page == 2) {
        page = 2.5;
      } else {
        page = 0;
      }
    } else if (page < -2) {
      page =  -2;
    } else if (page == 10) {
      page = -1;
    } else {
      page = -1;
    }
  }
  if (station1_referenz.isClicked()) {
    page = 1.1;
  }

  if (station1_trocken.isClicked()) {
    page = 1.11;
  }

  if (station1_nass.isClicked()) {
    page = 1.111;
  }
  if (zur_Auswertung2.isClicked()) {
    page = 1.1111;
  }
  if (zur_Auswertung3.isClicked()) {
    page = 1.11111;
  }

  if (reset.isClicked()) {
    reset_bool = true;
  }
  if (reset_bool) {
    sicher();
  }
  if (zumObermenu.isClicked()) {
    page = -1;
  }
  if (page != 1.9 && page != 1.911) {
    if (sicher_ja.isClicked()) {
      reset_bool = false; 
      index = 0;
      tagesIndex = 0;
      zeroTime2 = millis();
      table.clearRows();
    }
    if (sicher_nein.isClicked()) {
      reset_bool = false;
    }
  }
  if (aktualisierung_right.isClicked()) {
    if (del < 5) {
      del += 1;
    } else if (del < 20) {
      del += 5;
    } else if (del < 30) {
      del += 10;
    } else if (del < 120) {
      del += 30;
    } else if (del < 300) {
      del += 60;
    }
  }
  if (aktualisierung_left.isClicked()) {
    if (del > 120) {
      del -= 60;
    } else if (del > 30) {
      del -= 30;
    } else if (del > 20) {
      del -= 10;
    } else if (del > 5) {
      del -= 5;
    } else if (del > 0) {
      del -= 1;
    }
  }

  if (einstellungen.isClicked()) {
    page = 10;
  }

  if (Feinstaub_weiter.isClicked()) {
    if (page == 1) {
      page = 1.1;
    } else if (page == 1.1) {
      page = 1.2;
    } else if (page == 1.2) {
      page = 1.3;
    } else if (page == 1.3) {
      page = 1.4;
    } else if (page == 1.4) {
      page = 1.5;
    } else if (page == 1.5) {
      page = 1.6;
    } else if (page == 1.6) {
      page = 1.7;
    } else if (page == 1.7) {
      page = 1.8;
    } else if (page == 1.8) {
      page = 1.9;
    } else if (page == 1.9) {
      page = 1.91;
    } else if (page == 1.91) {
      page = 1.911;
    } else if (page == 1.911) {
      page = 1.9111;
    } else if (page == 1.9111) {
      page = 1.91111;
    }
  }


  if (station1_MessungStarten.isClicked()) {
    if (page == 1.9) {
      Station1Start = true;
      time_station1 = millis();
    } else if (page == 1.911) {
      Station1_trocken_Start = true;
    }
  }



  if (station1_zur_Auswertung.isClicked()) {
    page = 1.11111;
  }

  if (tutorial_ueberspringen.isClicked()) {
    resetTutorial();
    page = -1;
  }
  if (tutorial_zum.isClicked()) {
    page = -7;
  }




  if (station4_MessungWiederholen.isClicked()) {
    println("station4_MessungWiederholen");
    reset_bool_Innenraum = true;
  }


  if (station1_MessungWiederholen.isClicked()) {
    reset_bool_Feinstaub = true;
    println("station1_MessungWiederholen");
    sicher();
  }
  if (Station2_Riechen2.isClicked()) {
    page = 2.1;
    MesswertSensor[0] = 0;
    MesswertSensor[1] = 0;
    MesswertSensor[2] = 0;
    MesswertSensor[3] = 0;
    MesswertSensor[4] = 0;
  }

  if (Sensormessung.isClicked()) {
    page = 2.2;
    MesswertSensor[0] = 0;
    MesswertSensor[1] = 0;
    MesswertSensor[2] = 0;
    MesswertSensor[3] = 0;
    MesswertSensor[4] = 0;
    messen_Station2 = false;
    prob = 1;
    indexMenschSensor = 0;
    MenschSensorMessen = false;
  }

  if (reset_Station2.isClicked()) {
    reset_bool_station2 = true;
  }

  if (tutorial_reset.isClicked()) {
    reset_bool_tutorial = true;
  }


  if (reset_bool_tutorial) {
    sicher_tutorial();
    if (sicher_ja_reset.isClicked()) {
      start_time_tutorial = millis();
      reset_bool_tutorial = false;
      tutorial_resettet = true;
    }
    if (sicher_nein_reset.isClicked()) {
      reset_bool_tutorial = false;
    }
  }


  if (reset_bool_Innenraum) {
    Geruchstest.hide();
    sicher(); 
    if (sicher_ja.isClicked()) {
      if (page == 4.1) {
        reset_bool_Innenraum = false;
        for (int i = 0; i < 5000; i++) {
          for (int j = 0; j < 7; j++) {
            Innenraumlufta[j][i] = 0;
          }
        }
        currentTime4a = millis();
        indexInnenraumlufta = 0;
      } else if (page == 4.11) {
        reset_bool_Innenraum = false;
        for (int i = 0; i < 5000; i++) {
          for (int j = 0; j < 7; j++) {
            Innenraumluftb[j][i] = 0;
          }
        }
        currentTime4b = millis();
        indexInnenraumluftb = 0;
      }
    }

    if (sicher_nein.isClicked()) {
      reset_bool_Innenraum = false;
    }
  }

  if (reset_bool_station2) {
    sicher();
    if (sicher_nein.isClicked()) {
      reset_bool_station2 = false;
    }
  }



  if (back_bool_Innenraum) {
    sicher2();
    if (sicher_ja.isClicked()) {
      Station1Start = false;
      back_bool_Innenraum = false;
      Station4bgestartet = false;
      Station4agestartet = false;
      if (page == 4.1) {
        page = 4;
        indexInnenraumlufta = 0;
        for (int i = 0; i < Innenraumlufta.length; i++) {
          Innenraumlufta[0][i] = 0;
          Innenraumlufta[1][i] = 0;
          Innenraumlufta[2][i] = 0;
          Innenraumlufta[3][i] = 0;
          Innenraumlufta[4][i] = 0;
          Innenraumlufta[5][i] = 0;
          Innenraumlufta[6][i] = 0;
        }
      }
      if (page == 4.11) {
        page = 4.1;
        indexInnenraumluftb = 0;
        for (int i = 0; i < Innenraumluftb.length; i++) {
          Innenraumluftb[0][i] = 0;
          Innenraumluftb[1][i] = 0;
          Innenraumluftb[2][i] = 0;
          Innenraumluftb[3][i] = 0;
          Innenraumluftb[4][i] = 0;
          Innenraumluftb[5][i] = 0;
          Innenraumluftb[6][i] = 0;
        }
      }
    }
    if (sicher_nein.isClicked()) {
      back_bool_Innenraum = false;
    }
  }


  if (back_bool_Feinstaub2) {
    sicher2();
    if (sicher_ja.isClicked()) {
      reset_bool_Feinstaub = false;
      Station1Start = false;
      back_bool_Feinstaub2 = false;
      if (page == 1.9) {
        page = 1.8;
        KreideAAbgeschlossen = false;
        indexStation1 = 0;
        for (int i = 0; i < 500; i++) {
          Station1_PM25[i] = 0;
          Station1_PM10[i] = 0;
        }
      }
      if (page == 1.911) {
        page = 1.91;
        KreideBAbgeschlossen = false;
        indexStation1_trocken = 0;
        Station1_trocken_Start = false;
        back_bool_Feinstaub2 = false;
        for (int i = 0; i < 500; i++) {
          Station1_PM25_trocken[i] = 0;
          Station1_PM10_trocken[i] = 0;
        }
      }
    }
    if (sicher_nein.isClicked()) {
      back_bool_Feinstaub2 = false;
      reset_bool_Feinstaub = false;
    }
  }


  if (reset_bool_Feinstaub) {
    sicher();
    if (sicher_ja.isClicked()) {
      reset_bool_Feinstaub = false;
      Station1Start = true;
      if (page == 1.9) {
        KreideAAbgeschlossen = false;
        indexStation1 = 0;
        for (int i = 0; i < 500; i++) {
          Station1_PM25[i] = 0;
          Station1_PM10[i] = 0;
        }
      }
      if (page == 1.911) {
        KreideBAbgeschlossen = false;
        indexStation1_trocken = 0;
        Station1_trocken_Start = true;
        for (int i = 0; i < 500; i++) {
          Station1_PM25_trocken[i] = 0;
          Station1_PM10_trocken[i] = 0;
        }
      }
    }
    if (sicher_nein.isClicked()) {
      reset_bool_Feinstaub = false;
      if (page == 1.9) {
        Station1Start = true;
      } else if (page == 1.911) {
        Station1_trocken_Start = true;
      }
    }
  }


  if (Station4Auswertung.isClicked()) {
    delay(200);
    page = 4.1111;
    saveDataInnenraum();
    reset_bool = false;
  }
  if (Station4c.isClicked()) {
    delay(200);
    page = 4.111;
  }
  if (Station4b.isClicked()) {
    delay(200);
    page = 4.11;
  }
  if (Station4a.isClicked()) {
    delay(200);
    page = 4.1;
  }

  if (zur_Auswertung3.isClicked()) {
    page = 1.11111;
  }

  if (start_stopp.isClicked()) {
    if (measure) {
      measure = false;
    } else {
      measure = true;
    }
  }


  if (alle_Sensoren2.isClicked()) {
    page = -5;
  }


  if (tutorial_weiter.isClicked()) {
    if (page == -7.222) {
      resetTutorial();
      page = -1;
    }
    if (page == -7.22) {
      page = -7.222;
    }
    if (page == -7.2) {
      page = -7.22;
    }
    if (page == -7.111111) {
      page = -7.2;
    }
    if (page == -7.11111) {
      page = -7.111111;
    }
    if (page == -7.1111) {
      page = -7.11111;
    }
    if (page == -7.111) {
      page = -7.1111;
    }
    if (page == -7.11) {
      page = -7.111;
    }
    if (page == -7.1) {
      page = -7.11;
    }
    if (page == -7) {
      page = -7.1;
    }
  }


  if (tutorial_back.isClicked()) {
    if (page == -7.1) {
      page = -7;
    }
    if (page == -7.11) {
      page = -7.1;
    }
    if (page == -7.111) {
      page = -7.11;
    }
    if (page == -7.1111) {
      page = -7.111;
    }
    if (page == -7.11111) {
      page = -7.1111;
    }
    if (page == -7.111111) {
      page = -7.11111;
    }
    if (page == -7.2) {
      page = -7.111111;
    }
    if (page == -7.22) {
      page = -7.2;
    }
    if (page == -7.222) {
      page = -7.22;
    }
  }

  if (TVOC_analyse.isClicked()) {
    page = 3.11111;
  }

  if (tutorial_Start_Stopp.isClicked()) {
    if (tutorial_Start) {
      tutorial_Start = false;
    } else {
      tutorial_Start = true;
      if (tutorial_Start_first_time == false) {
        start_time_tutorial = millis();
        tutorial_Start_first_time = true;
      }
    }
  }

  if (setBaseline.isClicked()) {
    myPort.write("\n"); //set Baseline
  }
  // cursorStuff();
}

boolean reset_bool = false;
boolean reset_bool_tutorial = false;
boolean reset_bool_station2 = false;
boolean reset_bool_Feinstaub = false;
boolean back_bool_Feinstaub2 = false;
boolean reset_bool_Innenraum = false;
boolean back_bool_Innenraum = false;


void sicher2() {
  fill(240);
  stroke(150);
  strokeWeight(4);
  rect(90, 250, 890, 200);
  strokeWeight(1);
  stroke(255, 0, 0);
  beginShape();
  fill(255, 50, 50);
  vertex(135, 425);
  vertex(205, 325);
  vertex(265, 425);
  vertex(135, 425);
  endShape();
  beginShape();
  fill(255, 0, 0);
  vertex(795, 425);
  vertex(865, 325);
  vertex(925, 425);
  vertex(795, 425);
  endShape();
  textSize(100);
  fill(0);

  if (page == 2.2) {
    text("!", 204, 417);
    text("!", 864, 417);
  } else {
    text("!", 189, 417);
    text("!", 849, 417);
  }
  fill(0);
  textSize(20);
  textAlign(CENTER);
  text("Die Messung ist noch nicht abgeschlossen! Wenn du auf 'ja' klickst,\nwerden die bisherigen Daten gelöscht.", 535, 290);

  sicher_ja.show();
  sicher_nein.show();
}


void sicher() {
  fill(240);
  stroke(150);
  strokeWeight(4);
  rect(90, 250, 890, 200);
  strokeWeight(1);
  stroke(255, 0, 0);
  beginShape();
  fill(255, 50, 50);
  vertex(135, 425);
  vertex(205, 325);
  vertex(265, 425);
  vertex(135, 425);
  endShape();
  beginShape();
  fill(255, 0, 0);
  vertex(795, 425);
  vertex(865, 325);
  vertex(925, 425);
  vertex(795, 425);
  endShape();
  textSize(100);
  fill(0);

  if (page == 2.2) {
    text("!", 204, 417);
    text("!", 864, 417);
  } else {
    text("!", 189, 417);
    text("!", 849, 417);
  }
  fill(0);
  textSize(30);
  textAlign(CORNER);
  if (page == 1.9 || page == 1.911 || page == 4.1 || page == 4.11) {
    text("Bist du sicher, dass du die Messung neu starten möchtest?", 115, 300);
  } else {
    text("Bist du sicher, dass du die Daten löschen möchtest?", 150, 300);
  }
  sicher_ja.show();
  sicher_nein.show();
}

void sicher_tutorial() {
  fill(255, 100, 100);
  rect(225, 250, 830, 200);
  fill(0);
  textSize(30);
  textAlign(CORNER);
  text("Bist du sicher, dass du die Daten löschen möchtest?", 250, 300);
  sicher_ja_reset.show();
  sicher_nein_reset.show();
}

void saveDataInnenraum() {

  String[] T_a = new String[indexInnenraumlufta + indexInnenraumluftb + indexInnenraumluftc];
  String[] H_a = new String[indexInnenraumlufta + indexInnenraumluftb + indexInnenraumluftc];
  String[] TVOC_a = new String[indexInnenraumlufta + indexInnenraumluftb + indexInnenraumluftc];
  String[] CO2_a = new String[indexInnenraumlufta + indexInnenraumluftb + indexInnenraumluftc];
  String[] eCO2_a = new String[indexInnenraumlufta + indexInnenraumluftb + indexInnenraumluftc];

  String txt_ = dateiformat.name;

  if (txt_ == "Format: .txt" || txt_ == "Format: .csv") {
    for (int i = 0; i < indexInnenraumlufta; i++) {
      T_a[i] = str(Innenraumlufta[0][i]).replace('.', ',');
      H_a[i] = str(Innenraumlufta[1][i]).replace('.', ',');
      TVOC_a[i] = str(Innenraumlufta[3][i]).replace('.', ',');
      CO2_a[i] = str(Innenraumlufta[2][i]).replace('.', ',');
      eCO2_a[i] = str(Innenraumlufta[4][i]).replace('.', ',');
    }
    for (int i = indexInnenraumlufta; i < indexInnenraumlufta + indexInnenraumluftb; i++) {
      T_a[i] = str(Innenraumluftb[0][i - indexInnenraumlufta]).replace('.', ',');
      H_a[i] = str(Innenraumluftb[1][i- indexInnenraumlufta]).replace('.', ',');
      TVOC_a[i] = str(Innenraumluftb[3][i- indexInnenraumlufta]).replace('.', ',');
      CO2_a[i] = str(Innenraumluftb[2][i- indexInnenraumlufta]).replace('.', ',');
      eCO2_a[i] = str(Innenraumluftb[4][i- indexInnenraumlufta]).replace('.', ',');
    }
    //    for (int i = indexInnenraumlufta + indexInnenraumluftb; i < indexInnenraumlufta + indexInnenraumluftb + indexInnenraumluftc; i++) {
    //      T_a[i] = str(Innenraumluftc[0][i- (indexInnenraumlufta + indexInnenraumluftb)]).replace('.', ','); 
    //      H_a[i] = str(Innenraumluftc[1][i- (indexInnenraumlufta + indexInnenraumluftb)]).replace('.', ','); 
    //      TVOC_a[i] = str(Innenraumluftc[3][i- (indexInnenraumlufta + indexInnenraumluftb)]).replace('.', ','); 
    //      CO2_a[i] = str(Innenraumluftc[2][i- (indexInnenraumlufta + indexInnenraumluftb)]).replace('.', ','); 
    //      eCO2_a[i] = str(Innenraumluftc[4][i- (indexInnenraumlufta + indexInnenraumluftb)]).replace('.', ',');
    //    };
  }

  if (txt_ == "Format: .txt") {
    saveStrings("Messdaten/" + day() + "_" + month() + "_" + year()+ "/Innenraum/Temperatur.txt", T_a);
    saveStrings("Messdaten/" + day() + "_" + month() + "_" + year()+"/Innenraum/Luftfeuchte.txt", H_a);
    saveStrings("Messdaten/" + day() + "_" + month() + "_" + year()+"/Innenraum/CO2.txt", CO2_a);
    saveStrings("Messdaten/" + day() + "_" + month() + "_" + year() +"/Innenraum/TVOC.txt", TVOC_a);
    saveStrings("Messdaten/" + day() + "_" + month() + "_" + year() +"/Innenraum/eCO2.txt", eCO2_a);
  }

  if (txt_ == "Format: .csv") {
    table.clearRows();
    for (int i = 1; i < (indexInnenraumlufta +indexInnenraumluftb + indexInnenraumluftc); i++) {
      TableRow newRow = table.addRow();
      newRow.setInt("Zeit", i);
      if (i < indexInnenraumlufta) {
        newRow.setFloat("Zeit", Innenraumlufta[6][i]);
        newRow.setFloat("Temperatur", Innenraumlufta[0][i]);
        newRow.setFloat("rel. Luftfeuchte", Innenraumlufta[1][i]);
        newRow.setFloat("CO2", Innenraumlufta[4][i]);
        newRow.setFloat("eCO2", Innenraumlufta[5][i]);
        newRow.setFloat("TVOC", Innenraumlufta[3][i]);
      } else if (i < (indexInnenraumluftb + indexInnenraumlufta)) {
        newRow.setFloat("Zeit", Innenraumluftb[6][i - indexInnenraumlufta]);
        newRow.setFloat("Temperatur", Innenraumluftb[0][i - indexInnenraumlufta]);
        newRow.setFloat("rel. Luftfeuchte", Innenraumluftb[1][i - indexInnenraumlufta]);
        newRow.setFloat("CO2", Innenraumluftb[4][i - indexInnenraumlufta]);
        newRow.setFloat("eCO2", Innenraumluftb[5][i - indexInnenraumlufta]);
        newRow.setFloat("TVOC", Innenraumluftb[3][i - indexInnenraumlufta]);
      } 
      //else if (i < (indexInnenraumluftc + indexInnenraumlufta + indexInnenraumluftb)) {
      //  newRow.setFloat("Zeit", Innenraumluftc[6][i - (indexInnenraumlufta + indexInnenraumluftb)]);
      //  newRow.setFloat("Temperatur", Innenraumluftc[0][i - (indexInnenraumlufta + indexInnenraumluftb)]);
      //  newRow.setFloat("Luftfeuchte", Innenraumluftc[1][i - (indexInnenraumlufta + indexInnenraumluftb)]);
      //  newRow.setFloat("CO2", Innenraumluftc[4][i- (indexInnenraumlufta + indexInnenraumluftb)]);
      //  newRow.setFloat("eCO2", Innenraumluftc[5][i - (indexInnenraumlufta + indexInnenraumluftb)]);
      //  newRow.setFloat("TVOC", Innenraumluftc[3][i - (indexInnenraumlufta + indexInnenraumluftb)]);
      //}
      saveTable(table, "Messdaten/" + day() + "_" + month() + "_" + year()+"/Innenraum/alleDaten.csv");
    }
  }
}


int tagesIndex = 0;




void saveData() {
  cursor(WAIT);

  String[] SCD_T = new String[floor(86400/del)];
  String[] SCD_H = new String[floor(86400/del)];
  String[] SCD_CO2 = new String[floor(86400/del)];

  String[] SGP_TVOC = new String[floor(86400/del)];
  String[] SGP_eCO2 = new String[floor(86400/del)];

  String[] SPS_PM1 = new String[floor(86400/del)];
  String[] SPS_PM25 = new String[floor(86400/del)];
  String[] SPS_PM4 = new String[floor(86400/del)];
  String[] SPS_PM10 = new String[floor(86400/del)];

  String[] Zeit = new String[floor(86400/del)];


  String txt_ = dateiformat.name;

  if (txt_ == "Format: .txt" || txt_ == "Format: .csv") {
    for (int i = 0; i < tagesIndex; i++) {
      SCD_T[i] = str(scd_temperature_data[index - tagesIndex + i]).replace('.', ',');
      SCD_H[i] = str(scd_humidity_data[index - tagesIndex + i]).replace('.', ',');
      SCD_CO2[i] = str(scd_co2_data[index - tagesIndex + i]).replace('.', ',');

      SGP_TVOC[i] = str(sgp_tvoc_data[index - tagesIndex + i]).replace('.', ',');
      SGP_eCO2[i] = str(sgp_eco2_data[index - tagesIndex + i]).replace('.', ',');

      SPS_PM1[i] = str(sps_pm1_data[index - tagesIndex + i]).replace('.', ',');
      SPS_PM25[i] = str(sps_pm25_data[index - tagesIndex + i]).replace('.', ',');
      SPS_PM4[i] = str(sps_pm4_data[index - tagesIndex + i]).replace('.', ',');
      SPS_PM10[i] = str(sps_pm10_data[index - tagesIndex + i]).replace('.', ',');

      Zeit[i] = str((zeit[index - tagesIndex + i]) - zeit[index - tagesIndex]).replace('.', ',');
    }
  }

  if (txt_ == "Format: .txt") {
    saveStrings("Messdaten/" + day() + "_" + month() + "_" + year()+ "/SCD/Temperatur.txt", SCD_T);
    saveStrings("Messdaten/" + day() + "_" + month() + "_" + year()+"/SCD/Luftfeuchte.txt", SCD_H);
    saveStrings("Messdaten/" + day() + "_" + month() + "_" + year()+"/SCD/CO2.txt", SCD_CO2);
    saveStrings("Messdaten/" + day() + "_" + month() + "_" + year() +"/SGP/TVOC.txt", SGP_TVOC);
    saveStrings("Messdaten/" + day() + "_" + month() + "_" + year() +"/SGP/eCO2.txt", SGP_eCO2);
    saveStrings("Messdaten/" + day() + "_" + month() + "_" + year() +"/SPS/PM1.txt", SPS_PM1);
    saveStrings("Messdaten/" + day() + "_" + month() + "_" + year()+ "/SPS/PM25.txt", SPS_PM25);
    saveStrings("Messdaten/" + day() + "_" + month() + "_" + year()+ "/SPS/PM4.txt", SPS_PM4);
    saveStrings("Messdaten/" + day() + "_" + month() + "_" + year() +"/SPS/PM10.txt", SPS_PM10);
    saveStrings("Messdaten/" + day() + "_" + month() + "_" + year() + "/Zeit.txt", time_String);
  }

  if (txt_ == "Format: .csv") {
    table.clearRows();
    for (int i = 0; i < tagesIndex; i++) {
      if (zeit[index-1] != 0) {
        TableRow newRow = table.addRow();
        newRow.setInt("Zeit", i);
        newRow.setString("Zeit", time_String[index - tagesIndex + i + 1]);
        //   newRow.setFloat("Zeit", (zeit[index - tagesIndex + i] - zeit[index - tagesIndex]));
        newRow.setFloat("Temperatur", scd_temperature_data[index - tagesIndex + i]);
        newRow.setFloat("rel. Luftfeuchte", scd_humidity_data[index - tagesIndex + i]);
        newRow.setFloat("CO2", scd_co2_data[index - tagesIndex + i]);
        newRow.setFloat("eCO2", sgp_eco2_data[index - tagesIndex + i]);
        newRow.setFloat("TVOC", sgp_tvoc_data[index - tagesIndex + i]);
        newRow.setFloat("PM1", sps_pm1_data[index - tagesIndex + i]);
        newRow.setFloat("PM2.5", sps_pm25_data[index - tagesIndex + i]);
        newRow.setFloat("PM4", sps_pm4_data[index - tagesIndex + i]);
        newRow.setFloat("PM10", sps_pm10_data[index - tagesIndex + i]);
        try {
          saveTable(table, "Messdaten/" + day() + "_" + month() + "_" + year() + "um" + hour() + "_" + minute()+ "Uhr/alleDaten.csv");
        }
        catch(Exception e) {
          delay(1000);
        }
      }
    }
  }
}



void exit() {
  table.clearRows();
  int temp = 0;
  if (autosave.name == "nicht speichern") {
    temp = index;
    tagesIndex = index;
  } else {
    temp = tagesIndex;
  }


  for (int i = 0; i < temp; i++) {
    if (zeit[index-1] != 0) {
      TableRow newRow = table.addRow();

      newRow.setInt("Zeit", i);
      newRow.setString("Zeit", time_String[index - tagesIndex + i + 1]);
      newRow.setFloat("Temperatur", scd_temperature_data[index - tagesIndex + i]);
      newRow.setFloat("rel. Luftfeuchte", scd_humidity_data[index - tagesIndex + i]);
      newRow.setFloat("CO2", scd_co2_data[index - tagesIndex + i]);
      newRow.setFloat("eCO2", sgp_eco2_data[index - tagesIndex + i]);
      newRow.setFloat("TVOC", sgp_tvoc_data[index - tagesIndex + i]);
      newRow.setFloat("PM1", sps_pm1_data[index - tagesIndex + i]);
      newRow.setFloat("PM2.5", sps_pm25_data[index - tagesIndex + i]);
      newRow.setFloat("PM4", sps_pm4_data[index - tagesIndex + i]);
      newRow.setFloat("PM10", sps_pm10_data[index - tagesIndex + i]);
      try {
        saveTable(table, "Messdaten/" + day() + "_" + month() + "_" + year() + "um" + hour() + "_" + minute()+ "Uhr/alleDaten.csv");
      }
      catch(Exception e) {
        delay(1000);
      }
    }
  }
  super.exit();
}




void keyPressed() {
  if (key == ENTER  && Aufloesung.name == "frei") {
    float w = width;
    float h = height;

    float frac =(w/h);
    if (frac > 1.7777) {
      w = 1.777*h;
    } else if (frac < 1.7777) {
      h = w/1.777;
    }

    scale_factor = w/1280;
    surface.setSize(floor(w), floor(h));
  }


  if (page == 10) {
    if (Kalibrierung2_2.active) {
      if (keyCode == BACKSPACE) {
        if (Kalibrierung_Station2_2.length() > 0 ) {
          Kalibrierung_Station2_2 = Kalibrierung_Station2_2.substring( 0, Kalibrierung_Station2_2.length()- 1 );
        }
      } 
      if (keyCode == DELETE) {
        Kalibrierung_Station2_2 = "" ;
      } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT && Kalibrierung_Station2_2.length() < 5) {
        if (key == '1' || key == '2' || key == '3' || key == '4' || key == '5' || key == '6' || key == '7' || key == '8' || key == '9' || key == '0' || key == '.' || key == ',') {
          Kalibrierung_Station2_2 = Kalibrierung_Station2_2 + key;
        }
      }
    }


    if (Zeit_Station3.active) {
      if (keyCode == BACKSPACE) {
        if (Kalibrierung_Station3.length() > 0 ) {
          Kalibrierung_Station3 = Kalibrierung_Station3.substring( 0, Kalibrierung_Station3.length()- 1 );
        }
      } 
      if (key == '1' || key == '2' || key == '3' || key == '4' || key == '5' || key == '6' || key == '7' || key == '8' || key == '9' || key == '0' || key == '.' || key == ',') {
        Kalibrierung_Station3 = Kalibrierung_Station3 + key;
      }
    }
  }




  if (page == 2) {
    if (a.active) {
      if (keyCode == BACKSPACE) {
        if (myText[0].length() > 0 ) {
          myText[0] = myText[0].substring( 0, myText[0].length()- 1 );
        }
      } else if (keyCode == DELETE) {
        myText[0] = "" ;
      } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT && myText[0].length() < 1) {
        if (key == 'A' || key == 'B' || key == 'C' || key == 'D' || key == 'E') {
          myText[0] = myText[0] + key;
        }
      }
    }

    if (b.active) {
      if (keyCode == BACKSPACE) {
        if (myText[1].length() > 0 ) {
          myText[1] = myText[1].substring( 0, myText[1].length()- 1 );
        }
      } else if (keyCode == DELETE) {
        myText[1] = "" ;
      } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT && myText[1].length() < 1) {
        if (key == 'A' || key == 'B' || key == 'C' || key == 'D' || key == 'E') {
          myText[1] = myText[1] + key;
        }
      }
    }
    if (c.active) {
      if (keyCode == BACKSPACE) {
        if (myText[2].length() > 0 ) {
          myText[2] = myText[2].substring( 0, myText[2].length()- 1 );
        }
      } else if (keyCode == DELETE) {
        myText[2] = "" ;
      } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT && myText[2].length() < 1) {
        if (key == 'A' || key == 'B' || key == 'C' || key == 'D' || key == 'E') {
          myText[2] = myText[2] + key;
        }
      }
    }

    if (d.active) {
      if (keyCode == BACKSPACE) {
        if (myText[3].length() > 0 ) {
          myText[3] = myText[3].substring( 0, myText[3].length()- 1 );
        }
      } else if (keyCode == DELETE) {
        myText[3] = "" ;
      } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT && myText[3].length() < 1) {
        if (key == 'A' || key == 'B' || key == 'C' || key == 'D' || key == 'E') {
          myText[3] = myText[3] + key;
        }
      }
    }

    if (e.active) {
      if (keyCode == BACKSPACE) {
        if (myText[4].length() > 0 ) {
          myText[4] = myText[4].substring( 0, myText[4].length()- 1 );
        }
      } else if (keyCode == DELETE) {
        myText[4] = "" ;
      } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT && myText[4].length() < 1) {
        if (key == 'A' || key == 'B' || key == 'C' || key == 'D' || key == 'E') {
          myText[4] = myText[4] + key;
        }
      }
    }
  }

  if (page == 2) {
    if (a2.active) {
      if (keyCode == BACKSPACE) {
        if (myText2[0].length() > 0 ) {
          myText2[0] = myText2[0].substring( 0, myText2[0].length()- 1 );
        }
      } else if (keyCode == DELETE) {
        myText2[0] = "" ;
      } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT && myText2[0].length() < 1) {
        if (key == 'A' || key == 'B' || key == 'C' || key == 'D' || key == 'E') {
          myText2[0] = myText2[0] + key;
        }
      }
    }

    if (b2.active) {
      if (keyCode == BACKSPACE) {
        if (myText2[1].length() > 0 ) {
          myText2[1] = myText2[1].substring( 0, myText2[1].length()- 1 );
        }
      } else if (keyCode == DELETE) {
        myText2[1] = "" ;
      } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT && myText2[1].length() < 1) {
        if (key == 'A' || key == 'B' || key == 'C' || key == 'D' || key == 'E') {
          myText2[1] = myText2[1] + key;
        }
      }
    }
    if (c2.active) {
      if (keyCode == BACKSPACE) {
        if (myText2[2].length() > 0 ) {
          myText2[2] = myText2[2].substring( 0, myText2[2].length()- 1 );
        }
      } else if (keyCode == DELETE) {
        myText2[2] = "" ;
      } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT && myText2[2].length() < 1) {
        if (key == 'A' || key == 'B' || key == 'C' || key == 'D' || key == 'E') {
          myText2[2] = myText2[2] + key;
        }
      }
    }
    if (d2.active) {
      if (keyCode == BACKSPACE) {
        if (myText2[3].length() > 0 ) {
          myText2[3] = myText[3].substring( 0, myText2[3].length()- 1 );
        }
      } else if (keyCode == DELETE) {
        myText2[3] = "" ;
      } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT && myText2[3].length() < 1) {
        if (key == 'A' || key == 'B' || key == 'C' || key == 'D' || key == 'E') {
          myText2[3] = myText2[3] + key;
        }
      }
    }
    if (e2.active) {
      if (keyCode == BACKSPACE) {
        if (myText2[4].length() > 0 ) {
          myText2[4] = myText[4].substring( 0, myText2[4].length()- 1 );
        }
      } else if (keyCode == DELETE) {
        myText2[4] = "" ;
      } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT && myText2[4].length() < 1) {
        if (key == 'A' || key == 'B' || key == 'C' || key == 'D' || key == 'E') {
          myText2[4] = myText2[4] + key;
        }
      }
    }
  }
}

//void cursorStuff(){
//  try{
//  if(back.isOver() || up1.isOver() || down1.isOver() || up2.isOver() || down2.isOver() || left1.isOver() || right1.isOver() || start_stopp.isOver() || x_up.isOver() || x_down.isOver() || y_up.isOver() || y_down.isOver() || reset.isOver() || sicher_ja.isOver() || sicher_nein.isOver() || aktualisierung_right.isOver() || aktualisierung_left.isOver() || Stationen.isOver() || Sensoren.isOver() || zumObermenu.isOver() || SPS30.isOver() || SGP30.isOver() || SCD30.isOver() || alle_Sensoren.isOver() || alle_Sensoren2.isOver() || einstellungen.isOver() || Port1.isOver() || Port2.isOver() || Port3.isOver() || Port4.isOver() || Port5.isOver() || Port6.isOver() || station1_referenz.isOver() || station1_trocken.isOver() || station1_nass.isOver() || station1_MessungStarten.isOver() || station1_MessungWiederholen.isOver() || station1_weiter_ab.isOver() || station1_weiter_bc.isOver() || station1_zur_Auswertung.isOver() || TVOC_Duelle_Start.isOver() || naechstes_Duell.isOver() || vorheriges_Duell.isOver() || weiter_zum_Sensor.isOver() || naechster_Stoff.isOver() || vorheriger_Stoff.isOver() || zur_Auswertung.isOver() || zur_Auswertung2.isOver() || zur_Auswertung3.isOver() || Sensormessung.isOver() || messen.isOver() || letzteWiederholen.isOver() || ja_zufrieden.isOver() || reset_Station2.isOver() || reset_innenraum.isOver() || Station4a.isOver() || Station4b.isOver() || Station4c.isOver() || Station4Auswertung.isOver() || Station4Start.isOver() || station4_MessungWiederholen.isOver() || zero.isOver() || fifty.isOver() || hundred.isOver() || genaueAnalyse.isOver() || up2_Station4.isOver() || down2_Station4.isOver() || tutorial_ueberspringen.isOver() || tutorial_weiter.isOver() || tutorial_zum.isOver() || tutorial_back.isOver() || tutorial_Start_Stopp.isOver() || tutorial_skalierung_rot_up.isOver() || tutorial_skalierung_rot_down.isOver() || tutorial_skalierung_blau_up.isOver() || tutorial_skalierung_blau_down.isOver() || tutorial_reset.isOver() || sicher_ja_reset.isOver() || sicher_nein_reset.isOver() || left_tutorial.isOver() || right_tutorial.isOver() || aktualisierung_right_tutorial.isOver() || aktualisierung_left_tutorial.isOver() || setBaseline.isOver()){
//    cursor(HAND);
//  }else{
//    cursor(ARROW);
//  }
//  }catch(Exception e){

//  }

//}



class Textfield22 {
  float x, y, dx, dy;
  String text;
  boolean active;

  Textfield22(float x_, float y_, float dx_, float dy_, String text_, boolean active_) {
    x = x_;
    y = y_;
    dx = dx_;
    dy = dy_;
    text = text_;
    active = active_;
  }


  void show(String txt) {
    if (this.active) {
      fill(200);
      stroke(0);
      rect(x, y, dx, dy);
      if (round(millis()/500) % 2 == 0) {
        stroke(0);
      } else {
        stroke(200);
      }

      line(x + dx/2 + textWidth(txt)/2, y + 10, x + dx/2 + textWidth(txt)/2, y + dy - 10);
    } else {
      fill(255);
      stroke(0);
      rect(x, y, dx, dy);
    }


    fill(0);
    textAlign(CENTER);
    text(txt, x + dx/2, y + dy/2 + 10);
  }

  //  boolean isActive() {
  //    return(mouseX > x*scale_factor && mouseX < (x + dx)*scale_factor && mouseY > y*scale_factor && mouseY < (y + dy)*scale_factor);
  //  }
}





class Textfield {
  float x, y, dx, dy;
  String text;
  boolean active;

  Textfield(float x_, float y_, float dx_, float dy_, String text_, boolean active_) {
    x = x_;
    y = y_;
    dx = dx_;
    dy = dy_;
    text = text_;
    active = active_;
  }


  void show(String txt) {
    if (this.active) {
      fill(200);
      stroke(0);
      rect(x, y, dx, dy);
      if (round(millis()/500) % 2 == 0) {
        stroke(0);
      } else {
        stroke(200);
      }

      line(x + dx/2 + textWidth(txt)/2, y + 10, x + dx/2 + textWidth(txt)/2, y + dy - 10);
    } else {
      fill(255);
      stroke(0);
      rect(x, y, dx, dy);
    }


    fill(0);
    textAlign(CENTER);
    text(txt, x + dx/2, y + dy/2 + 10);
  }

  //  boolean isActive() {
  //    return(mouseX > x*scale_factor && mouseX < (x + dx)*scale_factor && mouseY > y*scale_factor && mouseY < (y + dy)*scale_factor);
  //  }
}

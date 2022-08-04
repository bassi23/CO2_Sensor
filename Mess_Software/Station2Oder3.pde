void Station2Oder3() {
  two_a.show();
  two_b.show();
  one.hide();
  two.hide();
  three.hide();
  four.hide();

  textSize(20);
  fill(0);

  textAlign(CENTER);
  textSize(20);
  text("Wie gut ist eure Nase? Findet es heraus und\ntretet gegen einen Sensor an.\n\nOrdnet 5 verschiedene Ethanolkonzentrationen\nder Größe nach an.", 330, 300);
  text("Untersucht Produkte des Alltags auf ihre\nEmission von Schadstoffen.\n\nHalten Alternativen, was sie versprechen?", 970, 300);

  image(Vorschau_Station2, 230, 450);
  image(Stoff1_bild, 850, 550);
  image(Stoff2_bild, 1050, 550);
  textSize(40);
  text("vs.", 1010, 605);
  textSize(20);
  image(blauer_engel, 855, 420);
  image(blauer_engel, 1050, 420);
  strokeWeight(4);
  stroke(255, 0, 0);
  line(850, 420, 950, 520);
  line(950, 420, 850, 520);
  noStroke();
  strokeWeight(1);
}

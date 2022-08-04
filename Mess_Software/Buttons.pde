class button {
  float x, y, dx, dy, textOffset;
  String text;
  boolean visible;
  int size;
  button(float x_, float y_, float dx_, float dy_, String text_, float textOffset_, boolean visible_, int size_) {
    x = x_;
    y = y_;
    dx = dx_;
    dy = dy_;
    text = text_;
    textOffset = textOffset_;
    visible = visible_;
    size = size_;
  }
  void show() {
    visible = true;
    pushMatrix();
    if (mouseX > x*scale_factor && mouseX < (x+dx)*scale_factor && (mouseY - scroll) > y*scale_factor && (mouseY - scroll) < (y + dy)*scale_factor) {
      for (float i = 0; i<dy; i += 1/scale_factor) {
        stroke(205 + i*50/dy);
        line(x, y+i, x + dx, y+i);
      }
      fill(255);
    } else {
      fill(200);
      for (float i = 0; i<dy; i+=1/scale_factor) {
        stroke(255 - (i)*50/dy);
        line(x, y+(i), x + dx, y+(i));
      }
    }
    rectMode(CORNER);
    stroke(0);
    strokeWeight(1);
    noFill();
    rect(x, y, dx, dy); 
    fill(0);
    textSize(20);
    textAlign(CENTER);
    noStroke();
    if (text == "up_arrow") {
      stroke(0);
      strokeWeight(2);
      line(x + dx/2, y + dy/4, x + dx/2, y + 3*dy/4);
      line(x + dx/2, y + dy/4, x + dx/4, y + 0.5*dy);
      line(x + dx/2, y + dy/4, x + 3*dx/4, y + 0.5*dy);
    } else if (text == "down_arrow") {
      stroke(0);
      strokeWeight(2);
      line(x + dx/2, y + dy/4, x + dx/2, y + 3*dy/4);
      line(x + dx/2, y + 3*dy/4, x + dx/4, y + 0.5*dy);
      line(x + dx/2, y + 3*dy/4, x + 3*dx/4, y + 0.5*dy);
    } else if (text == "left_arrow") {
      stroke(0);
      strokeWeight(2);
      line(x + dx/4, y + dy/2, x + 3*dx/4, y + dy/2);
      line(x + dx/4, y + dy/2, x + dx/2, y + dy/4);
      line(x + dx/4, y + dy/2, x + dx/2, y + 3*dy/4);
    } else if (text == "right_arrow") {
      stroke(0);
      strokeWeight(2);
      line(x + dx/4, y + dy/2, x + 3*dx/4, y + dy/2);
      line(x + 3*dx/4, y + dy/2, x + dx/2, y + dy/4);
      line(x + 3*dx/4, y + dy/2, x + dx/2, y + 3*dy/4);
    } else {
      textSize(size);
      if (text == "TVOC, eCO2") {
        textSize(size);
        text("TVOC, eCO", x + dx/2, y + dy/2 + textOffset);
        textSize(30);
        text("2", 1015, 235);
      } else if (text == "Temperatur,\nrel. Luftfeuchte,\nCO2") {
        textSize(size);
        text("Temperatur,\nrel. Luftfeuchte,\nCO", x + dx/2, y + dy/2 + textOffset);
        textSize(30);
        text("2", 365, 655);
      } else if (text == "zu Aufgabe b)" || text == "zu Aufgabe c)" || text == "zur Auswertung") {
        if (frameCount%60 > 50) {
          fill(220);
        } else {
          fill(0);
        }
        text(text, x + dx/2, y + dy/2 + textOffset);
      } else {
        text(text, x + dx/2, y + dy/2 + textOffset);
      }
    }
    strokeWeight(1);
    popMatrix();
    textAlign(CORNER);
  }
  void hide() {
    visible = false;
  }
  boolean isOver(){
    return (mouseX > x*scale_factor && mouseX < (x+dx)*scale_factor && (mouseY-scroll) > y*scale_factor && (mouseY-scroll) < (y + dy)*scale_factor && visible);
  }
  
  boolean isClicked() {
    if (mousePressed && mouseX > x*scale_factor && mouseX < (x+dx)*scale_factor && (mouseY-scroll) > y*scale_factor && (mouseY-scroll) < (y + dy)*scale_factor && visible) {
      delay(120);
      visible = false;
      return true;
    } else {
      return false;
    }
  }
}

// eigene dropdown klasse
class dropdown {
  float x, y, dx, dy;
  String[] options = new String[16];
  String name;
  int nOO;
  boolean active;
  color c;
  dropdown(String name_, float x_, float y_, float dx_, float dy_, int nOO_, String [] options_, boolean active_, color c_) {
    x = x_;
    y = y_;
    dx = dx_;
    dy = dy_;
    nOO = nOO_;
    name = name_;
    active = active_;
    c = c_;
    for (int i = 0; i < nOO; i++) {
      options[i] = options_[i];
      if (options[i] == "eCO2") {
        options[i] = "eCO";
      }
      if (options[i] == "CO2") {
        options[i] = "CO";
      }
    }
  }
  boolean[] options_activated = new boolean[16];
  void show() {
    textSize(0.6*dy);
    textAlign(LEFT);
    for (int i = 0; i < nOO; i++) {
      options_activated[i] = false;
    }
    if (active) {
      for (int i = 0; i < nOO; i++) {
        if (mouseX > x*scale_factor && mouseX < (x+dx)*scale_factor && (mouseY-scroll)  > (y + dy + i*dy)*scale_factor && (mouseY-scroll)  < (y + dy + (i+1)*dy)*scale_factor) {
          options_activated[i] = true;
          if (mousePressed) {
            name = options[i];
          }
        }
      }
    } else {
      cursor(ARROW);
    }

    if (c == color(255, 0, 0) ) {
      fill(255, 150, 150);
    } else if (c == color(0, 0, 255)) {
      fill(150, 150, 255);
    } else if (c == color(0, 255, 0)) {
      fill(150, 255, 150);
    } else {
      fill(220);
    }
    stroke(0);
    rect(x, y, dx, dy);
    fill(0);
    if (name == "eCO2" || name == "eCO") {
      name = "eCO";
      text(name, x + 20, y + 0.7*dy);
      textSize(0.45*dy);
      text("2", x + 55, y + 0.82*dy);
    } else if (name == "CO2" || name == "CO") {
      name = "CO";
      text(name, x + 20, y + 0.7*dy);
      textSize(0.45*dy);
      text("2", x + 45, y + 0.82*dy);
    } else {
      textSize(0.6*dy);
      text(name, x + 20, y + 0.7*dy);
    }
    if (active) {
      for (int i = 0; i < nOO; i++) {
        if (options_activated[i]) {
          if (c == color(255, 0, 0) ) {
            fill(255, 220, 220);
          } else if (c == color(0, 0, 255)) {
            fill(220, 220, 255);
          } else if (c == color(0, 255, 0)) {
            fill(220, 255, 220);
          } else {
            fill(255);
          }
          rect(x, y + dy + dy*i, dx, dy);
        } else {
          if (c == color(255, 0, 0) ) {
            fill(255, 200, 200);
          } else if (c == color(0, 0, 255)) {
            fill(200, 200, 255);
          } else if (c == color(0, 255, 0)) {
            fill(200, 255, 200);
          } else {
            fill(220);
          }
          rect(x, y + dy + dy*i, dx, dy);
        }
        fill(0);

        textSize(0.6*dy);
        text(options[i], x + 50, y + dy + i*dy + 0.7*dy);
        textSize(0.45*dy);
        if (options[i] == "eCO") {
          text("2", x + 85, y + dy + i*dy + 0.82*dy);
        }
        if (options[i] == "CO") {
          text("2", x + 75, y + dy + i*dy + 0.82*dy);
        }
        line(x + 10, y + i*dy + 1.3*dy, x + 17, y + i*dy + 1.5*dy);
        line( x + 17, y + i*dy + 1.5*dy, x + 10, y + i*dy + 1.7*dy);
      }
    }
    if (mouseX > x*scale_factor && mouseX < (x + dx)*scale_factor && (mouseY-scroll)  > y*scale_factor && (mouseY-scroll)  < (y + dy)*scale_factor) {
      if (mousePressed) {
        if (active) {
          active = false;
        } else {
          active = true;
        }
        delay(100);
      }
    } else if (mousePressed) {
      active = false;
    }


    stroke(0);
    line(x + dx - 15, y + dy/2, x + dx + -10, y + 3*dy/4);
    line(x + dx + -10, y + 3*dy/4, x + dx - 5, y + dy/2);
  }
}




class checkbox {
  float x, y, size;
  boolean checked;
  checkbox(float x_, float y_, float size_, boolean checked_) {
    x = x_;
    y = y_;
    size = size_;
    checked = checked_;
  }

  void show() {
    if (isOver()) {
      fill(245);
    } else {
      fill(230);
    }

    if (isClicked()) {
      if (checked) {
        checked = false;
      } else {
        checked = true;
      }
    }
    stroke(0);
    rect(x, y, size, size);

    fill(0);
    stroke(0);
    if (checked) {
      stroke(0, 255, 0);
      fill(10, 255, 10);
      strokeWeight(3);
      line(x + size*0.1, y + size*0.6, x + size*0.4, y + size*0.9);
      line(x + size*0.4, y + size*0.9, x + size*0.9, y + size*0.1);
    } else {
      stroke(255, 0, 0);
      fill(255, 10, 10);
      strokeWeight(3);
      line(x + size*0.1, y + size*0.1, x + size*0.9, y + size*0.9);
      line(x + size*0.1, y + size*0.9, x + size*0.9, y + size*0.1);
    }
    strokeWeight(1);
  }

  boolean isOver() {
    return (mouseX > x*scale_factor && mouseX < (x + size)*scale_factor && mouseY > y*scale_factor && mouseY < (y + size)*scale_factor);
  }

  boolean isClicked() {
    if (isOver() && mousePressed) {
      delay(100);
    }
    return(isOver() && mousePressed);
  }
}

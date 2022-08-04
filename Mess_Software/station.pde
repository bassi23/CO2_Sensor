class station {
  float x;
  float y;
  boolean active;

  station(float x_, float y_, boolean active_) {
    x = x_;
    y = y_;
    active = active_;
  }
    void show() {
      if (mouseX > x*scale_factor && mouseX < (x + 400)*scale_factor && (mouseY - scroll) > y*scale_factor && (mouseY - scroll) < (y + 300)*scale_factor) {
        fill(150, 255, 150);
      } else {
        fill(0, 200, 00);
      }
      rect(x, y, 400, 300);
    }
    boolean isOver() {
      if (mouseX > x*scale_factor && mouseX < (x + 400)*scale_factor && (mouseY - scroll) > y*scale_factor && (mouseY - scroll) < (y + 300)*scale_factor && active) {
        return true;
      } else {
        return false;
      } 
    }
    boolean isClicked() {
      if (this.isOver() && mousePressed && active) {
        return true;
      } else {
        return false;
      }
    }
}

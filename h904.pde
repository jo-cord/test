void setup() {
  size(500, 500);
  mijnmethode(100, 100, 100, 100);
}

void mijnmethode(int x, int y, int breedte, int hoogte) {
  line(x, y, x + breedte, y);
  line(x + breedte, y, x + breedte, y + hoogte);
  line(x + breedte, y + hoogte, x, y + hoogte);
  line(x, y + hoogte, x, y);
}

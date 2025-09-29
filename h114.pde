int[] hallo = new int[10];

void setup() {
  for (int i = 0; i < hallo.length; i++) {
    hallo[i] = (i + 1) * 12;
  }
  
  println(hallo);
}

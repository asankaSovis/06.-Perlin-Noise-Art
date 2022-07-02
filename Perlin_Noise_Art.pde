float sampleDistance = 0.02; // Distance between each sampling
int[] hues = {51, 102, 153, 204, 255}; // Separating the hue into 5 steps
// (Can change these values to anything between 0 and 255)

void setup() {
  // Setup the width and height of the canvase
  // We also change the colour mode to HSB
  size(600, 600);
  colorMode(HSB);
}

void draw() {
  // Set the background to black, no stroke
  background(0);
  noStroke();
  
  // Selecting a random sampling area of the noise space
  noiseSeed((int)random(100));
  
  // For the length and width we sample a noise value from that
  // noise space at a distance defined by sampleDistance
  // This sampled value is mapped between 0 and size of hues array
  // and is assigned to the hueID variable
  // This variable is used to get a hue value from hues array and
  // set it as the colout of the fill
  for(int i = 0; i < width; i++) {
    for(int j = 0; j < height; j++) {
      float noiseSample = noise(i * sampleDistance, j * sampleDistance);
      int hueID = (int)map(noiseSample, 0, 1, 0, hues.length);
      
      fill(hues[hueID], 250, 250);
      circle(i, j, 1);
    }
  }
  
  noLoop();
}

void mouseClicked() {
  // We rerun the loop
  loop();
}

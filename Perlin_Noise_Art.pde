float sampleDistance = 0.02; // Distance between each sampling

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
  // This sampled value is mapped between 0 and 255 and is assigned
  // to the brightness variable
  // This variable is used to set the colour of the point we draw
  for(int i = 0; i < width; i++) {
    for(int j = 0; j < height; j++) {
      float noiseSample = noise(i * sampleDistance, j * sampleDistance);
      int brightness = (int)map(noiseSample, 0, 1, 0, 255);
      
      fill(brightness);
      circle(i, j, 1);
    }
  }
  
  noLoop();
}

void mouseClicked() {
  // We rerun the loop
  loop();
}

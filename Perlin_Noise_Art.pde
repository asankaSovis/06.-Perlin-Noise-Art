float sampleDistance = 0.02; // Distance between each sampling
// Defining a colour palette
color[] palette = {#10454F, #506266, #818274, #A3AB78, #BDE038};
// Here we define our own custom palette

void setup() {
  // Setup the width and height of the canvase
  size(600, 600);
}

void draw() {
  // Set the background to black, no stroke
  background(0);
  noStroke();
  
  // Selecting a random sampling area of the noise space
  noiseSeed((int)random(100));
  
  // For the length and width we sample a noise value from that
  // noise space at a distance defined by sampleDistance
  // This sampled value is mapped between 0 and size of palette array
  // and is assigned to the hueID variable
  // This variable is used to get a colour from thepalette array and
  // set it as the colout of the fill
  for(int i = 0; i < width; i++) {
    for(int j = 0; j < height; j++) {
      float noiseSample = noise(i * sampleDistance, j * sampleDistance);
      int colourID = (int)map(noiseSample, 0, 1, 0, palette.length);

      fill(palette[colourID]);
      circle(i, j, 1);
    }
  }
  
  noLoop();
}

void mouseClicked() {
  // We rerun the loop
  loop();
}

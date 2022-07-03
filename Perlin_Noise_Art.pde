/* PERLIN NOISE ART ----------------------------------------------------------

Perlin Noise is a form of gradient noise used extensively in visual
applications. Developed by Ken Perlin in 1983, the Perlin Noise algorithm
creates randomness with a structure. In modern days, it is used from
simple art generation to terrain generation in video games. In this
article, we will try to generate art using Perlin Noise.
Check out my blog post:
        https://asanka.hashnode.dev/06-perlin-noise-art-art-from-noise
        https://asanka-sovis.blogspot.com/2022/07/06-perlin-noise-art-art-from-noise.html
Coded by Asanka Akash Sovis

-----------------------------------------------------------------------------*/

// Defining global variables
float sampleDistance = 0.01; // Distance between each sampling
// Defining a colour palette
color[][] palette = {
  {#223240, #3B8C66, #347355, #60BF81, #93D94E},
  {#265C4B, #146551, #007566, #589A8D, #8FC1B5}
};
// Here we define multiple palettes and randomly pick each palette
// to create noise
int multiple = 4; // Number of times the same palette is used

void setup() {
  // Setup the width and height of the canvase
  size(800, 600);
  background(0);
}

void draw() {
  // Set the background to black, no stroke
  //background(0);
  noStroke();
  
  // Selecting a random sampling area of the noise space
  noiseSeed((int)random(100));
  
  // For the length and width we sample a noise value from that
  // noise space at a distance defined by sampleDistance
  // This sampled value is mapped between 0 and size of palette array
  // times the multiple and is assigned to the colourID variable
  // This variable is used to get a colour from the palette array and
  // set it as the colout of the fill
  // When we get this colour, we make sure to modulo this with the length
  // of the palette to make sure each colour is reused
  // However, we also choose which palette by choosing it at random
  // to create a noise effect
  for(int i = 0; i < width; i++) {
    for(int j = 0; j < height; j++) {
      float noiseSample = noise(i * sampleDistance, j * sampleDistance);
      int colourID = (int)map(noiseSample, 0, 1, 0, palette[1].length * multiple);

      fill(palette[(int)random(palette.length)][colourID % palette[1].length], 150);
      circle(i, j, 1);
    }
  }
  
  // We will add some text to the design
  fill(#ECD7DA);
  textAlign(CENTER);
  textSize(70);
  text("PERLIN NOISE ART", width / 2, 200);
  textSize(20);
  text("BY ASANKA SOVIS", width / 2, 230);
  
  //saveFrame("Output\\Perlin Noise-" + str(frameCount) + ".png"); // Saves the current frame. Comment if you don't need
  //noLoop();
}

void mouseClicked() {
  // We rerun the loop
  loop();
}

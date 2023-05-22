import processing.core.PImage;
PImage img;
PFont font;

int numTexts = 5; // Number of texts to display
float[] textX; // Array to store the x-coordinate of each text
float[] textY; // Array to store the y-coordinate of each text

int currentProjectIndex = 0; // Current project index

void setup() {
  size(1280, 720, P3D); // Set the size of the 3D sketch window
  
  font = createFont("Facade-Ouest", 36);
  textAlign(LEFT); // Set text alignment to the center
  textFont(font);
  textSize(32); // Set the text size

  textX = new float[numTexts]; // Initialize the textX array
  textY = new float[numTexts]; // Initialize the textY array
  
  for (int i = 0; i < numTexts; i++) {
    textX[i] = 0;
    textY[i] = 0;
  }

  updateTextPositions(); // Initial update of text positions
  loadImageForCurrentProject(); // Load the image for the current project
}

void draw() {
  background(#f1f1f1); // Clear the screen

  for (int i = 0; i < numTexts; i++) {
    // Set a different fill color for the text
    fill(0); // Black color

    // Display the text at the updated position
    text(nfts[currentProjectIndex].texts[i], textX[i], textY[i]);
  }
  
  //Rasterization Algorithm (grid of square tiles)
  fill(#222222);
  noStroke();
  float tiles = 250; // Max 150 Min 40
  float tileSize = width/tiles;

  translate(width / 2, height / 2);
  rotateY(radians(frameCount));
 
  for (int x = 0; x < tiles; x++){
    for (int y = 0; y < tiles; y++){
      
      color c = img.get(int(x * tileSize), int(y * tileSize)); // Get colour of the pixel and calculate the size of the tile  
      float b = map(brightness(c), 0, 255, 0, 1); // Calculate the brightness
      
      float z = map(b, 1, 0, -100, 100); // Get salience
      
      push();
      translate( x * tileSize - width / 2, y * tileSize - height / 2, z);
      ellipse(0,0,tileSize * b, tileSize * b );
      pop();
    }
  }
  println(currentProjectIndex);
}


void updateTextPositions() {
  for (int i = 0; i < numTexts; i++) {
    boolean overlap = true;
    
    int maxAttempts = 1000;
    int currAttempt = 0;
    // Generate random positions until no overlap occurs
    while (overlap && currAttempt < maxAttempts) {
      // Generate random position for each text
      float x = random(textWidth(nfts[currentProjectIndex].texts[i]), width - textWidth(nfts[currentProjectIndex].texts[i]));
      float y = random(textAscent() * 2, height - textDescent() * 2);
      currAttempt++;
      // Check for overlap with previously positioned texts
      overlap = false;
      for (int j = 0; j < i; j++) {
        if (dist(x, y, textX[j], textY[j]) < textWidth(nfts[currentProjectIndex].texts[i])) {
          overlap = true;
          break;
        }
      }

      // Assign the position if there is no overlap
      if (!overlap) {
        textX[i] = x;
        textY[i] = y;
      }
    }
  }
}

void loadImageForCurrentProject() {
  String imagePath = nfts[currentProjectIndex].imagePath;
  img = loadImage(imagePath);
}

void keyPressed() {
  if (keyCode == RIGHT && currentProjectIndex<=nfts.length ) {
    currentProjectIndex = (currentProjectIndex + 1) % nfts.length; // Wrap around to the beginning if the index goes beyond the array lengt
    updateTextPositions();
    loadImageForCurrentProject();
  } 
}

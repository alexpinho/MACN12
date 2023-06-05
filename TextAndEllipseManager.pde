import processing.core.PGraphics;
import processing.core.PImage;
import processing.core.PFont;
import processing.core.PApplet;

class TextAndEllipseManager {
  PImage img;
  PFont font;

  int numTexts = 5; // Number of texts to display
  float[] textX; // Array to store the x-coordinate of each text
  float[] textY; // Array to store the y-coordinate of each text

  PApplet MACN12; // Referência ao MACN12 principal

  TextAndEllipseManager(PApplet MACN12) {
    this.MACN12 = MACN12;
    font = createFont("Facade-Ouest", 36);
    MACN12.textAlign(LEFT); // Set text alignment to the center
    MACN12.textFont(font);
    MACN12.textSize(32); // Set the text size

    textX = new float[numTexts]; // Initialize the textX array
    textY = new float[numTexts]; // Initialize the textY array
    
    for (int i = 0; i < numTexts; i++) {
      textX[i] = 0;
      textY[i] = 0;
    }
  }

  void updateTextPositions() {
    for (int i = 0; i < numTexts; i++) {
      boolean overlap = true;
      
      int maxAttempts = 1000;
      int currAttempt = 0;
      // Generate random positions until no overlap occurs
      while (overlap && currAttempt < maxAttempts) {
        // Generate random position for each text
        float x = MACN12.random(MACN12.textWidth(nfts[currentProjectIndex].texts[i]), MACN12.width - MACN12.textWidth(nfts[currentProjectIndex].texts[i]));
        float y = MACN12.random(MACN12.textAscent() * 2, MACN12.height - MACN12.textDescent() * 2);
        currAttempt++;
        // Check for overlap with previously positioned texts
        overlap = false;
        for (int j = 0; j < i; j++) {
          if (dist(x, y, textX[j], textY[j]) < MACN12.textWidth(nfts[currentProjectIndex].texts[i])) {
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
    img = MACN12.loadImage(imagePath);
  }

  void displayTexts(PGraphics canvas) {
    for (int i = 0; i < numTexts; i++) {
      // Set a different fill color for the text
      canvas.fill(0); // Black color

      // Display the text at the updated position
      canvas.text(nfts[currentProjectIndex].texts[i], textX[i], textY[i]);
    }
  }

  void displayEllipses(PGraphics canvas) {
    canvas.fill(#222222);
    canvas.noStroke();
    float tiles = 250; // Max 150 Min 40
    float tileSize = MACN12.width / tiles;
  
    canvas.translate(MACN12.width / 2, MACN12.height / 2);
    canvas.rotateY(radians(MACN12.frameCount));
   
    for (int x = 0; x < tiles; x++) {
      for (int y = 0; y < tiles; y++) {
        
        color c = img.get(int(x * tileSize), int(y * tileSize)); // Get colour of the pixel and calculate the size of the tile  
        float b = map(brightness(c), 0, 255, 0, 1); // Calculate the brightness
        
        float z = map(b, 1, 0, -100, 100); // Get salience
        
        canvas.push();
        canvas.translate(x * tileSize - MACN12.width / 2, y * tileSize - MACN12.height / 2, z);
        canvas.ellipse(0, 0, tileSize * b, tileSize * b);
        canvas.pop();
      }
    }
  }
}

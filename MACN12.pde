import java.nio.file.Paths;

boolean export = false;
String outputFolder;

int currentProjectIndex = 0; // Current project index

TextAndEllipseManager textAndEllipseManager; 

void setup() {
  size(1280, 720, P3D); // Set the size of the 3D sketch window
  smooth(8);
  frameRate(30);
  

  textAndEllipseManager = new TextAndEllipseManager(this); // Inicializar a classe TextAndEllipseManager
  textAndEllipseManager.updateTextPositions(); // Initial update of text positions
  textAndEllipseManager.loadImageForCurrentProject(); // Load the image for the current project
  
  setOutputFolder();
}

void draw() {
  background(#f1f1f1); // Clear the screen
  textAndEllipseManager.displayTexts(getGraphics()); // Display the texts
  textAndEllipseManager.displayEllipses(getGraphics()); // Display the ellipses
  
  if (export) {
    String outputPath = Paths.get(outputFolder, "frame_" + nf(frameCount, 8)).toString();
    save(outputPath + ".png");
    println("Frame " + frameCount + " saved to: " + outputPath);
  }
}


void keyPressed() {
  if (keyCode == RIGHT && currentProjectIndex <= nfts.length) {
    currentProjectIndex = (currentProjectIndex + 1) % nfts.length; // Wrap around to the beginning if the index goes beyond the array length
    textAndEllipseManager.updateTextPositions();
    textAndEllipseManager.loadImageForCurrentProject();
  } 
}

void keyReleased() {
  if (key == 'e') {
    export = !export;
    if (export) {
      setOutputFolder();
    }
  }
}

void setOutputFolder() {
  outputFolder = Paths.get(sketchPath("outputs"), "sequence_" + System.currentTimeMillis()).toString();
}

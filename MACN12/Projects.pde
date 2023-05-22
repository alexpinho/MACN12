class Projeto {
  String[] texts;
   String imagePath; // Add imagePath variable

  Projeto(String[] texts, String imagePath) {
    this.texts = texts;
    this.imagePath = imagePath; // Initialize imagePath
  }
}

Projeto[] nfts = {
  new Projeto(new String[] {
    "Oscar Niemeyer",
    "01",
    "Vista exterior esquemática",
    " ",
    "MACN"
  }, "Vista_exterior.png"),
  
  new Projeto(new String[] {
    "Oscar Niemeyer",
    "02",
    "Vista Interior esquemática",
    " ",
    "MACN"
  }, "Vista_interior_1.png"),
  
  new Projeto(new String[] {
    "Oscar Niemeyer",
    "03",
    "Vista Interior esquemática",
    " ",
    "MACN"
  }, "Vista_interior_2.png"),
  
  new Projeto(new String[] {
    "Oscar Niemeyer",
    "04",
    "Vista de topo",
    " ",
    "MACN"
  }, "Vista_topo.png"),
  
  new Projeto(new String[] {
    "Oscar Niemeyer",
    "05",
    "Etapa da obra 1",
    "Fundação",
    "MACN"
  }, "etapa_1.png"),
  
  new Projeto(new String[] {
    "Oscar Niemeyer",
    "06",
    "Etapa da obra 2",
    "Núcleo",
    "MACN"
  }, "etapa_2.png"),
  
  new Projeto(new String[] {
    "Oscar Niemeyer",
    "07",
    "Etapa da obra 3",
    "Colunas Nível 1",
    "MACN"
  }, "etapa_3.png"),
  
  new Projeto(new String[] {
    "Oscar Niemeyer",
    "08",
    "Etapa da obra 4",
    "Colunas Nível 2",
    "MACN"
  }, "etapa_4.png"),
  
  new Projeto(new String[] {
    "Oscar Niemeyer",
    "09",
    "Etapa da obra 5",
    "Cobertura",
    "MACN"
  }, "etapa_5.png"),
  
  new Projeto(new String[] {
    "Oscar Niemeyer",
    "10",
    "Vista exterior",
    " ",
    "MACN"
  }, "Vista_exterior-img.png"),
  
  new Projeto(new String[] {
    "Oscar Niemeyer",
    "11",
    "Vista interior",
    " ",
    "MACN"
  }, "Vista_interior.png"),
  
  new Projeto(new String[] {
    "Oscar Niemeyer",
    "12",
    "Autor",
    " ",
    "MACN"
  }, "oscar.png")
};

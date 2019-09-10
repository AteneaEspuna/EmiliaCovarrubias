class Cartas
{
  PImage imagenCarta;
  int mostrar = 0;
  int cartaX = 0;
  int cartaY = 0;
  int valor = 0;
  String[] nombreCarta= {"00cards.png","00cardscopia.png", "01cards.png", "02cards.png", "03cards.png", "04cards.png", "05cards.png", "06cards.png", "07cards.png", "08cards.png", };
  
  Cartas(int x, int y, int v)
  {
    cartaX = x;
    cartaY = y;
    valor = v;
  }
  void desplegar()
  {
    imagenCarta = loadImage(nombreCarta[mostrar]);
    image(imagenCarta, cartaX, cartaY);
  }
  void desplegarfrente()
  {
    mostrar = valor;
  }
  void bocaAbajo()
  {
    mostrar = 0;
  }
  void comparar()
  {
    cartaX = -150;
  }
}
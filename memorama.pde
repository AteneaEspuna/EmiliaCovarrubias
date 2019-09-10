Cartas[] miCarta = new Cartas[16];
int[] x = new int[16];
int[] y = new int[16];
int[] v = new int[16];
int[]verValor = new int[2];
int[]cartasGiradas = new int[2];
boolean[] clickeado = new boolean[16];
PImage ganaste;
PFont miFuente;
int volteada = 0;
int n = 0;
int ganar = 0;

void setup()
{
  int miX = 15;
  int miY = 15;
  int miV = 0;
  int cuenta = 1;
  size (1000, 600);
  //fullScreen();
  miFuente = createFont("Verdana", 40, true);
  ganaste = loadImage("ganaste.png");
  
  for (int i = 0; i<16; i++)
  {
    clickeado[i] = false;
    y[i] = miY;
    x[i] = miX;
    v[i] = cuenta;
    cuenta +=1;
    if (cuenta == 9)
    {
      cuenta = 1;
    }
    if (miX<710)
    {
      miX += 115;
    } else if (miX > 710)
    {
      miX = 15;
      miY += 250;
    } 
  }
  
  shuffle();
  
  for (int i=0; i<16; i++)
  { 
    miCarta[i] = new Cartas (x[i], y[i], v[i]);
  }
}

void draw()
{
  textFont(miFuente);
  fill(0);
  background(255);
  for (int i=0; i<16; i++)
  {
    miCarta[i].desplegar();
  }
    if (ganar == 8)
    {
      image (ganaste, 0, 0);
      text("¡Ganaste!", 30, 100);
    }
}


void mouseClicked()
{
  for (int i=0; i<16; i++)
  {
    if (mouseX > x[i] && mouseX < (x[i] + 105) && mouseY > y[i] && mouseY < y[i]+235 && (clickeado[i]==false))
    {
      miCarta[i].desplegarfrente();
      clickeado[i] = true;
      cartasGiradas[volteada] = i;
      
      volteada++;
      n++;
      
      if (volteada == 2)
      {
        volteada = 0;
        //println("0: ", fv[cardUp[0]]);
        //println("1: ", fv[cardUp[1]]);
        
        if (v[cartasGiradas[0]] == v[cartasGiradas[1]])
        {
          miCarta[cartasGiradas[0]].comparar();
          miCarta[cartasGiradas[1]].comparar();
          ganar += 1;
        }
      }
      if (n == 3)
      {
        for (int j=0; j<16; j++)
      {
        miCarta[j].bocaAbajo();
        clickeado[j] = false;
        volteada = 0;
        n = 0;
      }
      }
    }
  }
}



void shuffle()
{
  int temp=0;
  int rand=0;
  for (int i=0; i<16; i++)
  {
    rand = int(random(0,16));
    temp = v[i];
    v[i] = v[rand];
    v[rand] = temp;
  }
}

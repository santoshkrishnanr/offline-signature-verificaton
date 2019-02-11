


PImage img1;
PImage img2;


float[]gx = new float[width*width*height];
float[]gy = new float[width*width*height];
float[] qad = new float[(height*width)*(height*width)];
float[]tan1 = new float [(height*width*height)];
float[]tan2 = new float [height*width*height];
float[][]tupil=new float[9] [height*width*width];
float[][]tupil2=new float[9] [height*width*width];
float[]loc=new float[height*width*width];
float[]total1=new float[9];
float[]total2=new float[9];



void setup() {
  size(960, 780);
  img1 = loadImage("sig5.jpg"); //sig 1,1.1, 2, 3, 4,  5,5.1
  working1();
  updatePixels();
  image(img1, width/2, height/2);


  img2 = loadImage("sig5.1.jpg"); //sig 1, 1.1, 2, 3, 4, 5,5.1
  working2();
  updatePixels(); 
  image(img2, 0, height/2);

  process();
  compare();
}








void process() {


  int n;
  for (int y = 1; y < img1.height-1; y++) 
    for (int x = 1; x < img1.width-1; x++) {
      n = y*img1.width + x;
      
      // to compare the tupil pixel by pixel side by side  
// println("pic1",tupil[1][n], tupil[2][n], tupil[3][n], tupil[4][n], tupil[5][n], tupil[6][n], tupil[7][n], tupil[8][n], tan1[n],"pic2",tupil2[1][n], tupil2[2][n], tupil2[3][n], tupil2[4][n], tupil2[5][n], tupil2[6][n], tupil2[7][n], tupil2[8][n], tan2[n]); }}


for(int i=0; i<=8; i++) {
        total1[i]  +=tupil[i][n];
        total2[i]  +=tupil2[i][n];
      }}
    
  println ("P",  total1[1], total1[2], total1[3], total1[4], total1[5], total1[6], total1[7], total1[8]);
  println ("Q", total2[1], total2[2], total2[3], total2[4], total2[5], total2[6], total2[7], total2[8]);
}








void compare() {
  float num=0, psum=0, qsum=0;
  float ans=0, q=0;
  for (int n = 1; n<=8; n++)
  {
    num += (total1[n]*total2[n]);
    psum += (total1[n]*total1[n]); 
    qsum += (total2[n]*total2[n]);

    ans = (num)/( sqrt(psum)*sqrt(qsum));}
    println (num, psum, qsum, ans);
    if(ans >= 0.99000)
    {
    println("signature match %",ans*100 );
  }
    else println("signature does not match %", ans*100 );
  
}

































//----------------------------------------------------------------gradient1----------------------------------------------------------------------------//

void working1() 


{
  loadPixels(); 
  img1.loadPixels();
  int z=1;
  int n=0 ;

  float[][] filterx = {{ -1, -2, -1 }, 
    { 0, 0, 0 }, 
    { 1, 2, 1 }};
  float[][] filtery = {{ -1, 0, 1 }, 
    { -2, 0, 2 }, 
    { -1, 0, 1 }};           


  for (int y = 1; y < img1.height-1; y++) 
    for (int x = 1; x < img1.width-1; x++) {
      float responsex =0;
      float responsey = 0;
      for (int zy = -1; zy <= 1; zy++) 
        for (int zx = -1; zx <= 1; zx++) {
          int index = (y + zy) * img1.width + (x + zx);
          float r = brightness(img1.pixels[index]);
          responsey  += filtery[zy+1][zx+1] * r;
          responsex += filterx[zy+1][zx+1] * r;
          n = y*img1.width + x;
          // z = 1;
          gx[n]=responsex;
          gy[n]=responsey;
        }    
      pixels[y*width + x] = color(sqrt(responsex*responsex + responsey*responsey));

      //------------------------------------------------------------------------------tupil1------------------------------------------------------------
      qad[n] = (sqrt(responsex*responsex + responsey*responsey));
      tan1[n] = atan(responsey/responsex);

      loc[n] = (1000*(2+tan1[n]));
      if (loc[n] >= 000)
      {
        if (loc[n] <= 500)
        {
          tupil[1][n]=qad[n];
        }
      }

      if (loc[n] > 500)
      {
        if (loc[n] <= 1000)
        {
          tupil[2][n]=qad[n];
        }
      }
      if (loc[n] > 1000)
      {
        if (loc[n] <= 1500)
        {
          tupil[3][n]=qad[n];
        }
      }
      if (loc[n] > 1500)
      {
        if (loc[n] <= 2000)
        {
          tupil[4][n]=qad[n];
        }
      }    
      if (loc[n] > 2000)
      {
        if (loc[n] <= 2500)
        {
          tupil[5][n]=qad[n];
        }
      }
      if (loc[n] > 2500)
      {
        if (loc[n] <= 3000)
        {
          tupil[6][n]=qad[n];
        }
      }      

      if (loc[n] > 3000)
      {
        if (loc[n] <= 3500)
        {
          tupil[7][n]=qad[n];
        }
      }      
      if (loc[n] > 3500)
      {
        if (loc[n] <= 4000)
        {
          tupil[8][n]=qad[n];
        }
      }      
    }
}
//=----------------------------------------------=============-------------gradient2------------------------------------------------------------------------------


















void working2() 
{
  loadPixels(); 
  img2.loadPixels();
  int n=0 ;

  float[][] filterx = {{ -1, -2, -1 }, 
    { 0, 0, 0 }, 
    { 1, 2, 1 }};
  float[][] filtery = {{ -1, 0, 1 }, 
    { -2, 0, 2 }, 
    { -1, 0, 1 }};           


  for (int y = 1; y < img2.height-1; y++) 
    for (int x = 1; x < img2.width-1; x++) {
      float responsex =0;
      float responsey = 0;
      for (int zy = -1; zy <= 1; zy++) 
        for (int zx = -1; zx <= 1; zx++) {
          int index = (y + zy) * img2.width + (x + zx);
          float r = brightness(img2.pixels[index]);
          responsey  += filtery[zy+1][zx+1] * r;
          responsex += filterx[zy+1][zx+1] * r;
          n = y*img2.width + x;

          gx[n]=responsex;
          gy[n]=responsey;
        }    


      pixels[(width/2)+y*width + x] = color(sqrt(responsex*responsex + responsey*responsey));

      //-------------------------------------------------------------------tupil2-------------------------------------------------------
      qad[n] = (sqrt(responsex*responsex + responsey*responsey));
      tan2[n] = atan(responsey/responsex);

      loc[n] = (1000*(2+tan2[n]));
      if (loc[n] >= 000)
      {
        if (loc[n] <= 500)
        {
          tupil2[1][n]=qad[n];
        }
      }

      if (loc[n] > 500)
      {
        if (loc[n] <= 1000)
        {
          tupil2[2][n]=qad[n];
        }
      }
      if (loc[n] > 1000)
      {
        if (loc[n] <= 1500)
        {
          tupil2[3][n]=qad[n];
        }
      }
      if (loc[n] > 1500)
      {
        if (loc[n] <= 2000)
        {
          tupil2[4][n]=qad[n];
        }
      }    
      if (loc[n] > 2000)
      {
        if (loc[n] <= 2500)
        {
          tupil2[5][n]=qad[n];
        }
      }
      if (loc[n] > 2500)
      {
        if (loc[n] <= 3000)
        {
          tupil2[6][n]=qad[n];
        }
      }      

      if (loc[n] > 3000)
      {
        if (loc[n] <= 3500)
        {
          tupil2[7][n]=qad[n];
        }
      }      
      if (loc[n] > 3500)
      {
        if (loc[n] <= 4000)
        {
          tupil2[8][n]=qad[n];
        }
      }      

    }
}

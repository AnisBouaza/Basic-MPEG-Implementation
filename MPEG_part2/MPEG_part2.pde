import java.util.*;
PImage img1,img2,bloc;
float[] taille_pixel = new float[2];

float mse(PImage img1, PImage img2)
{
  
  float m = 0;
  for(int i = 0; i<img1.width; i++ )
  {
    for(int j=0; j<img1.height;j++)
    {
       float m2= brightness(img1.get(i,j))- brightness(img2.get(i,j));
       m2 = pow(m2,2);
       m += m2;
    }
  }
  m /=  img1.width * img1.height;
  return m;
}


void setup()
{
    size(1920,1080);
    img1 = loadImage("image072.png");
    img1.filter(GRAY);
    img2 = loadImage("image092.png");
    img2.filter(GRAY);

    surface.setSize(img1.width,img1.height);

  for(int i=0;i<img2.width;i+=16)
  {
    for(int j=0;j<img2.height;j+=16)
    {

      bloc=img2.get(i,j,16,16);
      float mse_min = Float.POSITIVE_INFINITY;
      PImage best_match = new PImage(16,16);
       for(int k1=i-5 ; k1<i+5   ;k1++)
       {
        for(int k2=j-5 ; k2<j+5  ;k2++)
          {
            PImage bloc_courant = img1.get(k1,k2,16,16);
            float M = mse(bloc,bloc_courant);
            if(M<mse_min)
            {
              mse_min=M;
              best_match = bloc_courant;
            }
          }
        }

      for(int k = 0; k < 16; k++){
        for(int l = 0; l < 16; l++){
          float residu = brightness(best_match.get(k, l))-brightness(bloc.get(k, l));
          float residuoriginal = residu;

          /*residu /= 2;
          residu += 127;
          set(i+k, j+l, color(int(residu)));*/

          float image2_reconstituer = brightness(best_match.get(k, l))-residu;
          set(i+k, j+l, color(int(image2_reconstituer)));
        }
      }

    }

  }
}

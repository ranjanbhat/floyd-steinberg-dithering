PImage kitten;

void setup()
{
  background(0);
  size(1024,512);
  kitten=loadImage("kitten.jpg");
 // kitten.filter(GRAY);
  image(kitten,0,0);
}

int index(int x, int y)
{
  return x+y*kitten.width;
}

void draw()
{ 
  
  kitten.loadPixels();
  for(int y=0; y<kitten.height-1; y++)
  { 
     for(int x=1; x<kitten.width-1 ; x++)
     {

      color pix=kitten.pixels[index(x,y)];
      float oldr=red(pix);
      float oldg=green(pix);
      float oldb=blue(pix);
      int factor=1;
      float newr=round(factor * oldr/255) * 255/factor;
      float newb=round(factor * oldb/255) * 255/factor;
      float newg=round(factor * oldg/255) * 255/factor;
      kitten.pixels[index(x,y)]=color(newr,newg,newb);
      
      float rerr = oldr-newr;
      float gerr = oldg-newg;
      float berr = oldb-newb;
      
      int index=index(x+1,y  );
      color c = kitten.pixels[index];
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      
      r+=rerr*7/16.0;
      g+=gerr*7/16.0;
      b+=berr*7/16.0;
      
      kitten.pixels[index]=color(r,g,b);
      
      
      index=index(x-1,y+1);
      c = kitten.pixels[index];
      r = red(c);
      g = green(c);
      b = blue(c);
      
      r+=rerr*3/16.0;
      g+=gerr*3/16.0;
      b+=berr*3/16.0;
      
      kitten.pixels[index]=color(r,g,b);
      
      
      index=index(x,y+1);
      c = kitten.pixels[index];
      r = red(c);
      g = green(c);
      b = blue(c);
      
      r+=rerr*5/16.0;
      g+=gerr*5/16.0;
      b+=berr*5/16.0;
      
      kitten.pixels[index]=color(r,g,b);
      
      
      index=index(x+1,y+1);
      c = kitten.pixels[index];
      r = red(c);
      g = green(c);
      b = blue(c);
      
      r+=rerr*1/16.0;
      g+=gerr*1/16.0;
      b+=berr*1/16.0;
      
      kitten.pixels[index]=color(r,g,b);
      
      }
  }
  kitten.updatePixels();
  image(kitten,512,0);
}

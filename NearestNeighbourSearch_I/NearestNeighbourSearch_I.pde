/*
Copyright (c) 2015 Ale González
 
This software is free; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License version 2.1 as published by the Free Software Foundation.
 
This software is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
Lesser General Public License for more details.
 
You should have received a copy of the GNU Lesser General
Public License along with this library; if not, write to the
Free Software Foundation, Inc., 59 Temple Place, Suite 330,
Boston, MA 02111-1307 USA
*/

/**
 *  Optimizing a NNS approach. CodeUp(II)
 *  Examples of microoptimization of a code. 
 */
 
int n = 800, w = 900, h = 900; 
float ms = 5, treshold = 50, sq_treshold = treshold * treshold;
PVector[] particles;
int[] cols;
int[] palette = {#003058, #b8c7da, #d7e4f5, #292218, #8b644a, -1};

void setup()
{
    size(900, 900);
    background(#eeeeee);
    stroke(0, 15);
    particles = new PVector[n];
    cols = new int[n];
    for(int i = 0; i < n; i++)  {
      particles[i] = new PVector(random(w), random(h));
      cols[i] = palette[ int(random(palette.length)) ];
    }      
}

void draw()
{
    frame.setTitle( nfc(frameRate, 2) );
    update();  
    display_e();      
}

void update()
{
    for(int i = 0; i < n; i++)
    {
          particles[i].x += random(-ms, ms);
          particles[i].y += random(-ms, ms);
          if(particles[i].x <= 0) particles[i].x += w; else if(particles[i].x >= w) particles[i].x -= w;
          if(particles[i].y <= 0) particles[i].y += h; else if(particles[i].y >= h) particles[i].y -= h;
    }  
}

/**
 *  Normal display to check the movement of the random walkers
 */
void display_a()
{
    background(-1);
    for(int i = 0; i < n; i++)
    {  
        stroke(0);
        ellipse(particles[i].x, particles[i].y, 50, 50);  
    }
}

/**
 *  Standard approach to NSS. Check distance from every particle to every particle. Heavy!
 */
void display_b()
{
    for(int i = 0; i < n; i++) for(int j = 0; j < n; j++)  
        if(particles[i].dist(particles[j]) < treshold)
            line(particles[i].x, particles[i].y, particles[j].x, particles[j].y);  
}

/**
 *  Micro-optimization (I). Let's use squared distance instead, to remove the square roots, expensive 
 */
void display_c()
{
    float dx = 0, dy = 0;
    for(int i = 0; i < n; i++) for(int j = 0; j < n; j++) 
    { 
        dx = particles[j].x - particles[i].x;
        dy = particles[j].y - particles[i].y; 
        if( dx*dx + dy*dy  < sq_treshold)
            line(particles[i].x, particles[i].y, particles[j].x, particles[j].y); 
    } 
}

/**
 *  Micro-optimization (II). Let's use manhattan distance instead, to remove the multiplications 
 *  Cheaper but the display changes.
 */
void display_d()
{
    float dx = 0, dy = 0;
    for(int i = 0; i < n; i++) for(int j = 0; j < n; j++) 
    { 
        dx = abs(particles[j].x - particles[i].x);
        dy = abs(particles[j].y - particles[i].y); 
        if( dx + dy  < treshold)
            line(particles[i].x, particles[i].y, particles[j].x, particles[j].y); 
    } 
}


/**
 *  Algorithmic optimization (III). 
 *  Let's come back to squared distance but removing unnecesary duplicated operations
 *  that's not exactly a micro-optimization because it changes algorithmic complexity from N*N to N*N/2
 */
void display_e()
{
    float dx = 0, dy = 0, d = 0;
    for(int i = 0; i < n; i++) for(int j = i+1; j < n; j++) 
    { 
        dx = particles[j].x - particles[i].x;
        dy = particles[j].y - particles[i].y;
        d  = dx*dx + dy*dy;
        if( d < sq_treshold) {
            stroke( cols[i], map(d, 0, sq_treshold, 5, 15) );
            line(particles[i].x, particles[i].y, particles[j].x, particles[j].y);
        } 
    } 
}

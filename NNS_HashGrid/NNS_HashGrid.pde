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
 *  Optimizing a NNS with a HashGrid. CodeUp(II)
 */
 
 
int n = 800, w = 900, h = 900; 
float treshold = 25;
PVector[] particles;

HashGrid hg;


void setup()
{
    size(900, 900);
    background(#eeeeee);
    stroke(0, 15);
    
    //Create the particles
    particles = new PVector[n];
    for(int i = 0; i < n; i++)  
      particles[i] = new PVector(random(w), random(h));
      
    //Create the HashGrid  
    hg = new HashGrid(treshold, g);    
}


void draw()
{
    frame.setTitle( nfc(frameRate, 2) );
    update();  
    display();
}


void update()
{
    hg.resetGrid();
    for(int i = 0; i < n; i++)
        hg.insert(updated(particles[i]));   
}


void display()
{
    for(int i = 0; i < n; i++) {
        ArrayList<PVector> near_particles = hg.getNearestElements( particles[i] );
        for(PVector p : near_particles)
            if(p.dist(particles[i]) < 25) 
                line(p.x, p.y, particles[i].x, particles[i].y);
    }  
}


PVector updated(PVector p)
{
    p.x += random(-5, 5);
    p.y += random(-5, 5); 
    return p;
}

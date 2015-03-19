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
 
 
int n = 6000, w = 900, h = 900; 
float treshold = 20, sqt = treshold * treshold;
PVector[] particles;

HashGrid hg;


void setup()
{
    size(w, h, P2D);
    background(-1);
    stroke(0, 25);

    //Create the particles
    particles = new PVector[n];
    for(int i = 0; i < n; i++)  
      particles[i] = new PVector(random(w), random(h));
      
    //Create the HashGrid  
    hg = new HashGrid(treshold, w, h);    
}


void draw()
{
    background(-1);
    frame.setTitle( nfc(frameRate, 2) );
    update();  
    displayWithoutHashgrid();
    //displayWithHashgrid();
}


/**
 *  Move the particles following a random walker scheme and update the hashgrid with the positions 
 */
 
void update()
{
    hg.resetGrid();
    PVector p;
    for(int i = 0; i < n; i++) {
        p = particles[i];
        p.x += random(-1, 1);
        p.y += random(-1, 1); 
        if(p.x < 0) p.x += w; else if(p.x > w) p.x -= w;
        if(p.y < 0) p.y += h; else if(p.y > h) p.y -= h;
        hg.insert(particles[i]);   
    }
}


/**
 *  Every particle iterates over all the bunch checking distances and drawing lines when near
 */

void displayWithoutHashgrid()
{
    PVector p, q;
    for(int i = 0; i < n; i++) {
        p = particles[i];
        for(int j = i+1; j < n; j++) {
            q = particles[j];
            float d = (p.x - q.x)*(p.x -q.x) + (p.y - q.y)*(p.y -q.y);   
            if(d < sqt) 
                line(particles[j].x, particles[j].y, particles[i].x, particles[i].y);
        }
    }  
}


/**
 *  Use a hash-grid to get nearest neighbours of the particles and draw lines connecting them
 */  

void displayWithHashgrid()
{
    ArrayList<PVector> near_particles;
    PVector p, q;
    for(int i = 0; i < n; i++) {
        p = particles[i];
        near_particles = hg.getNearestElements(p);
        for(int j = 0, s = near_particles.size(); j < s; j++) {
            q = near_particles.get(j);
            float d = p.dist(q); 
            d = (p.x - q.x)*(p.x -q.x) + (p.y - q.y)*(p.y -q.y);  
            if(d < sqt && d > 0)  line(p.x, p.y, q.x, q.y);
        }
    }  
}


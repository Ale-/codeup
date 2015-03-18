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
 *  Lookup tables. CodeUp(II)
 *  First insight into the wonderful world of microoptimization. 
 */
 
int 
  w = 900, 
  h = 900,
  n = 900; 
float v;
float[][] particles; 

float[] angles; 
int[] angles_indices;

TrigLookupTable t;  
int angles_number = 720;
 
void setup()
{
    size(w, h);
    background(0);
    stroke(-1, 15);
    particles = new float[n][2];
    angles = new float[n];
    angles_indices = new int[n];
    for(int i = 0; i < n; i++) 
    {
        particles[i][0] = width/2;
        particles[i][1] = height/2;
        angles_indices[i] = (int) random(angles_number);
        angles[i] = angles_indices[i] * TWO_PI / angles_number;
    }
    t = new TrigLookupTable(angles_number);
   
}

void draw()
{
    frame.setTitle(nfc(frameRate, 2));
    updateB();
}

/**
 *    First update method, calculating sins and cosins every frame.
 */

void updateA()
{
    for(int i = 0; i < n; i++) 
    {
        //Generate a random speed
        v = random(3);  
        //Move the particles in a straight line defined by an angle.
        particles[i][0] += cos(angles[i]) * v;
        particles[i][1] += sin(angles[i]) * v;
        //Draw a point, size equals to speed --arbitrarily--
        strokeWeight(v);
        point(particles[i][0], particles[i][1]);
    }     
}

/**
 *    Second update method using a Lookup Table. 
 */
 
void updateB()
{
    for(int i = 0; i < n; i++) 
    {
        //Generate a random speed
        v = random(3);
        //Move the particles in a straight line defined by an index in the table.
        particles[i][0] += t.c[ angles_indices[i] ]*v;
        particles[i][1] += t.s[ angles_indices[i] ]*v;
        //Draw a point, size equals to speed --arbitrarily--
        strokeWeight(v);
        point(particles[i][0], particles[i][1]);
    }     
}


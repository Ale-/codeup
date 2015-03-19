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
 *  ArrayLists. CodeUp(I)
 *  A first simple tour on lists using a particle system of random walkers.
 */

import java.util.*;   // Only needed if using List or LinkedList

List the_particles;

int 
  sparse = 50, 
  w = 1800, 
  h = 900, 
  x = w/2, 
  y = h/2, 
  diam = 50;

void setup()
{
    size(w, h);  
    background(#eeeeee); 
    fill(#220000, 5); 
    stroke(-1, 15);
    the_particles = new LinkedList();  
}

void draw()
{
    frame.setTitle( nfc(frameRate, 2) );
    the_particles.add(new float[] {x, y});
    updateE(the_particles);
    filter(DILATE);
}


/**
 *  First update method. The obvious one.
 */
void updateA(ArrayList list)
{
    float[] coords = new float[2];
    for(int i = 0; i < list.size(); i++)
    {       
        coords = (float[]) list.get(i);
        //Move
        coords[0] += random(-sparse, sparse);
        coords[1] += random(-sparse, sparse);
        //Display
        ellipse(coords[0], coords[1], diam, diam);
    }    
}

/**
 *  Second update method. Lists implement the Iterable interface, 
 *  so let's use for-each cleaner syntax. Let's use generics to clean it a bit more. 
 */
void updateB(ArrayList<float []> list)
{
    for(float[] coords : list)
    {       
        //Move
        coords[0] += random(-sparse, sparse);
        coords[1] += random(-sparse, sparse);
        //Display
        ellipse(coords[0], coords[1], diam, diam);
    }    
}

/**
 *  Third update method. My framerate is falling clearly 
 *  Let's kill some particles
 */
void updateC(ArrayList<float []> list)
{
    for(float[] coords : list)
    {       
        //Move
        coords[0] += random(-sparse, sparse);
        coords[1] += random(-sparse, sparse);
        //Display
        ellipse(coords[0], coords[1], diam, diam);
        //Kill
        if(coords[0] < -diam  || coords[0] > w+diam || coords[1] < -diam  || coords[1] > h+diam)
          list.remove(coords);
        }    
}

/**
 *  Fourth update method. Oops, I cannot modify a list during a for-each 
 *  Let's come back a few steps, but killing particles
 */
void updateD(ArrayList<float []> list)
{
    float[] coords = new float[2];
    for(int i = 0; i < list.size(); i++)
    {       
        coords = list.get(i);
        //Move
        coords[0] += random(-sparse, sparse);
        coords[1] += random(-sparse, sparse);
        //Display
        ellipse(coords[0], coords[1], diam, diam);
        //Kill
        if(coords[0] < -diam  || coords[0] > w+diam || coords[1] < -diam  || coords[1] > h+diam) {
          list.remove(i);
        }
    }    
}

/**
 *  Final suggested update method:
 *   - Uses List instead of ArrayList
 *   - Gets out the size() call from the iteration
 *   - Uses an offset index to handle all the particles
 */
void updateE(List<float []> list)
{
    float[] coords = new float[2];
    for(int i = 0, off = 0, n = list.size(); i < n-off; i++)
    {       
        coords = list.get(i-off);
        //Move
        coords[0] += random(-sparse, sparse);
        coords[1] += random(-sparse, sparse);
        //Display
        rect(coords[0], coords[1], diam, diam);
        //Kill
        if(coords[0] < -diam  || coords[0] > w+diam || coords[1] < -diam  || coords[1] > h+diam) { 
          list.remove(i);
          off++;
        }
    }    
}

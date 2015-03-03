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
 *  LinkedLists. CodeUp(I)
 *  An example of how to use a Queue in a subdivision process, implemented as a LinkedList.
 */

import java.util.LinkedList;

LinkedList <PVector[]> shapes;
int[] palette = {#b2123f, #ffed00, #ff0048, #14a0cc, #0088b2};

void setup()
{
    size(900, 900);  
    shapes = new LinkedList <PVector[]>(); 
    //Let's add a seed shape coincident with the canvas
    shapes.add( new PVector[] { 
                    new PVector(0, 0), 
                    new PVector(width, 0), 
                    new PVector(width, height), 
                    new PVector(0, height) 
               });
    noStroke();
}


void draw()
{ 
    //Although we don't use it, we have to keep it (event triggers)
}

void mousePressed()
{
    subdivide(shapes);  
}


/**
 *  Takes a list, and iterates over it polling the queue.
 *  To poll = to get the head *removing it from the queue*
 */
void subdivide(LinkedList<PVector[]> the_shapes)
{
    for(int i = 0, n = the_shapes.size(); i < n; i++)
    {
        PVector[] current_shape = the_shapes.poll();
        display(current_shape);  
        divide(current_shape, the_shapes);
    }
}


/**
 *  Subdivides the polygon and offers (joins to the tail) the resulting polygons to the queue
 */
void divide(PVector[] s, LinkedList<PVector[]> shapes) 
{    
      for(int i = 0, n = s.length; i < n; i++)
      {
          int prev = (i - 1 + n) % n;
          int next = (i + 1)     % n;
          
          shapes.offer( new PVector[] { m(s[prev], s[i]), s[i], m(s[i], s[next]) } );           
      }
      if(s.length == 4)
          shapes.offer( new PVector[] { m(s[0], s[1]), m(s[1], s[2]), m(s[2], s[3]), m(s[3], s[0])} ); 
       else
          shapes.offer( new PVector[] { m(s[0], s[1]), m(s[1], s[2]), m(s[2], s[0]) } );
}


/**
 *  Calculates the midpoint PVector of two points given as PVectors
 */
PVector m(PVector a, PVector b)
{
    return new PVector((a.x + b.x) * .5, (a.y + b.y) * .5); 
}


/**
 *  Draws a PVector[] as a shape
 */
void display(PVector[] shape)
{
    fill( palette[ int(random(palette.length)) ] ); 
    beginShape();
      for(int i = 0, n = shape.length; i < n; i++) vertex(shape[i].x, shape[i].y); 
    endShape(CLOSE);  
}

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

TrigLut t;  
 
void setup()
{
    t = new TrigLut();
    int n = 1000000;
    int e;
    println(n + " elements");
    println("Time of calculating regular sins");
    e = millis();
    for(int i = 0; i < n; i++)
        sin(random(TAU));  
    println(millis() - e);
    println("Time of calculating lut sins");
    e = millis();
    for(int i = 0; i < n; i++)
        t.getSin(random(TAU));  
    println(millis() - e);
    println("Time of calculating regular coss");
    e = millis();
    for(int i = 0; i < n; i++)
        cos(random(TAU));  
    println(millis() - e);
    println("Time of calculating lut coss");
    e = millis();
    for(int i = 0; i < n; i++)
        t.getCos(random(TAU));  
    println(millis() - e);
}

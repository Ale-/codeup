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
 *  HashMaps. CodeUp(I)
 *  An example of how to use a HashMap to create a tag cloud.
 *  http://www.niemanlab.org/2011/10/word-clouds-considered-harmful/  : )
 */

import java.util.*;

void setup()
{
    size(1000, 1000);
    
    background(#eeeeef); fill(#111111);
    
    display(tags("partidox", "exceptions.txt"));
}



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
*   Command design pattern. CodeUp(III)
* 
*/

// 'operations' is an array of abstract objects that extend the class ArithmeticOperation, that's it methods
ArithmeticOperation[] operations = { new Add(), new Multiplicate() };
int[] cols = { 0x99000000, 0x99ff0000 };

void setup()
{
  size(900, 900);
  fill(0, 75);
  background(-1);
}

void draw()
{
    //Create 10 random numbers, to be used as operands of the arithmetic operation
    float[] operands = new float[ int(random(10)) ];
    for(int i = 0; i < operands.length; i++) 
        operands[i] = random(1, 10);
        
    //Choose a random arithmetic operation
    int operation_kind = (int) random(operations.length);
    
    //And write the results   
    // (Here we pass a method to other. That's called 'callback'
    //  The way of doing 'callbacks' in java is through a command approach,
    //  encapsulating methods in objects)
    textSize(random(24));
    fill(cols[operation_kind]);
    text(operations[operation_kind].calculate(operands), random(width), random(height) );  
}




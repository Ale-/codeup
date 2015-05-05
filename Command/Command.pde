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

// 'commands' is an array of abstract objects that extend the class Command, that's it methods
Command[] commands = { new Add(), new Multiplicate() };
int[] cols = { 0x99000000, 0x99ff0000 };

void setup()
{
  size(900, 900);
  fill(0, 75);
  background(-1);
}

void draw()
{
    float[] operands = new float[ int(random(10)) ];
    for(int i = 0; i < operands.length; i++) 
        operands[i] = random(1, 10);
    textSize(random(24));
    // Le vamos pasar un método a otro --> 'calculate' a 'text'
    // Esto se llama 'callback' y es habitual en programación funcional
    // Esta es la manera de replicar dicho funcionamiento en POO
    int index = (int) random(commands.length);
    fill(cols[index]);
    text(commands[index].calculate(operands), random(width), random(height) );  
}


//Aquí se implementa el patrón comando
// En este caso el sentido es obvio, podemos definir infinitas operaciones matemáticas sobre un conjunto de valores flotantes
// De manera que hacer una versión de este programa con distintas operaciones sólo obliga a escribir las nuevas operaciones, sin
// tocar el resto

abstract class Command
{  
    abstract float calculate(float... v);  
}

class Add extends Command
{   
    float calculate(float... v)
    {
        float result = 0.;
        for(int i = 0; i < v.length; i++) result += v[i];
        return result;  
    }  
}

class Multiplicate extends Command
{   
    float calculate(float... v)
    {
        float result = 1.;
        for(int i = 0; i < v.length; i++) result *= v[i];
        return result;  
    }  
}


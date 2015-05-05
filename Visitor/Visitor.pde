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
*   Visitor design pattern. CodeUp(III)
* 
*/

int n = 500;
Particle[] particles;
int m = 10;
ParticleVisitor[] visitors;

void setup()
{
    size(900, 900);  
    fill(-1,15);
    background(-1);
    stroke(0, 15);
    
    particles = new Particle[n];
    for(int i = 0; i < n; i++)
        particles[i] = new Particle(random(width), random(height));
    visitors = new ParticleVisitor[m];
    for(int i = 0; i < m; i++) {    
        visitors[i] = random(1) < .5 ? new NoiseVisitor(random(.005, .05), random(5,10)) : new TrigVisitor(random(.005, .05), random(5,10)); 
    }
}

void draw()
{
    for(int i = 0; i < n; i++) 
        particles[i].accept(visitors[i%m]);
}

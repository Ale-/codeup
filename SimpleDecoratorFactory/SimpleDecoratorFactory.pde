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
* Factory design pattern. CodeUp(III)
* This example uses a much simpler approach of a Decorator pattern,
* using simple inheritance instead of a pure abstract approach
*
*/

int n = 200;
Particle[] particles;
ParticleFactory factory;

void setup()
{
    size(900, 900);
    background(0);
    stroke(0, 125);
    factory = new ParticleFactory();
    particles = new Particle[n];
    for(int i = 0; i < n; i++) 
        particles[i] = factory.createRandomParticle();
}

void draw()
{   
    for(int i = 0; i < n; i++) 
      particles[i].update().display();
    filter(BLUR);
}





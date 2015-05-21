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

int n, m;
float chance = .1;
Particle[] particles;
Force[] forces;

void setup()
{
    size(900, 900);  
    fill(-1, 50);
    background(-1);
    stroke(0, 50);
    
    //Instantiate particles
    n = 1000;
    particles = new Particle[n];
    for(int i = 0; i < n; i++)
        particles[i] = new Particle(random(width), random(height));
        
    //Instantiate forces  
    m = int(random(50));  
    forces = new Force[m];
    for(int i = 0; i < m; i++)    
        forces[i] = random(1) < chance ? new NoisyForce(random(.005, .05), 2) : new TrigForce(random(.005, .05), 2); 
}

void draw()
{
    for(int i = 0; i < n; i++) {
        int random_force = int(random(m));
        particles[i].move( forces[random_force] );
    }
}

void mouseClicked()
{
    background(-1);
    setup();  
}

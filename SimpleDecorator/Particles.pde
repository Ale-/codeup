/**
 *  Main Particle class
 * 
 */

class Particle
{
    PVector pos;
    float size;
    float speed;
  
    Particle()
    {
        pos   = new PVector(random(width), random(height));
        size  = random(25);
        speed = random(15);  
    }
  
    Particle update()
    {
        pos.x += random(-speed, speed);
        pos.y += random(-speed, speed);
        if(pos.x < 0) pos.x += width;  else if(pos.x > width)  pos.x  -= width;
        if(pos.y < 0) pos.y += height; else if(pos.y > height) pos.y -= height;        
        return this;
    }
     
    void display()
    {
        ellipse(pos.x, pos.y, size, size);
    } 
}

/**
 *  ParticleB class
 *  Decorates Particle 
 */

class ParticleB extends Particle
{
  
    PVector l;
  
    ParticleB()
    {
        super(); 
        l = new PVector();
    }
  
    void display()
    {
        super.display();
        l = new PVector(pos.x + random(-50, 50), pos.y + random(-50, 50)); 
        line(pos.x, pos.y, l.x, l.y);  
    }
}

/**
 *  ParticleC class
 *  Decorates ParticleB 
 */

class ParticleC extends ParticleB
{
    ParticleC()
    {
        super(); 
    }
  
    void display()
    {
        super.display();
        ellipse(l.x, l.y, size, size);  
    }
}

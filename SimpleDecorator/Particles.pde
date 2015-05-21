/**
 *  Main Particle class
 *  Ä random walker in a toroidal space, basically.
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
 *  Decorates Particle with a line that starts in the center of the former ellipse
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
        //This is the most important part of a decorator approach
        //Objects call recursively the method they decorate
        super.display(); 
       
        //Decoration here 
        l = new PVector(pos.x + random(-50, 50), pos.y + random(-50, 50)); 
        line(pos.x, pos.y, l.x, l.y);  
    }
}

/**
 *  ParticleC class
 *  Decorates ParticleB with another ellipse in the end of the line
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

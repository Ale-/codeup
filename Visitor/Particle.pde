/**
 *  Main class particle
 *  Not much to explain here
 */

class Particle
{
    PVector position;
    float size;
    
    Particle(float x, float y)
    {    
        position = new PVector(x, y);
        size = random(1, 25); 
    }
  
    void move(Force force)
    {    
        force.move(this);
        checkBounds();
        display();            
    }   
    
    void display()
    {
        ellipse(position.x, position.y, size, size);  
    }
   
    void checkBounds()
    {
        if(position.x <= 0) position.x += width;  else if (position.x >= width)  position.x -= width;
        if(position.y <= 0) position.y += height; else if (position.y >= height) position.y -= height;  
    } 
    
}

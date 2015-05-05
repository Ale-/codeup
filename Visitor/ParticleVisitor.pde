abstract class ParticleVisitor
{
    abstract void visit(Particle p);
    
    void checkBounds(PVector p)
    {
        if(p.x <= 0) 
            p.x += width;  
        else if (p.x >= width) 
            p.x -= width;
        if(p.y <= 0) 
            p.y += height; 
        else if (p.x >= height) 
            p.x -= height;  
    }
}


class NoiseVisitor extends ParticleVisitor
{
    float smoothness;
    float mag;
  
    NoiseVisitor(float s, float m)
    {
        smoothness = s;
        mag = m;  
    }
  
    void visit(Particle p)
    {
        p.position.x += (noise(p.position.x * smoothness, p.position.y * smoothness, 0)-.5) * mag;
        p.position.y += (noise(p.position.y * smoothness, p.position.x * smoothness, 1)-.5) * mag;     
        checkBounds(p.position);
        ellipse(p.position.x, p.position.y, 15, 15);
    }  
}

class TrigVisitor extends ParticleVisitor
{
    float smoothness;
    float mag;
  
    TrigVisitor(float s, float m)
    {
        smoothness = s;
        mag = m;  
    }
  
    void visit(Particle p)
    {
        p.position.x += (sin(p.position.y * smoothness)-.5) * mag;
        p.position.y += (cos(p.position.x * smoothness)-.5) * mag;     
        checkBounds(p.position);
        ellipse(p.position.x, p.position.y, 15, 15);
    }  
}

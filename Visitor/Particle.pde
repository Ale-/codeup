public class Particle
{
    PVector position;
    
    Particle(float x, float y)
    {    position = new PVector(x, y);  }
  
    void accept(ParticleVisitor v)
    {    v.visit(this);    }    
    
}

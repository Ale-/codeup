/**
 *  Force is the abstraction of the possible forces that could interact with the particle
 *  That's it, here force is the Visitor itself
 */

interface class Force
{
    abstract void move(Particle p);   
}

/**
 *  The different forces implement the Force visitor in order to influence the particles
 */

/**
 *  NoisyForce
 *  A force that uses Perlin noise
 */
class NoisyForce implements Force
{
    float smoothness;
    float mag;
  
    NoisyForce(float s, float m)
    {
        smoothness = s;
        mag = m;  
    }
  
    void move(Particle p)
    {
        p.position.x += (noise(p.position.x * smoothness, p.position.y * smoothness, 0)-.5) * mag;
        p.position.y += (noise(p.position.x * smoothness, p.position.y * smoothness, 1)-.5) * mag;     
    }  
}


/**
 *  TrigForce
 *  A force that uses trigonometry
 */
class TrigForce implements Force
{
    float smoothness;
    float mag;
  
    TrigForce(float s, float m)
    {
        smoothness = s;
        mag = m;  
    }
  
    void move(Particle p)
    {
        p.position.x += (sin(p.position.y * smoothness)-.5) * mag;
        p.position.y += (cos(p.position.x * smoothness)-.5) * mag;     
        
    }  
}

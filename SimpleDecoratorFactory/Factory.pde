class ParticleFactory 
{  
  
    Particle createParticle(int kind)
    {
        if(kind == 0)      return new Particle();
        else if(kind == 1) return new ParticleB();
        else               return new ParticleC();
    }
  
    Particle createRandomParticle()
    {
        int k = int(random(3));
        return createParticle(k); 
    }  
}

/**
 *  A factory of particles
 *  The use of final ints as keys makes easier the generation from
 *  user's perspective, because it's easier to remember names than indices
 *  Don't use Strings as keys, it's not efficient
 */

class ParticleFactory 
{    
    final int 
      PARTICLE   = 0,
      PARTICLE_B = 1,
      PARTICLE_C = 2;
  
    /**
     *  createParticle
     *  Return a particle of a class specified by the user
     *  Another way of doing this is through Reflection api, specifying
     *  in the factory the classes it has access to, with indices related.
     */
    Particle createParticle(int kind)
    {
        if(kind == 0)      return new Particle();
        else if(kind == 1) return new ParticleB();
        else               return new ParticleC();
    }
  
    /**
     *  createRandomParticle
     *  Return a particle of a random class. 
     */
    Particle createRandomParticle()
    {
        int k = int(random(3));
        return createParticle(k); 
    }  
}

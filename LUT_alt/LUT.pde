/**
 *  Class TrigLookupTable
 *  An util class to generate a trigonometric lookup table of sins and cosins 
 *  of the angles that result of dividing a circle in a given equal number of parts 
 */


class TrigLut
{
    float[] v;  
    float k; 
    int swap;
   
    void setTrig(int steps_number)
    {
        v = new float[steps_number];
        println("Creating lookup table. Cost in memory " + nfc(4 * steps_number * 1e-6, 3) + " mB");
        k = steps_number / TAU;
        swap = steps_number / 4;
        float step = TAU / steps_number;
        float current_angle = 0;  
        for(int i = 0; i < steps_number; i++)
        {
            v[i] = sin(current_angle);
            current_angle += step;      
        }  
    }
   
    TrigLut (int steps_number)
    {
        setTrig(steps_number);    
    }
 
    TrigLut ()
    {
        setTrig(360 * 180);
    }
  
    float getSin(float angle)
    {  
        return v[int(angle * k)];    
    }
 
    float getCos(float angle)
    {    return v[int(((angle + HALF_PI) % TWO_PI) * k)];    }   
}

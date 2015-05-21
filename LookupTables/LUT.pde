/**
 *  Class TrigLookupTable
 *  An util class to generate a trigonometric lookup table of sins and cosins 
 *  of the angles that result of dividing a circle in a given equal number of parts 
 */


class TrigLut
{
    float[] s, c;  
   
    TrigLut (int steps_number)
    {
        s = new float[steps_number];
        c = new float[steps_number];
        float step = TWO_PI / steps_number;
        float current_angle = 0;  
        for(int i = 0; i < steps_number; i++)
        {
            s[i] = sin(current_angle);
            c[i] = cos(current_angle);
            current_angle += step;      
        }
    }
 
    TrigLut ()
    {
        TrigLut(1040);
    }
 
    float sin(float angle)
    {

    }
 
    float cos(float angle)
    {

    }   
}

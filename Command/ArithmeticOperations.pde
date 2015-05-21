/**
 *  Interface ArithmeticOperation is the 'Command' itself
 *  Command is the main abstract operation
 */

interface ArithmeticOperation
{  
    abstract float calculate(float... v);  
}

/**
 *  The operations implement the command, defining the concrete behaviour 
 *  You could easily extend the command with new operations
 *
 *  The ... stand for variable arguments, that's it an undefined number of arguments
 *  --It's only syntactic sugar on the top of a regular array-- 
 */
 
class Add implements ArithmeticOperation
{   
    float calculate(float... v)
    {
        float result = 0.;
        for(int i = 0; i < v.length; i++) result += v[i];
        return result;  
    }  
}

class Multiplicate implements ArithmeticOperation
{   
    float calculate(float... v)
    {
        float result = 1.;
        for(int i = 0; i < v.length; i++) result *= v[i];
        return result;  
    }  
}


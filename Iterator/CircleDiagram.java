import processing.core.*;
import java.util.*;  

public class CircleDiagram <Circle> implements Iterable <Circle>
{
    PApplet parent;
  
    public CircleDiagram(PApplet parent)
    {
        this.parent = parent;  
    }

    private class Circle
    {  
        private float x, y, d;
        
        public Circle(float X, float Y, float D)
        {
            x = X; 
            y = Y; 
            d = D;  
        }
        void display(float x, float y, float d)
    	{    parent.ellipse(x, y, d, d);    }    
    }
    
    public class I<Circle> implements Iterator<Circle>
    { 
        private int position = 0;
    
        private boolean hasNext() 
        {    return position < circles.length;    }
    
        public Circle next()
        {
            position = 0;
            while(hasNext()) return circles[position++];
        }
    }
    
    Iterator<Circle> iterator()
    {
        return new I();      
    }
}

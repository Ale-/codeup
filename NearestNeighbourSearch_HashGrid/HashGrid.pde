/**
  HashGrid.
  An array of 'buckets'. Each bucket is a container of elements implementing the Locable interface, and is
  defined by a rectangular boundary [bW * bH].
  When an object asks the map for neighbours of a given element, the map returns all elements contained
  into the buckets nearest to the container wherein the element resides.
*/
 
class HashGrid 
{  
    ArrayList <PVector>[][] buckets;
    int 
      bucket_width, 
      bucket_height, 
      cols, 
      rows;
     
    /**
     *  Constructor
     */ 
     
    HashGrid (float treshold, int w, int h)
    {
        int d = int (treshold) - 1;
        bucket_width  = int(treshold); 
        bucket_height = int(treshold);
        cols          = w / bucket_width;
        rows          = h / bucket_height;
        buckets       = new ArrayList[cols][rows] ;
        resetGrid();
    }
    
    HashGrid (float treshold, int w, int h, int n)
    {
        int d = int (treshold) - 1;
        bucket_width  = int(sqrt(n)); 
        bucket_height = int(sqrt(n));
        cols          = w / bucket_width;
        rows          = h / bucket_height;
        buckets       = new ArrayList[cols][rows] ;
        resetGrid();
    }
    
    /**
     *  Clear all the buckets of their current information
     */
     
    void resetGrid() 
    {                                  
        for(int x = 0; x < cols; x++)
            for(int y = 0; y < rows; y++)
                buckets[x][y] = new ArrayList<PVector>();
    }
     
    /**
     *  Insert a given location inside its correspondent bucket
     */
     
    void insert(PVector p) 
    {                      
        buckets[int(p.x / bucket_width)][int(p.y / bucket_height)].add(p);    
    }
     
     
    /**
     *  Retrieve the nearest neighbours of a given element
     */ 
  
    ArrayList <PVector> getNearestElements (PVector l) 
    {   
        ArrayList nearest = new ArrayList ();
        int c = int(l.x / bucket_width),
            r = int(l.y / bucket_width);        

        //get row and col indices of buckets around the given particle, taking into account corner cases         
        int ini_col = c-1 > 0    ? c-1 : 0,                   
            end_col = c+1 < cols ? c+1 : cols-1,           
            ini_row = r-1 > 0    ? r-1 : 0,                              
            end_row = r+1 < rows ? r+1 : rows-1;          
         
        //Retrieve nearest buckets 
        for (int row = ini_row; row <= end_row; row++) 
            for (int col = ini_col; col <= end_col; col++) 
                nearest.addAll(buckets[col][row]);
    
        return nearest;
    }
    
    /**
     *  Displays the grid defined by the buckets
     */ 
    
    void displayGrid (int col) 
    {
        stroke (col);
        for (int r=0, y=0; r <= rows; r++, y += bucket_height) 
            line (0, y, width, y);
        for (int c=0, x=0; c <= cols; c++, x += bucket_width) 
            line (x, 0, x, height);
    }
}

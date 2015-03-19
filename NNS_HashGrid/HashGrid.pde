/**
  HashGrid.
  An array of 'buckets'. Each bucket is a container of elements implementing the Locable interface, and is
  defined by a rectangular boundary [bW * bH].
  When an object asks the map for neighbours of a given element, the map returns all elements contained
  into the buckets nearest to the container wherein the element resides.
*/
 
class HashGrid 
{  
    ArrayList <PVector>[] buckets;
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
        buckets       = new ArrayList [cols * rows] ;
        resetGrid();
    }
  
  
    /**
     *  Clear all the buckets of their current information
     */
     
    void resetGrid() 
    {                                  
        for(int i = 0; i < buckets.length; i++)
            buckets[i] = new ArrayList<PVector>();
    }
   
   
    /**
     *  Get the column of a given location in the grid
     */  
     
    int getCol(PVector location) 
    { 
        return int(location.x / bucket_width); 
    }  
  
  
    /**
     *  Get the row of a given location in the grid
     */  
     
    int getRo(PVector location) 
    { 
        return int(location.y / bucket_height); 
    }  
  
  
    /**
     *  Get the index of the grid bucket that contains a given location
     */  
     
    int getIndex(PVector location) 
    { 
        return getCol(location) + (getRo(location) * cols);
    }
     
     
    /**
     *  Insert a given location inside its correspondent bucket
     */
     
    void insert(PVector element) 
    {                      
        buckets[getIndex(element)].add(element);    
    }
     
     
    /**
     *  Retrieve the nearest neighbours of a given element
     */ 
  
    ArrayList <PVector> getNearestElements (PVector l) 
    {   
        ArrayList nearest = new ArrayList ();
        int c = getCol(l);
        int r = getRo(l);        

        //get row and col indices of buckets around the given particle, taking into account corner cases         
        int init_col = c-1 > 0    ? c-1 : 0;                   
        int end_col  = c+1 < cols ? c+1 : cols-1;           
        int init_row = r-1 > 0    ? r-1 : 0;                                   
        int end_row  = r+1 < rows ? r+1 : rows-1;          
         
        //Retrieve nearest buckets 
        for (int row = init_row; row <= end_row; row++) {
            for (int col = init_col; col <= end_col; col++) {
                nearest.addAll(buckets[(row * cols) + col]);
            }
        }
    
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

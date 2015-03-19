/**
  HashGrid.
  An array of 'buckets'. Each bucket is a container of elements implementing the Locable interface, and is
  defined by a rectangular boundary [bW * bH].
  When an object asks the map for neighbours of a given element, the map returns all elements contained
  into the buckets nearest to the container wherein the element resides.
*/
 
 
class HashGrid 
{  
    //The map itself
    ArrayList <PVector> [] buckets;
    //Bucket and map parameters:
    // · bW and bH define the bucket dimensions,
    // · rowB and colB are the number of buckets per row and column
    int 
      bucket_width, 
      bucket_height, 
      cols, 
      rows;
     
    HashGrid (float treshold, PGraphics c)
    {
      bucket_width  = c.width  / int(treshold);
      bucket_height = c.height / int(treshold);
      cols          = c.width  / bucket_width;
      rows          = c.height / bucket_height;
      buckets       = new ArrayList [cols * rows] ;
      resetGrid();
    }
  
  
    /**
     *  Clear all the buckets of their current information
     */
     
    void resetGrid() 
    {                                  
        for(int i = 0; i < buckets.length; i++)
            buckets[i] = new ArrayList ();
    }
   
   
    /**
     *  Get the column of a given location in the grid
     */  
     
    int getCol(PVector location) 
    { 
        return int(location.x) / bucket_width; 
    }  
  
  
    /**
     *  Get the row of a given location in the grid
     */  
     
    int getRow(PVector location) 
    { 
        return int(location.y) / bucket_height; 
    }  
  
  
    /**
     *  Get the index of the grid bucket that contains a given location
     */  
     
    int getIndex(PVector location) 
    { 
        return getCol(location) + (getRow(location) * cols);
    }
     
     
    /**
     *  Insert a given location inside its correspondent bucket
     */
     
    void insert(PVector element) 
    {                      
         if (element!=null)
         { 
             int bucket = getIndex(element); 
             buckets[bucket].add(element);
         }    
    }
     
     
    /**
     *  Retrieve the nearest neighbours of a given element
     */ 
  
    ArrayList <PVector> getNearestElements (PVector l) 
    {   
        ArrayList
          nearest = new ArrayList ();      //the container to be returned 
        int                             
          t,                               //a variable to hold temporary values
          c  = getCol (l),                
          r  = getRow (l),                           // Bucket 'b' and its neighbours 'n':
          iC = (t = c-1) >0 ? t : 0 ,                   //
          iR = (t = r-1) >0 ? t : 0 ,                   //    n(iC,iR)    ·    n(eC,iR)
          eC = (t = c+1) < cols ? t : cols -1 ,           //        ·    b(c,r)     ·               
          eR = (t = r+1) < rows ? t : rows -1 ;           //    n(iC,eR)    ·    n(eC,eR)  
         
        //Retrieve nearest buckets 
        for (r = iR, t = r*cols; r <= eR; r++, t += cols) 
            for (c = iC; c <= eC; c++) 
                nearest.addAll (buckets[t+c]);
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

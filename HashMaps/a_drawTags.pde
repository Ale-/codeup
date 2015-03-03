/**
 *  Displays a list of pairs key-value, mapping the value to a font size
 */
  
void display(ArrayList<Map.Entry> tag_cloud)
{
     int 
        padding = 50,
        word_padding = 5,
        x = padding, 
        y = padding + 200;
     float 
        word_width;

     for(Map.Entry entry : tag_cloud)
     {
         String tag = (String) entry.getKey();
         textSize( map((Integer) entry.getValue(), 0, max_freq, 5, 200) );
         
         word_width = textWidth(tag);
        
         //Display the tags in a row until the limit is reached        
         if ( x + word_width < width - padding ) 
         {
             text(tag, x, y);
             x += (word_width + word_padding);
         //Then do a carriage return
         } else {
             x = padding;
             y += textAscent() + textDescent() + word_padding;
             text(tag, x, y);
             x += (word_width + word_padding);
        }
     }
}

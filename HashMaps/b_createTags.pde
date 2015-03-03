int max_freq = 0;
String[] source_text;
String[] exceptions;

/**
 *  Creates an ordered list of mappings key-value from a given txt file and a given file of String exceptions
 */
  
ArrayList<Map.Entry> tags(String file, String exceptionsFile)
{
    //Create a map
    HashMap<String, Integer> tag_cloud = new HashMap<String, Integer>();
    //Create a holder for the words in the target file
    String[] words;

    //Gets the file lines
    String[] source_text = loadStrings(file);
    //Get the exceptions (file formatted with one exception per line)
    String[] exceptions = loadStrings(exceptionsFile);
    
    //Create holders for the variables inside the iteration
    String line, word; 
    int freq;
    int words_analyzed = 0;
    
    //Let's start a chronometer : )
    float time = millis();
    
    for (int line_number = 0; line_number < source_text.length; line_number++)
    {
        line = source_text[line_number];
        words = split(line, ' ');
        for(int current_word = 0; current_word < words.length; current_word++)
        {
            words_analyzed++;
            //Set case to avoid repeated words
            word = words[current_word].toLowerCase();
            //Check if word is allowed, else continue to the next element in the iteration
            if(containsString(exceptions, word)) 
                continue;
                
            //If the tag cloud contains the word already add one to the frequency of that tag    
            if(tag_cloud.containsKey(word)) 
            {
                freq = tag_cloud.get(word) + 1;
                tag_cloud.put(word, freq);
                //Update maximum freqeuency
                if(max_freq < freq) max_freq = freq;
                
            //If the word is not in the tag cloud, add a new tag to it with a frequency of 1    
            } else tag_cloud.put(word, 1);              
        }
    }
    
    //Count the time that operation costs
    time = (millis() - time) / 1000;
    
    println("Analysis of " + words_analyzed + " words finished in " + time + " sec.");
    println("The maximum frequency is " + max_freq);
    
    //Create a list of map entries using entrySet method
    ArrayList <Map.Entry> tags = new ArrayList <Map.Entry> ( tag_cloud.entrySet() ); 
    
    //Sort the list by value
    Collections.sort(tags, new Comparator<Map.Entry> () 
    {
        public int compare(Map.Entry a, Map.Entry b) {    
            return ((Integer) b.getValue()).compareTo((Integer) a.getValue());  
        }
    });
    
    //Return the sorted list
    return tags;     
}

/**
 *  Util method to check if a word is contained in a given String array
 */

boolean containsString(String[] words, String word)
{
    for(int i = 0; i < words.length; i++)
        if(word.equals(words[i])) return true;  
    return false;
}

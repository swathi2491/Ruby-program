

class Object
        DEBUGGING=1
        def stext(ttype='')
        if not DEBUGGING
            return
        end
    
        
        val = if self.class == Enumerator 
        then self.to_a 
        else 
        self 
        end
        
        if [Array, String].include?(val.class) and val.length > 100
            if val.class == String
                 val = val.split('') 
                 end
            
            val = val.first(40) + [". . ."] + val.last(40)
            if self.class == String
                 val = val.join 
                 end

        end
        
        if ttype.downcase == 'start'
            self.tap {|x| puts """
                   #{val}
                   """}
        else
            self.tap {|x| puts """
                      #{ttype}
                      #{val}
                   """}
         end
     end
end

def word_value(word)
    alphabet = ' ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    word.split('')            #.stext
        .map{|ch| alphabet.index(ch)} #.stext
        .inject(&:+) #.stext
end


 

File.read("names.txt")                       
    .split(",")                            
    .map{|w| w[1..-2]}                     
    .sort                                  
    .map {|w| word_value(w)}               
    .each_with_index                       
    .map{|value, pos| value * (pos + 1)}   
    .inject(&:+)                           .stext("The total  of all namescores are")
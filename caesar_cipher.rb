 
 def caesar_cipher(paragraph, num)

  new_arr = []
    paragraph.split("").map do |letter|

    if letter.match?(/[[:alpha:]]/)
        if letter.downcase === letter 
          if letter.ord + num > 122
              new_arr << (-((122 - (letter.ord + num)) - 96)).chr
          else
            new_arr << (letter.ord + num).chr
          end
        else
          if letter.ord + num > 90
            new_arr << (-((90 - (letter.ord + num)) - 64)).chr
          end
        end
    else
       new_arr << letter
    end
   end
  new_arr.join
 end

 p caesar_cipher("What a string!", 5)
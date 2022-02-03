dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]


def substrings paragraph, dictionary

  new_arr = []
  dictionary.each do  |word|
    paragraph.split(" ").each do |part_word|
      new_arr << word if part_word.downcase.match?(word) 
    end
  end
  new_arr.tally
end


p substrings("Howdy partner, sit down! How's it going?", dictionary)
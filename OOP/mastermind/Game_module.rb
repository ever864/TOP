module GameModule

  def printer_question_color(arr_colors)
    colors = ""
    puts "Put four colors, please"
    colors = gets.chomp.to_s.downcase
    until (arr_colors - colors.split(",")).length === 2
      puts "Please put the correct colors"  
      colors = gets.chomp.to_s.downcase
    end
    return colors
  end

end
module PrinterModule

  def wellcome
    puts "---> Wellcome to the MasterMind Game <---"
  end

  def ask_the_name
    print "¿What's your name player? : "
    name_player = gets.chomp.to_s
    presentation_computer(name_player)
    name_player
  end

  def presentation_computer(name_player)

    puts "\n Hello #{name_player}!, in this game you'll find a friend called ¡Zeze-AI!, Its a computer player that will play with you.
    "

  end
  
  def instruction_game
    puts "Instructions:"
    puts "\nAs the Codemaker: your goal is to set a mystery code so cunning that it will keep your opponent guessing for as long as possible.\n"
    puts "As the Decoder: you must break the secret code in the fewest number of guesses.\n"
    puts "You need to put 4 codes join commas, example: color,color,color,color\n"
  end

  def printer_set_secret_colors(person)
    puts "Now is turn from Zeze AI to guess the colors and you need put a colors set secret"
    puts "#{person} put a colors set secret"
    colors = gets.chomp.to_s.downcase
  end

  def printer_again_question
    puts "You need tu put the correct set colors"
    colors = gets.chomp.to_s.downcase
    colors.split(",")
  end

  def print_intruction_computer
    puts "The computer don't know the answer this need to guees it"
  end

end

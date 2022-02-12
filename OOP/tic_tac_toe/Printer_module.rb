module Printer

  def printer_wellcome
    puts "
    **********************
    *******!Wellcome!*****
    * Tic_Tac_Toe - Game *
    **********************
    **********************
    "
  end

  def ask_name_player(number)
    puts "What's your name player #{number}?"
    name = gets.chomp
    puts "
      ¡¡Hello player #{name}!! 
    "
    name
  end

  def instructions_game
    puts "
      -------------->  [INSTRUCTIONS]  <---------------
      You can press any number from 1 until 9.
      The player one can start it with 'X' letter and
      player two can start with 'O' letter, in turn .
      So if you want to win. You'll need to complete one row,
      column, or crossed.
      
      Are you ready?
      "
      ready = gets.chomp
  end

  def print_layout_game
    puts "
    >>It's a layer Tic-Tac-Toe Game <<
              
                *---------*
                |         |
                |  1|2|3  |
                |  -+-+-  |
                |  4|5|6  |
                |  -+-+-  |
                |  7|8|9  |
                |         |
                *---------*
                
     Let's go!           
                "
  end

  def print_play_again
    puts "Do you want to play it's again?"
    answer = gets.chomp.to_s
  end
  

  def print_end_game(player)
   puts "Game Over ... ¡#{player} is the winner!"
  end

end
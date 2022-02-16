require_relative 'Printer_module'
require_relative 'Game_module'
require_relative 'MasterMind'
require_relative 'Computer'
require_relative 'Person'

class Game
  include PrinterModule
  include GameModule

  def initialize
    @new_table = MasterMind.new()
    @computer_player = Computer.new()
    @new_person = ""
    @colors_selected_computer = []
    @colors_secret_selected_player = []
    @initial_game = 1
    @points_computer = 0
  end

  def start
    wellcome
    @name = ask_the_name
    @new_person = Person.new(@name).name
    instruction_game
    @new_table.board_game
    ask_colors_computer
    ask_colors_player
    ask_set_colors_player
    turn_computer
    win_game
  end

  def ask_colors_player
    until @new_table.code_pegs === @colors_selected_computer || @initial_game === 12
      puts "Turn #{@initial_game}: to select from #{@new_person}"
      colors_selected = printer_question_color(@new_table.colors)
      @new_table.update_colors(colors_selected)
      @initial_game += 1
      compare_result
      @new_table.board_game
    end
  end

  def turn_computer
    print_intruction_computer
    @points_computer = @computer_player.guess_set_colors(@colors_secret_selected_player)

  end

  def ask_colors_computer
    @colors_selected_computer = @computer_player.pre_select_colors(@new_table.colors)
  end
  
  def compare_result
     @new_table.update_keys(@colors_selected_computer)
  end

  def ask_set_colors_player
    @colors_secret_selected_player = printer_set_secret_colors(@new_person).split(",")
    until (@new_table.colors - @colors_secret_selected_player).length === 2
      @colors_secret_selected_player = printer_again_question
    end
  end

  def win_game
    puts "The #{@new_person}'s score is #{@initial_game}"
    puts "The Zeze Ai's score is #{@points_computer}"
    sleep 1
    if @initial_game > @points_computer
      puts "Zeze Ai win the game"
    elsif @initial_game < @points_computer
      puts "#{@new_person} win the game"
    else
      puts "Its is draw"
    end
    play_again
  end

  def play_again
    puts "Do you want to play again?[y/n]"
    answer = gets.chomp.to_s
    if answer === "y"
      Game.new().start
    elsif answer === "n"
      puts "Game Over"
    else
      puts "puts the letter y if you want to say yes or n is the answer is not"
      play_again
    end
  end
end

Game_one = Game.new()
Game_one.start
# p Game_one.ask_colors_computer
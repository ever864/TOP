
require_relative 'Printer_module'
require_relative 'Game_module'

class Game
include Printer
include GameModule

  def initialize
    @count = 1
    @players = [Hash.new(),Hash.new()]
    @layer_tic_tac_toe = [[1,2,3],[4,5,6],[7,8,9]]
    
    @arr_opts_p1 = []
    @arr_opts_p2 = []
    @arr_opts = []
  end

  def start
     printer_wellcome
     until @count === 3
      @players[@count-1]["player #{@count}"] = ask_name_player(@count)
      @count += 1
     end
    #  instruction
    play_game
  end

  def instruction
    if instructions_game === "yes"
      print_layout_game
      play_game
    else
      start
    end
  end

  def play_game
      status_game = ""
    until status_game === "win"
      status_game = turner_player(@players[0], 1 , "X", @layer_tic_tac_toe, @arr_opts, @arr_opts_p1)
      if status_game === "win"
        
        puts "#{@players[0]["player 1"]} win the game!"
        play_again(@players[0]["player 1"])
        return status_game = "win"
      end

      status_game = turner_player(@players[1], 2 , "O", @layer_tic_tac_toe, @arr_opts, @arr_opts_p2)
      if status_game === "win"
        puts "#{@players[1]["player 2"]} win the game!"
        play_again(@players[1]["player 2"])
        return status_game = "win"
      end
    end
    
  end

  def play_again(player)
    answer = print_play_again
    if answer === "yes"
      @layer_tic_tac_toe = [[1,2,3],[4,5,6],[7,8,9]]
      @arr_opts_p1 = []
      @arr_opts_p2 = []
      @arr_opts = []
      start 
    else
       end_game(player)
    end
  end

  def end_game(player)
    print_end_game(player)
  end
  
end

game = Game.new()
game.start
require_relative "MasterMind"


class Computer
  def initialize
    @name = "Zeze-AI"
    @first_select_colors = []
    @count = 0
    @mastermind = MasterMind.new()
  end

  def pre_select_colors(arr_colors)
    arr_colors.shuffle[0..-3]
  end

  def select_colors
    MasterMind.new().colors
  end

  def guess_set_colors(set_colors_selected_player)
    @first_select_colors = MasterMind.new().colors.shuffle[0..-3]
    @mastermind.code_pegs = @first_select_colors 
    new_arr = []
    sleep 1
    puts "Turn 1: to select from Zeze-AI"
    p @first_select_colors.join(",")
    @mastermind.update_keys(set_colors_selected_player)
    @mastermind.board_game
    until @mastermind.code_pegs === set_colors_selected_player || @count === 11 
      @first_select_colors.each_with_index do |elem,idx| 
        if elem === set_colors_selected_player[idx]
          @mastermind.code_pegs[idx] = elem
          new_arr << elem
        else
          cod  = (MasterMind.new().colors - new_arr).shuffle
          if @first_select_colors.include?(cod[0])
            @first_select_colors[idx] = cod[1]
          else
            @first_select_colors[idx] = cod[0]
          end
        end
      end
      @mastermind.update_keys(set_colors_selected_player)
      puts "Turn #{@count+2}: to select from Zeze-AI"
      p @first_select_colors.join(",")
      @mastermind.board_game
      @count += 1
      sleep 1
    end
    points = @count + 1
    return points
  end

  

end
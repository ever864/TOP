module GameModule

  def win_alternatives

    [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]

  end
  
  def chossing_option(player, arr_opts, arr_opts_p)

    puts "#{player} choose the number [1-9]"
    option_player = gets.chomp.to_i
    
    if arr_opts.include?(option_player)
      until !@arr_opts.include?(option_player)
        puts "This #{option_player} number already is selected"
        puts "#{player} choose the number again"
        option_player = gets.chomp.to_i
      end
     arr_opts << option_player
     arr_opts_p << option_player
     option_player
    else
    arr_opts << option_player
    arr_opts_p << option_player
    option_player
    end

  end

  def print_tic_tac_toe(layout) 

    as = layout.map do |elems|
       elems.join(" | ") + "\n" + "  --+---+--"
    end.join("\n  ")

     puts"\n  #{as[0..-10]}  "
  end

  def turner_player(players, num, symbol ,  layer_game, arr_opts, arr_opt_py)
   
    py1_chs = chossing_option(players["player #{num}"], arr_opts, arr_opt_py)
    if layer_game.flatten.include?(py1_chs)
      layer_game.map do |elem|
        elem.each{|num| elem[elem.index(num)] = symbol if num === py1_chs}
      end
    end
    print_tic_tac_toe(layer_game)

    win_alternatives.map do |elem|
       if arr_opt_py.sort.intersection(elem) === elem
        # puts "Game Over ... ¡#{players[0]["player #{num}"]} is the winner!"
        return status_game = "win"
       end
    end


  end


end
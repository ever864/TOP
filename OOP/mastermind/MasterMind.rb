require_relative 'Master_module'

class MasterMind
  include MasterModule
  attr_reader :colors
  attr_writer :keys_pegs
  attr_accessor :code_pegs

  def initialize
    @code_pegs = ["color","color","color","color"]
    @keys_pegs = ["b|w","b|w","b|w","b|w"]
    @colors = ["red", "blue", "orange", "purple", "green", "brown"]
    @keys = ["black", "white"]
    @keys_selected = []
  end

  def board_game
    print_table_game(@code_pegs,@keys_pegs)
  end

  def update_colors(colors_selected)
    @code_pegs = colors_selected.split(",")
  end
  
  def update_keys(colors_selected)
    count_compare = 0
    while count_compare < 4
      if @code_pegs[count_compare] === colors_selected[count_compare]
        @keys_pegs[count_compare] = "white"
      else
        @keys_pegs[count_compare] = "black"
      end
      count_compare += 1
    end
  end

end

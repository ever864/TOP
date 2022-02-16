require_relative "MasterMind"
require_relative "Printer_module"

class Person
  include PrinterModule

  attr_reader :name

  def initialize(name=nil)
  @name = name
  @colors_selected = nil
  end

  def set_colors_secret(name)
    @colors_selected = printer_set_secret_colors(name).split(",")
  end
  
  

end
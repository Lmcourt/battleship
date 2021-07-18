class Computer

  attr_reader :ships
  def initialize
    @ships = []
  end

  def computer_ships
    @ships << Ship.new("Cruiser", 3)
    @ships << Ship.new("Submarine", 2)
  end

  #display board
  # computer shots

end

class Computer

  attr_reader :ships, :board
  def initialize
    @ships = [Ship.new("Submarine", 2), Ship.new("Cruiser", 3)]
    @board = Board.new
  end

  def computer_placement
    #takes the array of ships and for each ship does the thing
    comp_ships = @ships.map do |ship|
      # generates random cells
      coordinates = @board.cells.keys.sample(ship.length)
      #until loop to see if they're valid placements
      until @board.valid_placement?(ship, coordinates) == true
        #keeps looping until valid
        coordinates = @board.cells.keys.sample(ship.length)
      end
      require "pry"; binding.pry
    end
    #calls the board to place the damn ships
    @board.place(ship, coordinates)
  end

  #should theoretically display the computer board from the board render method
  def displays_comp_board
    # require "pry"; binding.pry
    @board.render
  end
end

# else
#   coordinates = @board.cells.keys.to_a.sample(ship.length)
# end
    # finds cells that are valid placements for length of ship
    # @ships[0] == board.valid_placement?
    # ships.map do |ship|
    #   ship.
  #display board
  # computer shots

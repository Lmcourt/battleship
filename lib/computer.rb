require './lib/board'
require './lib/ship'


class Computer

  attr_reader :ships, :computer_board
  def initialize
    @ships = [Ship.new("Submarine", 2), Ship.new("Cruiser", 3)]
    @computer_board = Board.new
  end

  def computer_placement
    #takes the array of ships and for each ship does the thing
    comp_ships = @ships.each do |ship|
      # generates random cells
      coordinates = @computer_board.cells.keys.sample(ship.length)
      #until loop to see if they're valid placements
      until @computer_board.valid_placement?(ship, coordinates) == true
        #keeps looping until valid
        coordinates = @computer_board.cells.keys.sample(ship.length)
      end
      # require "pry"; binding.pry
      @computer_board.place(ship, coordinates)
      @computer_board.place(ship, coordinates)
    end
  end

  def computer_shot
    @computer_board.cells.keys.sample
  end
  # the computer takes a shot in a valid random location
  #should not fire on a space it has fired upon

  def computer_shot
  # the computer chooses a valid location to fire upon based on coordinates
    @board.cells.keys.sample #should give us a
  # the computer fires upon a random location

  # the results should be displayed

  #shot hit, miss and sunk

  end
end

  #should theoretically display the computer board from the board render method
  # def displays_comp_board
  #   # require "pry"; binding.pry
  #   puts @board.render
  # end

# else
#   coordinates = @board.cells.keys.to_a.sample(ship.length)
# end
    # finds cells that are valid placements for length of ship
    # @ships[0] == board.valid_placement?
    # ships.map do |ship|
    #   ship.
  #display board
  # computer shots

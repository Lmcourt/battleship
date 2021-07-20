require './lib/board'
require './lib/ship'
require './lib/cell'



class Computer

  attr_reader :ships, :computer_board, :computer_fires, :comp_render_and_report, :cruiser, :submarine
  def initialize(player_board, computer_board)
    @ships = [Ship.new("Submarine", 2), Ship.new("Cruiser", 3)]
    @submarine = @ships.first
    @cruiser = @ships.last
    @computer_board = computer_board
    @player_board = player_board
    # @comp_render_and_report = comp_render_and_report(player_board)

  end

  def computer_placement
    comp_ships = @ships.each do |ship|
      coordinates = @computer_board.cells.keys.sample(ship.length)
      until @computer_board.valid_placement?(ship, coordinates) == true
        coordinates = @computer_board.cells.keys.sample(ship.length)
      end
      @computer_board.place(ship, @comp_coordinates)
      @computer_board.place(ship, @comp_coordinates)
    end
  end

  def select_coordinate(player_board)
    player_board.cells.keys.sample
  end

  def computer_fires(player_board)
   player_board.cells[select_coordinate].fire_upon
   select_coordinate
  end

  def comp_render_and_report(player_board)
    require "pry"; binding.pry
    if player_board.cells[computer_fires(player_board)].render == "X"
      puts "I shot at #{select_coordinate} GET SUNK."
    elsif player_board.cells[computer_fires(player_board)].render == "H"
      puts "I shot at #{select_coordinate} and it's a hit. I'm gonna win."
    elsif player_board.cells[computer_fires(player_board)].render == "M"
      puts "I missed but I'm not throwing away my SHOT."
    end
  end
end

require './lib/board'
require './lib/ship'
require './lib/cell'



class Computer

  attr_reader :ships, :computer_board, :computer_fires, :comp_render_and_report, :cruiser, :submarine, :fired_coord
  def initialize(player_board, computer_board)
    @ships = [Ship.new("Submarine", 2), Ship.new("Cruiser", 3)]
    @submarine = @ships.first
    @cruiser = @ships.last
    @computer_board = computer_board
    @player_board = player_board
    @fired_coord = fired_coord
  end

  def computer_placement
    comp_ships = @ships.each do |ship|
      comp_coordinates = @computer_board.cells.keys.sample(ship.length)
      until @computer_board.valid_placement?(ship, comp_coordinates) == true
        comp_coordinates = @computer_board.cells.keys.sample(ship.length)
      end
      @computer_board.place(ship, comp_coordinates)
      @computer_board.place(ship, comp_coordinates)
    end
  end

  # def select_coordinate(player_board)
  #   select_coordinate(player_board)
  # end

  def computer_fires(player_board)
    # require "pry"; binding.pry
    # player_board.cells.sample.
    @fired_coord = player_board.cells.keys.sample
    player_board.cells[@fired_coord.to_sym].fire_upon
    @fired_coord
    # player_board.cells[@fired_coord].render
  end

  def comp_render_and_report(player_board)
    # require "pry"; binding.pry
    if player_board.cells[@fired_coord].render == "X"
      puts "I shot at #{@fired_coord} GET SUNK."
    elsif player_board.cells[@fired_cord].render == "H"
      puts "I shot at #{@fired_coord} and it's a hit. I'm gonna win."
    elsif player_board.cells[@fired_cord].render == "M"
      puts "I missed but I'm not throwing away my SHOT."
    else
      " "
    end
  end
end

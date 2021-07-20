require './lib/board'
require './lib/ship'


class Player

  attr_reader :submarine, :cruiser, :selected_coord, :player_rend, :player_fired
  def initialize(player_board, computer_board)
    @submarine = Ship.new("Submarine", 2)
    @cruiser = Ship.new("Cruiser", 3)
    @player_board = player_board
    @computer_board = computer_board
    @cruiser_coordinates = []
    @submarine_coordinates = []
    @selected_coord = selected_coord
    @player_rend = player_rend
    @player_fired = player_fired
  end

  def player_cruiser_placement
    puts "I put my ships where you will never find them."
    puts "Now it's your turn to place your ships."
    puts "Your cruiser takes 3 coordinates and your submarine takes 2."

    puts "  1 2 3 4 \n"
    puts "A . . . . \n"
    puts "B . . . . \n"
    puts "C . . . . \n"
    puts "D . . . . \n"


    puts "Enter the coordinates for your Cruiser"
    cruiser_answer = gets.chomp
    @cruiser_coordinates = cruiser_answer.split(", ")
    # require "pry"; binding.pry
    if @player_board.valid_placement?(@cruiser, @cruiser_coordinates) == false
      puts "Try again. This time with valid coordinates."
      until @player_board.valid_placement?(@cruiser, @cruiser_coordinates) == true
        cruiser_answer = gets.chomp
        @cruiser_coordinates = cruiser_answer.split(", ")
      end
    end
    @player_board.place(@cruiser, @cruiser_coordinates)
  end

  def player_submarine_placement
    puts "I put my ships where you will never find them."
    puts "Now it's your turn to place your ships."
    puts "Your submarine takes 3 coordinates and your submarine takes 2."
    #i think this will show the players player_board


    puts "Enter the coordinates for your Submarine"
    submarine_answer = gets.chomp
    @submarine_coordinates = submarine_answer.split(", ")
    # require "pry"; binding.pry
    if @player_board.valid_placement?(@submarine, @submarine_coordinates) == false
      puts "Try again. This time with valid coordinates"
      until @player_board.valid_placement?(@submarine, @submarine_coordinates) == true
        puts "That's still not valid."
        submarine_answer = gets.chomp
        @submarine_coordinates = submarine_answer.split(", ")
      end
    end
    @player_board.place(@submarine, @submarine_coordinates)
  end

  def player_select_coordinate(computer)
    puts "Enter a coordinate. Make sure it's valid."
    @selected_coord = gets.chomp
    if computer.computer_board.valid_coordinate?(@selected_coord) == false
      puts "Waiting for a valid coordinate..."
      until computer.computer_board.valid_coordinate?(@selected_coord) == true
        puts "Still waiting.."
        @selected_coord = gets.chomp
      end
      #inform its already been fired on
    end
    @player_fired = computer.computer_board.cells[@selected_coord].fire_upon
    @player_rend = computer.computer_board.cells[@selected_coord].render
    # computer.computer_board.cells[player_fires(computer)].render
  end
end

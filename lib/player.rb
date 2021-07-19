require './lib/board'
require './lib/ship'


class Player

  attr_reader :submarine, :cruiser, :board
  def initialize
    @submarine = Ship.new("Submarine", 2)
    @cruiser = Ship.new("Cruiser", 3)
    @board = Board.new
    @cruiser_coordinates = []
    @submarine_coordinates = []
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
    if @board.valid_placement?(@cruiser, @cruiser_coordinates) == false
      puts "Try again. This time with valid coordinates."
      until @board.valid_placement?(@cruiser, @cruiser_coordinates) == true
        cruiser_answer = gets.chomp
        @cruiser_coordinates = cruiser_answer.split(", ")
      end
    end
    @board.place(@cruiser, @cruiser_coordinates)
  end

  def player_submarine_placement
    puts "I put my ships where you will never find them."
    puts "Now it's your turn to place your ships."
    puts "Your submarine takes 3 coordinates and your submarine takes 2."
    #i think this will show the players board


    puts "Enter the coordinates for your Submarine"
    submarine_answer = gets.chomp
    @submarine_coordinates = submarine_answer.split(", ")
    # require "pry"; binding.pry
    if @board.valid_placement?(@submarine, @submarine_coordinates) == false
      puts "Try again. This time with valid coordinates"
      until @board.valid_placement?(@submarine, @submarine_coordinates) == true
        submarine_answer = gets.chomp
        @submarine_coordinates = submarine_answer.split(", ")
      end
    end
    @board.place(@submarine, @cruiser_coordinates)
  end

  def displays_player_board
    @board.render(true)
  end
end
    # require "pry"; binding.pry



  #player board
  #player picks coordinate
  # if already fired on, picks again
  #fires at computer board

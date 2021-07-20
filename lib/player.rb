require './lib/board'
require './lib/ship'


class Player

  attr_reader :submarine, :cruiser, :selected_coord, :player_rend, :player_fired
  def initialize(player_board, computer_board)
    @submarine = Ship.new("Submarine", 2)
    @cruiser = Ship.new("Cruiser", 3)
    @player_board = player_board
    @computer_board = Board.new
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


    puts "Enter the coordinates for your Cruiser (capital letters separated by commas)"
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
    puts "Your submarine takes 3 coordinates and your submarine takes 2 (capital letters separated by commas)"
    puts "Enter the coordinates for your Submarine"
    submarine_answer = gets.chomp
    @submarine_coordinates = submarine_answer.split(", ")
    # require "pry"; binding.pry
    if @player_board.valid_placement?(@submarine, @submarine_coordinates) == false
      puts "Try again. This time with valid coordinates"
      until @player_board.valid_placement?(@submarine, @submarine_coordinates) == true
        submarine_answer = gets.chomp
        @submarine_coordinates = submarine_answer.split(", ")
      end
    end
    @player_board.place(@submarine, @submarine_coordinates)
  end
  def player_select_coordinate(computer_board)
    # require "pry"; binding.pry
    puts "Enter a coordinate. Make sure it's valid."
    @selected_coord = gets.chomp
    if computer_board.valid_coordinate?(@selected_coord) == false
      puts "Waiting for a valid coordinate..."
      until computer_board.valid_coordinate?(@selected_coord) == true
        puts "Still waiting.."
        @selected_coord = gets.chomp
      end
      #inform its already been fired on
    end
    # @player_fired = computer_board.cells[@selected_coord].fire_upon
    # @player_rend = computer_board.cells[@selected_coord].render
    # computer.computer_board.cells[player_fires(computer)].render
  end

  def player_fires(computer_board)
    computer_board.cells[@selected_coord.to_sym].fire_upon
    @selected_coord
  end

  def player_render_and_report(computer_board)
    # require "pry"; binding.pry
    if computer_board.cells[@selected_coord.to_sym].render == "X"
      puts "You shot at #{@selected_coord} GET SUNK."
    elsif computer_board.cells[@selected_coord.to_sym].render == "H"
      puts "I shot at #{@selected_coord} and it's a hit. I'm gonna win."
    elsif computer_board.cells[@selected_coord.to_sym].render == "M"
      puts "You missed but I'm not throwing away my SHOT."
    end
  end
    #make this for computer
  # def comp_render_and_report
  #   if @player_board.cells[computer_fires].render == "M"
  #     puts "I missed but I'm not throwing away my SHOT."
  #   elsif @player_board.cells[computer_fires].render == "H"
  #     puts "I shot at #{select_coordinate} and it's a hit. I'm gonna win."
  #   else @player_board.cells[computer_fires].render == "X"
  #     puts "I shot at #{select_coordinate} GET SUNK."
  #   end
  # end
  #
  #  something like this

  # def player_fires
  #   @computer_board.cells[player_select_coordinate(computer)].fire_upon
  #   @selected_coord
  # end
  #
  # def player_render_and_report
  #   if @computer_board.cells[player_fires].render == "M"
  #     puts "I missed but I'm not throwing away my SHOT."
  #   elsif @computer_board.cells[player_fires].render == "H"
  #     puts "I shot at #{select_coordinate} and it's a hit. I'm gonna win."
  #   else @computer_board.cells[player_fires].render == "X"
  #     puts "I shot at #{select_coordinate} GET SUNK."
  #   end
  # end
end

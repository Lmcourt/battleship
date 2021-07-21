require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/player'
require './lib/computer'

class Game
  attr_reader :computer_board, :player_board, :ships, :c_submarine, :c_cruiser, :p_submarine, :p_cruiser
  def initialize
    # @end_game_message = end_game_message
    @computer_board = Board.new
    @player_board = Board.new
    @ships = [Ship.new("Submarine", 2), Ship.new("Cruiser", 3)]
    @c_submarine = @ships.first
    @c_cruiser = @ships.last
    @p_submarine = Ship.new("Submarine", 2)
    @p_cruiser = Ship.new("Cruiser", 3)
  end

  def user_input
    gets.chomp
  end

  def welcome
    puts "Welcome to BATTLESHIP"
    puts "Enter P to play. Enter Q to quit."
  end

  def start #dont test
    welcome
    player_input = user_input
    until player_input == "P" || player_input == "Q"
      puts "Try again..."
      player_input = user_input
    end
    if player_input == "P"
      play_game
    else
      puts "Goodbye."
    end
  end

  def play_game
    player_cruiser_placement(p_cruiser)
    player_submarine_placement(p_submarine)
    computer_placement
    until game_over?
      turn
    end
      end_game_message
  end

  def game_over?
    return true if @p_cruiser.health == 0 && @p_submarine.health == 0 || @ships.all? {|ship| ship.health == 0}
  end

  def board_display
    puts " ==== DEEP THOUGHT(The great supercomputer) ===="
    puts @computer_board.render
    puts " ==== YOU ARE ONLY HUMAN ===="
    puts @player_board.render(true)
  end

  def turn
    computer_turn
    board_display
    player_turn
    board_display
  end

  def end_game_message
    if @p_cruiser.health == 0 && @p_submarine.health == 0
      puts "You have been defeated!"
       return "You have been defeated!"
    elsif @ships.all? {|ship| ship.health == 0}
      puts "Victory!"
       "Victory!"
    else
       " "
    end
    play_again
  end

  def play_again #dont test
    puts "play again, or quit?"
    user_input
      if user_input == "play again"
        start
      elsif user_input == "quit"
        puts "peace!"
      else
        puts "That wasn't valid. Goodbye."
        #else that wasnt valid try again? But seriously only if we have time
      end
  end


  def player_cruiser_placement(p_cruiser)
    puts "I put my ships where you will never find them."
    puts "Now it's your turn to place your ships."
    puts "Your cruiser takes 3 coordinates and your submarine takes 2."

    puts "  1 2 3 4 \n"
    puts "A . . . . \n"
    puts "B . . . . \n"
    puts "C . . . . \n"
    puts "D . . . . \n"


    puts "Enter the coordinates for your Cruiser (capital letters separated by commas)"
    # cruiser_answer = gets.chomp
    # @cruiser_coordinates = cruiser_answer.split(", ")
    p_cruiser_coords = user_input.split(", ")
     # require "pry"; binding.pry
    if @player_board.valid_placement?(p_cruiser, p_cruiser_coords) == false
      puts "Try again. This time with valid coordinates."
      until @player_board.valid_placement?(p_cruiser, p_cruiser_coords) == true
        p_cruiser_coords.split(", ")
      end
    end
    @player_board.place(p_cruiser, p_cruiser_coords)
  end

  def player_submarine_placement(p_submarine)
    puts "Enter the coordinates for your Submarine"
    p_submarine_coords = user_input.split(", ")
    # require "pry"; binding.pry
    # require "pry"; binding.pry
    if @player_board.valid_placement?(p_submarine, p_submarine_coords) == false
      puts "Try again. This time with valid coordinates"
      until @player_board.valid_placement?(p_submarine, p_submarine_coords) == true
        p_submarine_coords.split(", ")
      end
    end
    @player_board.place(p_submarine, p_submarine_coords)
  end

  def player_turn
    # require "pry"; binding.pry
    puts "Enter a coordinate to find my battleship. Make sure it's valid."
    shoot_coord = user_input
    until @computer_board.valid_coordinate?(shoot_coord) == true  && @computer_board.cells[shoot_coord.to_sym].fired_upon? == false
      puts "Waiting for a valid coordinate..."
      shoot_coord = user_input
    end
      @computer_board.cells[shoot_coord.to_sym].fire_upon
      # require "pry"; binding.pry
      # shoot_coord
      if @computer_board.cells[shoot_coord.to_sym].render == "X"
        puts "You shot at #{shoot_coord} GJ."
      elsif computer_board.cells[shoot_coord.to_sym].render == "H"
        puts "You shot at #{shoot_coord} and it's a hit. I'm still gonna win."
      elsif computer_board.cells[shoot_coord.to_sym].render == "M"
        puts "You missed on #{shoot_coord}. Get owned."
      end
  end

  def computer_placement
    comp_ships = @ships.each do |ship|
      comp_coordinates = @computer_board.cells.keys.sample(ship.length)
      until @computer_board.valid_placement?(ship, comp_coordinates) == true
        comp_coordinates = @computer_board.cells.keys.sample(ship.length)
      end
      @computer_board.place(ship, comp_coordinates)
    end
  end

  def computer_turn
      fired_coord = @player_board.cells.keys.sample
      until @player_board.cells[fired_coord].fired_upon? == false
        fired_coord = @player_board.cells.keys.sample
      end
      @player_board.cells[fired_coord].fire_upon

    if @player_board.cells[fired_coord].render == "X"
      puts "I shot at #{fired_coord} GET SUNK."
    elsif @player_board.cells[fired_coord].render == "H"
      puts "I shot at #{fired_coord} and it's a hit. I'm gonna win."
    elsif @player_board.cells[fired_coord].render == "M"
      puts "I missed at #{fired_coord} but I'm not throwing away my SHOT."
    end
  end
end

# game = Game.new
# game.start
# game.play_again
 #add loop
#if p, place ships -- loop starts after ship placed

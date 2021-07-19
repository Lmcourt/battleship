require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/player'
require './lib/computer'

class Game
  attr_reader :end_message, :computer
  def initialize
    @end_message = end_message
    @computer = Computer.new
    @player = Player.new
    @computer_board = Board.new
    @player_board = Board.new
  end
  #

def welcome
  puts "Welcome to BATTLESHIP"
  puts "Enter P to play. Enter Q to quit."
end

  def start
    welcome
    user_input = gets.chomp.upcase
    if user_input == "P"
      play_game
    else
      puts "Goodbye"
    end
  end

  def play_game
    @computer.computer_placement
    @player.player_cruiser_placement
    @player.player_submarine_placement
    turn
    end_game
  end
end


  #
  #  if user_input == "q"
  #    puts "Goodbye!"
  #  end
  # end

  # def setup
  #   # computer places ships
  #   # player gets message to place ships
  #   # player places ship
  #   # if placements are valid show rendered player board with ship showing
  #   # player places next ship
  #   # if placements are valid shows rendered player board with both ships
  # end
  #
  # def turn
  #   #displays boards
  #   # player picks coordinate to fire on
  #   # computer choses random coordinate to fire on
  #   # reports result of playrs shot
  #   # reports result of computer shot
  #
  # end
  #
  # def results
  #   # displays players shot m/h/s
  #   # displays computer shot m/h/s
  # end
  #
  # def end_message
  #
  # end

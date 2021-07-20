require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/player'
require './lib/computer'

class Game
  attr_reader :end_message, :computer
  def initialize
    @end_message = end_message
    @computer_board = Board.new
    @player_board = Board.new
    @computer = Computer.new(@player_board, @computer_board)
    @player = Player.new(@player_board, @computer_board)
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
  end

  def turn
    # until end_game do
      puts " ==== DEEP THOUGHT(The great supercomputer) ===="
      puts @computer_board.render
      puts " ==== YOU ARE ONLY HUMAN ===="
      puts @player_board.render(true)
      # require "pry"; binding.pry
      # @computer.select_coordinate(@computer_board)
      @computer.computer_fires(@player_board)
      @player.player_select_coordinate(@computer_board)
      # require "pry"; binding.pry
      @computer.comp_render_and_report(@player_board)
      @player.player_render_and_report(@computer_board)
    # end
  end

  def end_game
    if @player.cruiser.health == 0 && @player.submarine.health == 0
      puts "You have been defeated!"
    elsif @computer.ships.health == 0
      puts "victory!"
    end
    play_again
  end

  def play_again
    puts "play again, or quit?"
    user_input = gets.chomp.downcase
      if user_input == "play again"
        start
      elsif user_input == "quit"
        puts "peace!"
        #else that wasnt valid try again? But seriously only if we have time
      end
  end
end

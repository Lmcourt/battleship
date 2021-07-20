require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/player'
require './lib/computer'

class Game
  attr_reader :end_message, :computer, :computer_board, :player_board, :player
  def initialize
    @end_message = end_message
    @computer_board = Board.new
    @player_board = Board.new
    @computer = Computer.new(@player_board, @computer_board)
    @player = Player.new(@player_board, @computer_board)

  end

def welcome
  puts "Welcome to BATTLESHIP"
  puts "Enter P to play. Enter Q to quit."
end

  def start #dont test
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
    until game_over?
      turn
    end
      end_game_message
  end

  def game_over?
  return true if @player.cruiser.health == 0 && @player.submarine.health == 0 || @computer.ships.all? {|ship| ship.health == 0}

  end

  def turn
      # until game_over? do
      puts " ==== DEEP THOUGHT(The great supercomputer) ===="
      puts @computer_board.render
      puts " ==== YOU ARE ONLY HUMAN ===="
      puts @player_board.render(true)
      # require "pry"; binding.pry
      # @computer.select_coordinate(@computer_board)
      @computer.computer_fires(@player_board)
      @player.player_select_coordinate(@computer_board)
      @player.player_fires(@computer_board)
      @computer.comp_render_and_report(@player_board)
      @player.player_render_and_report(@computer_board)
    # end
  end

  def end_game_message
    if @player.cruiser.health == 0 && @player.submarine.health == 0
      puts "You have been defeated!"
       return "You have been defeated!"
    elsif @computer.ships.all? {|ship| ship.health == 0}
      puts "Victory!"
       "Victory!"
    else
      " "
    end
  end

  def play_again #dont test
    puts "play again, or quit?"
    user_input = gets.chomp.downcase
      if user_input == "play again"
        start
      elsif user_input == "quit"
        puts "peace!"
        #else that wasnt valid try again? But seriously only if we have time
      else
        puts "You suck. Goodbye."
      end
  end
end

 #add loop
#if p, place ships -- loop starts after ship placed

class Game
  attr_reader :welcome, :end_message
  def initialize
    @welcome = welcome
    @end_message = end_message
  end

  def welcome
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    user_input = gets.chomp.downcase
  end

  def game_play
    while @end_message != "You won!" || "I won!" do

    end

    game_play if user_input = "p"
    puts "Goodbye!" if user_input = "q"
  end

  def setup
    # computer places ships
    # player gets message to place ships
    # player places ship
    # if placements are valid show rendered player board with ship showing
    # player places next ship
    # if placements are valid shows rendered player board with both ships
  end

  def turn
    #displays boards
    # player picks coordinate to fire on
    # computer choses random coordinate to fire on
    # reports result of playrs shot
    # reports result of computer shot

  end

  def results
    # displays players shot m/h/s
    # displays computer shot m/h/s
  end

  def end_message

  end

end

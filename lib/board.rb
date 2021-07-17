class Board

  attr_reader :the_board, :numbers, :letters
  def initialize
    @the_board = {}
  end

  def cells
    @the_board = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
    }
  end

  def valid_coordinate?(key)
    cells.has_key?(key)
  end



  def valid_placement?(ship, coordinates)
# require "pry"; binding.pry
    #sets up the array for numbers
    numbers = []
    #iterates over the coordinates and puts the number string into array as integer
    coordinates.each { |coordinate| numbers << coordinate[1].to_i }

    #sets up the array for letters
    letters = []
    #iterates over the coordiantes and puts the letters into an array as numbers
    coordinates.each { |coordinate| letters << coordinate[0].ord }

    # if all letters are the same and the ship length == coordinate length and the second number is 1 more than the first(consecutive)
    if letters.uniq.count == 1 && ship.length == coordinates.length && numbers.each_cons(2).all? { |first, second| second == first + 1 }
    elsif
      #same but reverse letters and numbers
      numbers.uniq.count == 1 && ship.length == coordinates.length && letters.each_cons(2).all? { |first, second| second == first + 1 }
    else
      #or it's not valid
     false
    end
  end
end

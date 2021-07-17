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
#send a coordinate 1 by by in the method
#takes an array, is this one a valid coordinate, use all? (ennumerabler) do all of you make this block true?
  def valid_coordinate?(key)
    cells.has_key?(key)
  end

  def valid_placement?(ship, coordinates)
<<<<<<< HEAD
    ship.length == coordinates.length
    array = []
    cells.keys.each_cons(ship.length) do |cell|
    array << cell
    end
    array.any? do |a|
    end

    # def check_row
    #   horizontal_array = []
    #
    #   cells.keys.each_cons(ship.length) do |key|
    #     horizontal_array << key
    #   end
    #   horizontal_array.any? do |horizontal|
    #     horizontal == coordinates
    #   end

      # not really sure, but probably going to need to do something similar.
      # this is just an 'outline'
  #   def check_columns

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
      true
    elsif
      #same but reverse letters and numbers
      numbers.uniq.count == 1 && ship.length == coordinates.length && letters.each_cons(2).all? { |first, second| second == first + 1 }
      true
    else
      #or it's not valid
      false
    end
  end

    # value_arrays = []
    # cells.values.each do |value|
    #   value_arrays <<  value.split(/\W+/)
    # end

# make a game class

# make a seperate player and computer class


    # letters = []
    # letters << cells.values.split(0)
    # numbers = []

    # cells.keys.each_cons.each(ship.length) do |key|
    #   horizontal_array << key
    # end
    # horizontal_array.map do |array|
    #   # delete-if or reject!
    # end
    # horizontal_array.any? do |horizontal|
    #   horizontal == coordinates
    # end


#check if num lets are the same and consecutive
  # def check_columns
  #   require "pry"; binding.pry
  #   vertical_array = []
  #   horizontal_array.each_cons(4) do |array|
  #     vertical_array << array
  #   end
  # end

  # def valid_placement?(ship, coordinates)
  #     # not really sure, but probably going to need to do something similar.
  #     # this is just an 'outline'
>>>>>>> 1b78f0055f21f02a3c2dffb66815bda4cb3a1b3f
  #     vertical_array = []
  #
  #     cells.keys.each_cons(ship.length) do |key|
  #       vertical_array << key
  #     # end
  #     # vertical_array.any? do |vertical|
  #     #   vertical == coordinates
  #
  #     vertical_array.transpose
  #
  # end
  # vertical_array
end
end

#do with numbers
#compare with coordinates to see if consecutive
###if diagonal or not -
#cells being stored in a hash, dont worry about 4x4 grid
#you will work with nested collection rather than single hash
#all the same letter or all the same number will be shared
#you can place a ship backwards
#ship laced on a1 a2 a3 is valid, backwards is not valid
#no diagonal, no empty space, three length on two, place off the board

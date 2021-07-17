class Board

  attr_reader :the_board
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
    letters = []
    coordinates.each do |coordinate|
      letters << coordinate[0]
    end

    numbers = []
    coordinates.each do |coordinate|
      numbers << coordinate[1]
    end

    numbers.each_cons

    if letters.uniq.count <= 1 && ship.length == coordinates.length
    elsif numbers.uniq.count <= 1 && ship.length == coordinates.length
    else
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
  #     vertical_array = []
  #   #something.each_cons(ship.length) do |key|
  #       vertical_array << key
  #     end
  #     vertical_array = horizontal_array.transpose.each do |cell|
  #
  # end
end
# split letters and numbers and check if all letters or all numbers are the same
#check if in the same row or column

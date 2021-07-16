require 'pry'
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
#send a coordinate 1 by by in the method
#takes an array, is this one a valid coordinate, use all? (ennumerabler) do all of you make this block true?
  def valid_coordinate?(key)
    cells.has_key?(key)
  end

  def valid_placement?(ship, coordinates)
    ship.length == coordinates.length
    array = []
    cells.keys.each_cons(ship.length) do |cell|
    array << cell
    end
    array.any? do |a|
    end
    cells.keys.diagonal("A1","B2","C3") == false
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

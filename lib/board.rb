require 'pry'
class Board

  attr_reader :the_board
  def initialize
    @the_board = {}
  end

  def cells
    @the_board = {
      "A1" => Cell.new("A1 value"),
      "A2" => Cell.new("A2 value"),
      "A3" => Cell.new("A3 value"),
      "A4" => Cell.new("A4 value"),
      "B1" => Cell.new("B1 value"),
      "B2" => Cell.new("B2 value"),
      "B3" => Cell.new("B3 value"),
      "B4" => Cell.new("B4 value"),
      "C1" => Cell.new("C1 value"),
      "C2" => Cell.new("C2 value"),
      "C3" => Cell.new("C3 value"),
      "C4" => Cell.new("C4 value"),
      "D1" => Cell.new("D1 value"),
      "D2" => Cell.new("D2 value"),
      "D3" => Cell.new("D3 value"),
      "D4" => Cell.new("D4 value")
    }
  end

  def valid_coordinate?(key)
    cells.has_key?(key)
  end

  def valid_placement?(ship, coordinates)
    
  end
end

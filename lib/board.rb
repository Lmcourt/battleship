class Board

  attr_reader :numbers, :letters, :cells
  def initialize
    @cells = generate_cells
  end

  def generate_cells
     {
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
    numbers = get_numbers(coordinates)
    letters = get_letters(coordinates)

    return false if coordinates.any? {|coordinate| @cells[coordinate].ship}
    return false if ship.length != coordinates.length
    return true if letters.uniq.count == 1 &&  numbers.each_cons(2).all? { |first, second| second == first + 1 }
    return true if numbers.uniq.count == 1 &&  letters.each_cons(2).all? { |first, second| second == first + 1 }
    false
  end

  def get_numbers(coordinates)
      coordinates.map { |coordinate| coordinate[1].to_i }
  end

  def get_letters(coordinates)
      coordinates.map { |coordinate| coordinate[0].ord }
  end

  def place(ship, coordinates)
    coordinates.each do  |coordinate|
      @cells[coordinate].place_ship(ship)
    end

  end
  def render(show_ship = true)
    output = "  1 2 3 4 \n"
    #add into an output? string.split
    letters =  ["A", "B", "C", "D"]

    @cells.values.each_slice(4) do |cell_group|
    letters.map do |letter|
          cell_group.each do |cell|
            output << " " + cell.render
          end
        end
        output << letter + cell_group.join
      output <<  " \n"
    end
    output
  end

end


#inject and reduce same something
#need accumulator
#


#cell 3 ship == cell 2 ship
#assignment pattern a) need container
    # think of . as iterate over our coordinates
        # take individual coordinate and assign value of ship
  # place the ship which already has the place_ship method
#do with numbers
#compare with coordinates to see if consecutive
###if diagonal or not -
#cells being stored in a hash, dont worry about 4x4 grid
#you will work with nested collection rather than single hash
#all the same letter or all the same number will be shared
#you can place a ship backwards
#ship laced on a1 a2 a3 is valid, backwards is not valid
#no diagonal, no empty space, three length on two, place off the board

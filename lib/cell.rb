class Cell
attr_reader :coordinate, :ship
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil #nil by default
    @is_empty = true #empty by default
    @fired_upon = false
  end

  def empty?
    @is_empty
  end

  def place_ship(ship)
    @ship = ship
    @is_empty = false
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @ship.hit if @is_empty == false
    @fired_upon = true
  end

  def render(x = false)
    if @fired_upon == false && @ship == false
      "."
    elsif @fired_upon == true && @is_empty == true
       "M"
    end
  end
end

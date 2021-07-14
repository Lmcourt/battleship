class Cell
attr_reader :coordinate, :ship, :render
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil #nil by default
    @is_empty = true #empty by default
    @fire_upon = false
    @render = "."
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

end

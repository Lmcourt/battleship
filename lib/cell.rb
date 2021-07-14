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
    @fire_upon
  end

  def fire_upon
    @ship.hit
    @fire_upon = true
  end

  def render
    require "pry"; binding.pry
    @fire_upon = true
    @render = "M"
  end

end

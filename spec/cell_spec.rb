require './lib/ship'
require './lib/cell'

RSpec.describe do
  it 'exists' do
    cell = Cell.new("B4")

    expect(cell).to be_a(Cell)
  end

  it 'has coordinates' do
    cell = Cell.new("B4")

    expect(cell.coordinate).to eq("B4")
  end

  xit 'is empty' do
    cell = Cell.new("B4")

    expect(cell.ship).to eq(nil)
    expect(cell.empty?).to eq(true)
  end

  xit 'has a ship' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    expect(cell.ship).to be_a(Ship)
    expect(cell.empty?).to eq(false)
  end

  xit 'is fired upon empty cell' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    expect(cell.fired_upon?).to eq(false)
  end

  xit 'is reducing ships health by one' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    cell.fire_upon
    expect(cell.ship.health).to eq(2)
    expect(cell.fired_upon?).to eq(true)
  end

  xit 'is a miss' do
    cell_1 = Cell.new("B4")

    expect(cell_1.render).to eq(".")
    cell_1.fire_upon
    expect(cell_1.render).to eq("M")
  end

  


end

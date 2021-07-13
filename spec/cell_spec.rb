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

  it 'is empty' do
    cell = Cell.new("B4")

    expect(cell.ship).to eq(nil)
    expect(cell.empty?).to eq(true)
  end

  it 'has a ship' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)

    expect(cell.ship).to eq(cruiser)
    expect(cell.empty?).to eq(false)
  end
end

require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/game'
require './lib/computer'

RSpec.describe do
  it 'exists' do
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    computer = Computer.new

    expect(cruiser).to be_a(Ship)
    expect(submarine).to be_a(Ship)
    expect(computer).to be_a(Computer)
  end

  it 'has ships' do
    computer = Computer.new

    computer.computer_ships

    expect(computer.ships[0].name).to eq("Cruiser")
    expect(computer.ships[1].name).to eq("Submarine")
  end
end

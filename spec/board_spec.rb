require './lib/board'
require './lib/ship'
require './lib/cell'
require 'pry'

RSpec.describe Board do
  it 'exists' do
    board = Board.new

    expect(board).to be_a(Board)
  end

  it 'has cells' do
    board = Board.new

    expect(board.cells).to be_a(Hash)
  end

  it 'has valid coordinates' do
    board = Board.new

    expect(board.valid_coordinate?("A1")).to eq(true)
    expect(board.valid_coordinate?("D4")).to eq(true)
    expect(board.valid_coordinate?("A5")).to eq(false)
    expect(board.valid_coordinate?("E1")).to eq(false)
    expect(board.valid_coordinate?("A22")).to eq(false)
  end

  it "validates placements" do

    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
    expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
    expect(board.valid_placement?(submarine, ["A1", "B1", "C1"])).to eq(false)
  end

  it "validates consecutive coordinates" do

    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
    expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
    expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)

    expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)

    # extra test to see if a true statement returns true
    # why are they coming back nil when all conditions pass in pry?

    expect(board.valid_placement?(submarine, ["A2", "A3"])).to eq(true)
    expect(board.valid_placement?(submarine, ["B1", "C1"])).to eq(true)
  end

  it "cannot be diagonal" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
    expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
  end

  it 'checks out' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
    expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
  end

  it 'places ships' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)

    board.place(cruiser, ["A1", "A2", "A3"])

    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]
    expect(cell_3.ship == cell_2.ship).to eq(true)
    expect(board.cells["A1"]).to eq(cell_1)
    expect(board.cells["A2"]).to eq(cell_2)
    expect(board.cells["A3"]).to eq(cell_3)
    # expect(cell_3.ship == cell_2.ship).to eq(true)
    # expect(cell_3.ship == cell_2.ship).to eq(true)
    # expect(cell_3.ship == cell_2.ship).to eq(true)
  end

  it 'make sure ships do not overlap' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)

    board.place(cruiser, ["A1", "A2", "A3"])

    submarine = Ship.new("Submarine", 2)
    expect( board.valid_placement?(submarine, ["A1", "B1"])).to eq(false)
  end
end

require './lib/board'
require './lib/ship'
require './lib/cell'

RSpec.describe Board do
  it 'exists' do
    board = Board.new

    expect(board).to be_a(Board)
  end

  it 'has cells' do
    board = Board.new

    expect(board.cells).to be_a(Hash)
  end

  it 'is valid' do
    board = Board.new

    expect(board.valid_coordinate?("A1")).to eq(true)
    expect(board.valid_coordinate?("D4")).to eq(true)
    expect(board.valid_coordinate?("A5")).to eq(false)
    expect(board.valid_coordinate?("E1")).to eq(false)
    expect(board.valid_coordinate?("A22")).to eq(false)
  end

<<<<<<< HEAD
  it 'validates placement' do
=======
  xit "validates placements" do
>>>>>>> c7d844fdcca83c7b70a28be0c3aa1b7156ca3d59
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
    expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
  end

<<<<<<< HEAD
  it 'is consecutive' do
=======
  it "validates consecutive coordinates" do
>>>>>>> c7d844fdcca83c7b70a28be0c3aa1b7156ca3d59
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
    expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
    expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
<<<<<<< HEAD
    expect(board.valid_placement?(submarine, ["C1", "B1"])).to be(false)
    # extra test to see if a true statement returns true
    expect(board.valid_placement?(submarine, ["A2", "A3"])).to eq(true)

=======
    expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
>>>>>>> c7d844fdcca83c7b70a28be0c3aa1b7156ca3d59
  end
end

# diagonal either all the same number or all the same letter

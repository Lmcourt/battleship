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
end

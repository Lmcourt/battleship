require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/game'

RSpec.describe Game do
  it 'exists' do
    game = Game.new
    expect(game).to be_a(Game)
  end

  it "welcomes player" do
    game = Game.new

    expect(welcome).to eq("")
  end
end

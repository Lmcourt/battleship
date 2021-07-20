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
    welcome = ""
    expect(welcome).to eq("")
    # expect(welcome).to eq("Enter P to play. Enter Q to quit.")
  end

  it "has a attributes" do
    game = Game.new

    expect(game.computer_board).to be_a(Board)
    expect(game.player_board).to be_a(Board)
    expect(game.computer).to be_a(Computer)
    expect(game.player).to be_a(Player)
  end

  it "player has lost" do
    game = Game.new
    game.player.cruiser.hit
    game.player.cruiser.hit
    game.player.cruiser.hit

    game.player.submarine.hit
    game.player.submarine.hit
    expect(game.end_game_message).to eq("You have been defeated!")

  end
  it "computer has lost" do
    game = Game.new
    game.computer.cruiser.hit
    game.computer.cruiser.hit
    game.computer.cruiser.hit

    game.computer.submarine.hit
    game.computer.submarine.hit
    expect(game.end_game_message).to eq("Victory!")

  end

  it "has ended" do
    game = Game.new
    game.computer.cruiser.hit
    game.computer.cruiser.hit
    game.computer.cruiser.hit

    game.computer.submarine.hit
    game.computer.submarine.hit
    expect(game.game_over?).to eq(true)

  end
end

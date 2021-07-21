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

  it "plays the game" do
    game = Game.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(play_game).to eq()
  end

  # it "has a turn" do
  #   game = Game.new
  #
  #   expect(turn).to eq()
  # end

  # it "has an end game message" do
  #   game = Game.new
  #
  #   expect(end_game_message).to eq()
  # end

  it "places the players cruiser" do
    game = Game.new
    cruiser = Ship.new("Cruiser", 3)

    expect(player_cruiser_placement).to eq()
  end

  it "places the players submarine" do
    game = Game.new
    submarine = Ship.new("Submarine", 2)

    expect(player_submarine_placement).to eq()
  end

  # it "player turn" do
  #   game = Game.new
  #
  #   expect(player_turn).to eq()
  # end

  it "places computer ship" do
    game = Game.new

    expect(computer_placement).to eq()
  end

  it "computer fires" do
    game = Game.new

    expect(computer_fires).to eq()
  end

  # it "renders" do
  #   game = Game.new
  #
  #   expect(comp_render_and_report).to eq()
  # end

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

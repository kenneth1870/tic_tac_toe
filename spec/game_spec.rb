require 'game'
require 'position'
describe 'Game' do
  let(:position) { Position.new }
  before :all do
    @player = 'human'
  end

  before :each do
    @game = Game.new(@player)
  end
  context 'at initialization' do
    it '#initialize user' do
      expect(@game.player).equal? @player
    end
  end
  context 'when play' do
    it '#ask_for_move returns the position' do
      option = 2
      expect(option).equal? option =~ /^\d+$/ && position.board[option.to_i] == '-'
    end

    it '#other_player returns the user changed' do
      !expect(@game.player).equal? @player
    end

    it '#play returns winner' do
      position.blocked? ? expect('Draw') : expect("Winner: #{@game.other_player}")
    end
  end
end

require 'position'
describe 'Position' do
  let(:position) { Position.new }
  context 'at initialization' do
    it '#initialize @board' do
      expect(position.board).to eq(['-', '-', '-', '-', '-', '-', '-', '-', '-'])
    end
    it '#initialize @turn' do
      expect(position.turn).to eq('x')
    end
  end
  context 'when is playing' do
    it '#other_turn change turn' do
      !expect(position.turn).to eq('x')
    end
    it '#move returns a performed move' do
      expect(self)
    end
    it '#unmove returns a performed unmove' do
      expect(self)
    end

    it '#possible_moves array with possible_moves' do
      positon = [1]
      expect([2, 3, 4]).to eq([1, 2, 3, 4] - positon)
    end
  end
end

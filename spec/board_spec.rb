require 'board'
describe 'Board' do
  let(:board) { Board.new }
  describe 'initialize' do
    context 'when passed a size argument' do
      it "sets the board's size to the value passed in" do
        board = Board.new(9)
        expect(board.board).to eq(['-', '-', '-', '-', '-', '-', '-', '-', '-'])
      end
    end
  end
end

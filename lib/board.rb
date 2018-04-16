class Board
  attr_accessor :board
  def initialize(size)
    @board = Array.new(size, '-')
  end
end

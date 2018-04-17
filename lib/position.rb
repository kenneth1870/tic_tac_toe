require_relative 'board.rb'
class Position
  attr_accessor :board, :turn
  def initialize(board = nil, turn = 'x')
    @dim = 3
    @size = @dim * @dim
    @board = board || Board.new(@size).board
    @turn = turn
    @movelist = []
  end

  def other_turn
    @turn == 'x' ? 'o' : 'x'
  end

  def move(idx)
    @board[idx] = @turn
    @turn = other_turn
    @movelist << idx
    self
  end

  def unmove
    @board[@movelist.pop] = '-'
    @turn = other_turn
    self
  end

  def possible_moves
    @board.map.with_index { |piece, idx| piece == '-' ? idx : nil }.compact
  end

  def win_lines
    (
      (0..@size.pred).each_slice(@dim).to_a +
      (0..@size.pred).each_slice(@dim).to_a.transpose +
      [(0..@size.pred).step(@dim.succ).to_a] +
      [(@dim.pred..(@size - @dim)).step(@dim.pred).to_a]
    ).map { |line| line.map { |idx| @board[idx] } }
  end

  def win?(piece)
    win_lines.any? do |line|
      line.all? { |line_piece| line_piece == piece }
    end
  end

  def blocked?
    win_lines.all? do |line|
      line.any? { |line_piece| line_piece == 'x' } &&
        line.any? { |line_piece| line_piece == 'o' }
    end
  end

  def evaluate_leaf
    return 100 if win?('x')
    return - 100 if win?('o')
    return    0 if blocked?
  end

  def minimax(idx = nil)
    move(idx) if idx
    leaf_value = evaluate_leaf
    return leaf_value if leaf_value
    possible_moves.map do |idx|
      minimax(idx).send(@turn == 'x' ? :- : :+, @movelist.count + 1)
    end.send(@turn == 'x' ? :max : :min)
  ensure
    unmove if idx
  end

  def best_move
    possible_moves.send(@turn == 'x' ? :max_by : :min_by) { |idx| minimax(idx) }
  end

  def end?
    win?('x') || win?('o') || @board.count('-').zero?
  end

  def to_s
    @board.each_slice(@dim).map do |line|
      ' ' + line.map { |piece| piece == '-' ? ' ' : piece }.join(' | ') + ' '
    end.join("\n-----------\n") + "\n"
  end
end

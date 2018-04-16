require_relative 'position.rb'
class Game
  attr_accessor :player

  def initialize(player)
    @player = player
  end

  def ask_for_move(position)
    loop do
      print 'Human is your turn:  '
      ans = gets.chomp
      return ans.to_i if ans =~ /^\d+$/ && position.board[ans.to_i] == '-'
    end
  end

  def other_player
    @player == 'human' ? 'computer' : 'human'
  end

  def play
    position = Position.new
    until position.end?
      puts position
      puts
      idx = @player == 'human' ? ask_for_move(position) : position.best_move
      position.move(idx)
      @player = other_player
    end
    puts position
    if position.blocked?
      puts 'Draw'
    else
      puts "Winner: #{other_player}"
    end
  end
end

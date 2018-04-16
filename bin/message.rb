require_relative '../lib/error'

class Message
  def self.welcome
    puts %(
      ******************************************
         TIC TAC TOE : By Kenneth Rosales
      ******************************************
               Welcome to Tic Tac Toe.)
  end

  def self.option
    puts %(1. Start\n2. Exit)
    print 'Choose your option '
    option = gets.chomp
    option
  end

  def self.confirm_exit
    print 'Are you sure you want to quit? (y/n) '
    gets.chomp.downcase.include?('y')
  end

  def self.show_invalid_input(input)
    puts "Input '#{input}' is invalid!"
  end

  def self.display_error(e)
    puts "Error! => #{e.message}"
  end

  def self.show_winner(player)
    puts "Congratulations #{player}, you've won the game!"
  end

  def self.player
    puts %( Who do you want to play first?\n1. Human\n2.Computer)
    loop do
      puts 'choice: '
      ans = gets.chomp
      return 'human'    if ans == '1'
      return 'computer' if ans == '2'
    end
  end
end

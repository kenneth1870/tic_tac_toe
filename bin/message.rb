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
    puts %(1. Start
           2. Exit
          )
    print 'Choose your option '
    option = gets.chomp
    option
  end


  def self.confirm_exit
    print 'Are you sure you want to quit? (y/n) '
    input = gets.chomp
    input = input.downcase
    input.include?('y')
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

end

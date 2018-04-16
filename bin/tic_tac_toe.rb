#!/usr/bin/env ruby
 require_relative 'message.rb'
 require_relative '../lib/game.rb'

option = "0"
Message.welcome

until option == '2'

  option = Message.option

  if option == '1'

      begin
      Game.new.play
      rescue ExitError => e
        break
      end

  elsif option == '2'
    quit = Message.confirm_exit
    if quit
      break
    else
      option = '0'
    end
  else
    Message.invalid_input(option)
  end
end

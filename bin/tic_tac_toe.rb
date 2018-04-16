#!/usr/bin/env ruby
require_relative 'message.rb'
require_relative '../lib/game.rb'

option = '0'
Message.welcome

until option == '2'
  option = Message.option
  if option == '1'
    begin
      player = Message.player
      puts 'Please choose a number from 0 - 8.'
      Game.new(player).play
    rescue ExitError => e
      break
    end
  elsif option == '2'
    quit = Message.confirm_exit
    break if quit
    option = '0'
  else
    Message.invalid_input(option)
  end
end

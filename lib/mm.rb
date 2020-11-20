#!/usr/bin/env ruby

require './lib/mm/settings_module.rb'
require './lib/mm/board_class.rb'
require './lib/mm/player_class.rb'
require './lib/mm/playerAI_class.rb'
require './lib/mm/game_class.rb'
include Settings

mastermind_game = Game.new
mastermind_game.play
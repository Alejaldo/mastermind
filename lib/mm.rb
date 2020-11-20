#!/usr/bin/env ruby

require './mm/settings_module.rb'
require './mm/board_class.rb'
require './mm/player_class.rb'
require './mm/playerAI_class.rb'
require './mm/game_class.rb'
include Settings

mastermind_game = Game.new
mastermind_game.play
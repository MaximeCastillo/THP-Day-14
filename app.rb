require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'game.rb'
require 'player.rb'

# Création d'une partie
my_game = Game.new

#my_game.play

binding.pry
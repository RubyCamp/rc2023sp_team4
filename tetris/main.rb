require 'dxruby'
require_relative 'map'
require_relative 'block'
require_relative 'player_move'
require_relative 'player1'

Window.width = 320
Window.height = 416

map = Map.new
player1 = Player1.new
Window.loop do
  map.update
  map.draw
  player1.update
  player1.draw
end

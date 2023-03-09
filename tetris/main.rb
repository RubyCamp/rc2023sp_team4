require 'dxruby'
require_relative 'map'
require_relative 'block'

Window.width = 320
Window.height = 416

map = Map.new

Window.loop do
  map.update
  map.draw
end

require 'dxruby'
require_relative 'map'
require_relative 'block'

Window.width = 800
Window.height = 600

map = Map.new

Window.loop do
  map.update
  map.draw
end

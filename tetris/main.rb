require 'dxruby'
require_relative 'map'
require_relative 'block'
require_relative 'player_move'
require_relative 'player1'
require_relative 'title'

Window.width = 320
Window.height = 416

background = Image.load('../img/background.png')

sound = Sound.new('../img/Tetris.wav')
loop_count = 0

current_director = Title.new
player1 = Player1.new

Window.loop do
  current_director.draw
if Input.key_push?(K_A)
  current_director = Map.new
  break
end

end
Window.loop do
  Window.draw(0, 0, background)
  sound.play if loop_count % 796 == 0
  current_director.update
  current_director.draw
  player1.update
  player1.draw
  loop_count += 1
end

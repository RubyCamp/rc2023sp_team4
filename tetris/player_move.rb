require 'pp'
class Move
  attr_accessor :pattern_map, :x, :y

  def initialize(mx, my)
    self.x = mx
    self.y = my
    self.pattern_map = [
      [0, 1, 0],
      [0, 1, 1],
      [0, 1, 0]
    ]
    @jump = 0
    @maxjump = -1.0
    @jumped = false
  end

  def update
    self.y += 0.02 if self.y.to_i < (Map::MAP_HEIGHT - self.pattern_map.length + 0.02).to_i

    if Input.key_down?(K_A) and self.x + 0.3 > 0 
        self.x -= 0.1 #左　移動

    elsif Input.key_down?(K_D) and self.x <(Map::MAP_WIDTH - self.pattern_map.length)         
        self.x += 0.1 #右　移動
    end

    if Input.key_push?(K_V) and @jumped ==false 
        if @maxjump < @jump
            @jamped = true
            self.y -= 0.5 # 上
            @jump += 0.5
            
        else
            self.y += 0.1
            @jump -=0.1

        end
        if @jump <= 0
          @jumped = false
        end
    end
end
end

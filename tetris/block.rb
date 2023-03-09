require "pp"
class Block 
  attr_accessor :pattern_map, :x, :y
  def initialize(mx, my)
    self.x = mx
    self.y = my
    self.pattern_map = [
      [0, 1, 0],
      [0, 1, 1],
      [0, 1, 0]
    ]
    @any = 0
    @d = 0
    @r = 0
    @l = 0
  
  end

  def update
    if Input.key_push?(K_K) and self.y < (Map::MAP_HEIGhT - self.pattern_map.length)
      self.pattern_map = self.pattern_map.transpose.map(&:reverse) 
      @any += 1
      p @any # 確認用　後で消します
    end
 
    if @any == 4 
      @any = 0 
    elsif @any == 3  
      @d = 2
      @r = 0
    elsif @any == 2 
      @l = -1
      @r = 1
    elsif @any == 1
      @l = -1
    elsif @any == 0 
      @l = 0
    end

    self.y += 0.02 if self.y - @d < (Map::MAP_HEIGhT - self.pattern_map.length)
    self.y += 0.05 if Input.key_down?(K_DOWN) and self.y - @d < (Map::MAP_HEIGhT - self.pattern_map.length) and self.y < (Map::MAP_HEIGhT - self.pattern_map.length)
    self.x += 0.3 if Input.key_down?(K_RIGHT) and self.x - @r < (Map::MAP_WIDTH - self.pattern_map.length) and self.y < (Map::MAP_HEIGhT - self.pattern_map.length)
    self.x -= 0.3 if Input.key_down?(K_LEFT) and self.x + @l > 0 and self.y < (Map::MAP_HEIGhT - self.pattern_map.length)
  end
end
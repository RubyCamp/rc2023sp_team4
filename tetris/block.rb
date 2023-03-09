require "pp"
class Block 
  attr_accessor :pattern_map, :x, :y, :stopped
  def initialize(mx, my)
    self.x = mx
    self.y = my
    self.pattern_map = [
      [0, 1, 0],
      [0, 1, 1],
      [0, 1, 0]
    ]
    @bottom_limit = Map::MAP_HEIGhT - self.pattern_map.length
    @right_limit = Map::MAP_WIDTH - self.pattern_map.length
    @stopped = false
    @movable = true
  end

  def stop
    @movable = false
    @stopped = true
    self.y -= 1 if @stopped
  end

  def update
=begin
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
=end


    #------自由落下----------

    self.y += 1 if @movable
    self.y = @bottom_limit if self.y >= @bottom_limit

    #------操作(左右の動き　条件付き)-------------

    self.x += 1 if Input.key_down?(K_RIGHT)  and  self.x < @right_limit  and  self.y < @bottom_limit
    self.x -= 1 if Input.key_down?(K_LEFT) and self.x > 0 and self.y < @bottom_limit

    #------操作(左右の動き　条件付き)-------------

    self.y += 1 if self.y < @bottom_limit if Input.key_down?(K_DOWN)
    

    #self.y += 0.02 if self.y - @d < (Map::MAP_HEIGhT - self.pattern_map.length)
    

    #self.y += 0.02 if self.y - @d < (Map::MAP_HEIGhT - self.pattern_map.length)
    #self.y += 0.05 if Input.key_down?(K_DOWN) and self.y - @d < (Map::MAP_HEIGhT - self.pattern_map.length) and self.y < (Map::MAP_HEIGhT - self.pattern_map.length)
    #self.x += 0.3 if Input.key_down?(K_RIGHT) and self.x - @r < (Map::MAP_WIDTH - self.pattern_map.length) and self.y < (Map::MAP_HEIGhT - self.pattern_map.length)
    #self.x -= 0.3 if Input.key_down?(K_LEFT) and self.x + @l > 0 and self.y < (Map::MAP_HEIGhT - self.pattern_map.length)
  end
  
  #------操作(右回転 配列の内容を変えています 条件:地面についているか否か)-------------

  def rotate_right
    self.pattern_map = self.pattern_map.transpose.map(&:reverse) if self.y < @bottom_limit
  end

  #-----------------------------------------------------

=begin  使用しない左回転
  def rotate_left
    self.pattern_map = self.pattern_map.transpose.reverse
  end
=end

end
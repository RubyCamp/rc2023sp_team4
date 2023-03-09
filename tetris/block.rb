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
    @bottom_limit = Map::MAP_HEIGHT - self.pattern_map.length
    @right_limit = Map::MAP_WIDTH - self.pattern_map.length
    @stopped = false
    @movable = true
   
  end

  def stop
    @movable = false
    if @stopped == false
      self.y -= 1
      @stopped = true
    end
  end

  def update

    #------空白削除----------

    if @bottom_limit
      self.pattern_map.reject! {|i| i == [0,0,0]}
      p pattern_map
    end

    #------空白の削除--------
    if @bottom_limit
      pattern_map.reject! {|i| i == [0, 0, 0,] } #破壊的メソッド 
      p pattern_map
    end
    #------自由落下----------

    self.y += 1 if @movable
    self.y = @bottom_limit if self.y >= @bottom_limit

    #------操作(左右の動き　条件付き)-------------

    self.x += 1 if Input.key_down?(K_RIGHT)  and  self.x < @right_limit  and  self.y < @bottom_limit
    self.x -= 1 if Input.key_down?(K_LEFT) and self.x > 0 and self.y < @bottom_limit

    #------操作(左右の動き　条件付き)-------------

    self.y += 1 if self.y < @bottom_limit if Input.key_down?(K_DOWN)  
  end
  #------操作(右回転 配列の内容を変えています 条件:地面についているか否か)-------------

  def rotate_right
    self.pattern_map = self.pattern_map.transpose.map(&:reverse) if self.y < @bottom_limit
  end

end
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
  end

  def update
    self.y += 1
  end
end
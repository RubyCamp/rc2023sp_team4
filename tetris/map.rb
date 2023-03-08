class Map
  BLOCK_SIZE = 32
  MAP_HEIGHT = 13
  MAP_WEIGH = 10

  def initialize
    @blank_img = Image.new(BLOCK_SIZE, BLOCK_SIZE).circle_fill(16, 16, 15, C_RED)
    @block_img = Image.new(BLOCK_SIZE, BLOCK_SIZE).circle_fill(16, 16, 15, C_WHITE)

    @blocks = []
    @frame = 1
  end

  def update
    if Input.key_push?(K_SPACE)
      @blocks << Block.new(4, 2)
    end
    if @frame % 60 == 0
      @blocks.each do |block|
        block.update
      end
    end
    @frame += 1
  end

  def draw
    merged_map.each_with_index do |line, dy|
      line.each_with_index do |chip, dx|
        wx = dx * BLOCK_SIZE
        wy = dy * BLOCK_SIZE
        if chip == 0
          Window.draw(wx, wy, @blank_img)
        else
          Window.draw(wx, wy, @block_img)
        end
      end
    end
  end

  private

  def merged_map
=begin
      result = [
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    ]
=end
    result = []
    MAP_HEIGHT.times do
      line = []
      MAP_WEIGH.times do
        line << 0
      end
      result << line
    end
    

    @blocks.each do |block|
      block.pattern_map.each_with_index do |line, dy|
        line.each_with_index do |chip, dx|
          result[block.y + dy][block.x + dx] = chip
        end
      end
    end
    result
  end
end
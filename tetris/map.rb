class Map
  
  BLOCK_SIZE = 32
  MAP_HEIGHT = 13 
  MAP_WIDTH  = 10

  def initialize

    @blank_img = Image.new(BLOCK_SIZE, BLOCK_SIZE).circle_fill(16, 16, 15, C_WHITE)
    @block_img = Image.load('../img/tetlis_sky_small.png')
    @blank_img.set_color_key(C_WHITE)
    @block_img.set_color_key(C_WHITE)
    
    #@block_img = Image.new(BLOCK_SIZE, BLOCK_SIZE).circle_fill(16, 16, 15, C_WHITE)

    @blocks = []
    @frame = 1
  end

  def update
    if Input.key_push?(K_SPACE)
      @blocks << Block.new(MAP_WIDTH / 2 - 2, 0)
    end
    @blocks.each do |block|
      if block.stopped == false
        block.update if @frame % 30 == 0
        block.rotate_right if Input.key_push?(K_UP)
      end
      #block.rotate_left if Input.key_push?(K_LEFT)
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
    result = []
    MAP_HEIGHT.times do
      line = []
      MAP_WIDTH.times do
        line << 0
      end
      result << line
    end
      
    @blocks.each do |block|
      writable = true #描画可能トリガー
      block.pattern_map.each_with_index do |line, dy|
        line.each_with_index do |chip, dx|
          chip_tmp = result[block.y + dy][block.x + dx]
          if chip_tmp == 1
            writable = false
            block.stop
            break
          end
        end
        break unless writable
      end

        block.pattern_map.each_with_index do |line, dy|
          line.each_with_index do |chip, dx|
            result[block.y + dy][block.x + dx] = chip
          end
        end
    end
    result
  end
end
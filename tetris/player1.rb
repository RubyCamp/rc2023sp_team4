class Player1
    BLOCK_SIZE = 32 # １枠
    MAP_HEGHT = 13 # MAP縦
    MAP_WIDTH = 10 # MAP横
  
    def initialize # 初期値
      @char_img = Image.load('../img/tetlis_red_small.png')
      #@char_img = Image.new(BLOCK_SIZE, BLOCK_SIZE).circle_fill(16, 16, 15, C_GREEN)
      @char_img.set_color_key(C_WHITE)
    
      @frame = 1
      @player1 = Move.new(5, 10)#自分
      
    end
  
    def update #　メインループの操作
      if @frame % 1 == 0 #1フレームの速さ調節
        @player1.update
      end
      @frame += 1
      end
  
    def draw
      merged_map.each_with_index do |line, dy|
        line.each_with_index do |chip, dx|
          wx = dx * BLOCK_SIZE
          wy = dy * BLOCK_SIZE
  
          if chip == 1
            Window.draw(wx, wy, @char_img)
          end
        end
      end
    end
    
  
  
    private
  
    def merged_map
        result = []
        MAP_HEGHT.times do
            line = []
            MAP_WIDTH.times do 
              line << 0
        end
        result << line
        end
  
        @player1.pattern_map.each_with_index do |line, dy|
          line.each_with_index do |chip, dx|
            result[@player1.y + dy >= 13 ? 12 : @player1.y+dy][@player1.x + dx] = chip
          end
        end

      result
    end
  
    
  
  end
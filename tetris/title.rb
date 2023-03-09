require 'dxruby'
        
class Title
  def initialize
    @image = Image.load('../img/start.png')
    
  end

  def update
  end

  def draw  
    Window.draw(0,0,@image)
  end
end
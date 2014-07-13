require_relative 'canvas'
require_relative 'line'
require_relative 'plot'
require_relative 'rectangle'

class Fill < Plot
  attr_reader :x, :y, :colour

  def initialize(fill)
    @fill = fill
    parse_command

    unless x <= Canvas.current.x_coordinates && y <= Canvas.current.y_coordinates
      raise "Sorry that fill point is outside the canvas. Please try again."
    end
  end

  def parse_command
    input_array = @fill.split(" ")
    fill_object = input_array[0]
    @x = input_array[1].to_i
    @y = input_array[2].to_i
    @colour = input_array[3] 
  end

  def get_coordinates
    target_colour = Canvas.current.get_coordinate(x,y)
    @fill_coordinates = []
    flood_fill(x, y, target_colour, colour)
    @fill_coordinates
  end

  def flood_fill(x, y, target_colour, colour)
    return if target_colour == colour
    return if @fill_coordinates.include? [x,y]
    fill_content = Canvas.current.get_coordinate(x,y)
    return unless fill_content == target_colour
    @fill_coordinates << [x,y]
    
    flood_fill(x-1, y, target_colour, colour)
    flood_fill(x+1, y, target_colour, colour)
    flood_fill(x, y-1, target_colour, colour)
    flood_fill(x, y+1, target_colour, colour) 
  end

  def content
    colour
  end
end



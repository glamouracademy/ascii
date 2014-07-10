require_relative 'canvas'
require_relative 'line'
require_relative 'plot'
require_relative 'rectangle'

class Fill < Plot
  attr_reader :x, :y, :colour

  def initialize(fill)
    @fill = fill
    parse_command
  end

  def parse_command
    input_array = @fill.split(" ")
    fill_object = input_array[0]
    @x = input_array[1].to_i
    @y = input_array[2].to_i
    @colour = input_array[3] 
  end

  def get_coordinates
    fill_coordinate = [x,y]
    top_coordinate = [x,y-1]
    right_coordinate = [x+1,y]
    bottom_coordinate = [x,y+1]
    left_coordinate = [x-1,y]
    fill_point = [fill_coordinate, top_coordinate, right_coordinate, bottom_coordinate, left_coordinate]

    
  end

  def content
    colour
  end

end
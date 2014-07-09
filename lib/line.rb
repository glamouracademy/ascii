require_relative 'canvas'
require_relative 'plot'

class Line < Plot
  attr_reader :x1, :y1, :x2, :y2

  def initialize(line)
    @line = line
    parse_command

    unless x1 <= Canvas.current.x_coordinates && x2 <= Canvas.current.x_coordinates && y1 <= Canvas.current.y_coordinates && y2 <= Canvas.current.y_coordinates
      raise "Sorry that line won't fit on the canvas. Please try again."
    end
  end

  def parse_command
    input_array = @line.split(' ')
    canvas_object = input_array[0].upcase
    @x1 = input_array[1].to_i
    @y1 = input_array[2].to_i
    @x2 = input_array[3].to_i
    @y2 = input_array[4].to_i
    @line
  end

  def get_coordinates
    if y2 - y1 == 0
      middle_line_x_coordinates = (x1..x2).to_a
      line_coordinates_array = middle_line_x_coordinates.product([y2])
    else
      middle_line_y_coordinates = (y1..y2).to_a
      line_coordinates_array = [x2].product(middle_line_y_coordinates)
    end
  end  
end


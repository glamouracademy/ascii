require_relative 'canvas'
require_relative 'line'
require_relative 'plot'

class Rectangle < Plot
  attr_reader :x1, :y1, :x2, :y2

  def initialize(rectangle)
    @rectangle = rectangle
    parse_command
  end

  def parse_command
    input_array = @rectangle.split(' ')
    rectangle_object = input_array[0].upcase
    @x1 = input_array[1].to_i
    @y1 = input_array[2].to_i
    @x2 = input_array[3].to_i
    @y2 = input_array[4].to_i
    @rectangle
  end

  def get_top_line    
    "L #{x1} #{y1} #{x2} #{y1}" 
  end

  def get_left_line
    "L #{x1} #{y1} #{x1} #{y2}"
  end

  def get_bottom_line
    "L #{x1} #{y2} #{x2} #{y2}"
  end

  def get_right_line
    "L #{x2} #{y1} #{x2} #{y2}"
  end

  def get_coordinates
    top_line = Line.new(get_top_line)
    top_line = top_line.get_coordinates

    left_line = Line.new(get_left_line)
    left_line = left_line.get_coordinates

    bottom_line = Line.new(get_bottom_line)
    bottom_line = bottom_line.get_coordinates

    right_line = Line.new(get_right_line)
    right_line = right_line.get_coordinates

    rectangle_array = top_line + left_line + bottom_line + right_line
    rectangle_array = rectangle_array.uniq
  end

end

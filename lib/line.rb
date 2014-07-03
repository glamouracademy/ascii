require_relative 'canvas'

class Line
  attr_reader :x1, :y1, :x2, :y2

  def initialize(line)
    @line = line
    parse_command
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

  def plot(canvas)
    get_coordinates.each do |line_coordinate|
      x = line_coordinate[0]
      y = line_coordinate[1]
      canvas.plot_line(x,y)
    end
  end    
end

# 1. figure out which real coordinates are part of the line XXX
# 2. plot those coordinates to contain 'x' in the current canvas
# 3. output the current convas

# canvas = coordinates = [["0,0", "0,1", "0,2", "0,3", "0,4", "0,5"],["1,0"][][]]
require 'pry'

class Canvas
attr_reader :row_coordinates, :column_coordinates

  def initialize(canvas)
    @canvas = canvas
    parse_command
    setup_grid
  end

  def parse_command
    @canvas
    input_array = @canvas.split(' ')
    @canvas_object = input_array[0].upcase
    @y_coordinates = input_array[2].to_i
    @x_coordinates = input_array[1].to_i
    
    if @canvas_object!= 'C'
      raise "Sorry I don't recognize that command. Please try again."
    end

    unless @x_coordinates.integer? && @x_coordinates > 0
      raise "Sorry only positive numbers are accepted for the x coordinate. Please try again."
    end

    unless @y_coordinates.integer? && @y_coordinates > 0
      raise "Sorry only positive numbers are accepted for the y coordinates. Please try again."
    end
  end

  def setup_grid
    grid_rows = []
    grid_columns = []
    grid_coordinates = []

    rows = row_coordinates + 2
    rows.times do |n|
      grid_rows << n
    end
    

    columns = column_coordinates + 2
     columns.times do |n|
      grid_columns << n
    end

    grid_coordinates = grid_rows.product(grid_columns)

    grid_coordinates = grid_coordinates.map do |c|
      c.join(",")
    end

    @grid_coordinates = grid_coordinates.group_by { |x| x.chr }.values
  end

  def get_coordinate(x,y)
    @canvas
    requested_x = x+2
    requested_y = y+2
    requested_coordinate = @grid_coordinates[requested_x][requested_y]
  end

  def plot
    
    canvas_width = width + 2
    plotted_canvas_width = '-' * canvas_width + "\n"

    plotted_canvas = plotted_canvas_width + ('|'+ (' ' * width) + '|' + "\n") * canvas_height
    plotted_canvas += plotted_canvas_width
  end
end

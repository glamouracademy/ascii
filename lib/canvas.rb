require 'pry'

class Canvas

  def initialize(canvas)
    @canvas = canvas
    parse_command
    setup_grid
  end

  def parse_command
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
    @canvas
  end

  def setup_grid
    grid_rows = []
    grid_columns = []
    grid_coordinates = []

    rows = @x_coordinates + 2
    rows.times do |n|
      grid_rows << n
    end

    columns = @y_coordinates + 2
     columns.times do |n|
      grid_columns << n
    end

    grid_coordinates = grid_rows.product(grid_columns)

    grid_coordinates = grid_coordinates.map do |c|
      c.join(",")
    end

    @grid_coordinates = grid_coordinates.group_by { |x| x.split(',').first }.values
  end

  def get_coordinate(x,y)
    @canvas
    requested_x = x+2
    requested_y = y+2
    requested_coordinate = @grid_coordinates[requested_x][requested_y]
  end

  def plot
    @grid_coordinates.each { |a| a.fill " "}
    @grid_coordinates[0].fill("|")
    @grid_coordinates[-1].fill("|")
    @grid_coordinates.each do |a|
      a[0] = "-"
      a[-1] = "-"
    end
    @grid_coordinates
  end
end

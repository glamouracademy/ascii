require 'pry'

class Canvas
  attr_reader :x_coordinates, :y_coordinates

  def initialize(canvas)
    @canvas = canvas
    @@current_canvas = self
    parse_command
    setup_grid
    plot_border
  end

  def parse_command
    input_array = @canvas.split(' ')
    @canvas_object = input_array[0].upcase
    @y_coordinates = input_array[2].to_i
    @x_coordinates = input_array[1].to_i
    
    if @canvas_object!= 'C'
      raise "Sorry I don't recognize that command. Please try again."
    end

    unless x_coordinates.integer? && x_coordinates > 0
      raise "Sorry only positive numbers are accepted for the x coordinate. Please try again."
    end

    unless y_coordinates.integer? && y_coordinates > 0
      raise "Sorry only positive numbers are accepted for the y coordinate. Please try again."
    end

    @canvas
  end

  def self.current
    @@current_canvas
  end

  def setup_grid
    grid_rows = []
    grid_columns = []
    grid_coordinates = []

    rows = x_coordinates + 2
    rows.times do |n|
      grid_rows << n
    end

    columns = y_coordinates + 2
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
    requested_coordinate = @grid_coordinates[x][y]
  end

  def plot_border
    @grid_coordinates.each { |a| a.fill " "}
    @grid_coordinates[0].fill("|")
    @grid_coordinates[-1].fill("|")
    @grid_coordinates.each do |a|
      a[0] = "-"
      a[-1] = "-"
    end
  end

  def output
    grid_output = ""
    
    num_rows = @grid_coordinates[0].size

    num_rows.times do |i|  
      r = ""
      @grid_coordinates.each do |a|
        r << a[i]
      end
      grid_output << r << "\n"
    end 
    grid_output
  end

  def plot_content(x,y,content)
    @grid_coordinates[x][y] = content 
  end
end



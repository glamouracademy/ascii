class Canvas
attr_reader :row_coordinates, :column_coordinates

  def initialize(canvas)
    @canvas = canvas
    input_array = command.split(' ')
    @row_coordinates = input_array[2].to_i
    @column_coordinates = input_array[1].to_i
  end

  def command
    @canvas
  end

  def to_a
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

    grid_coordinates = grid_coordinates.group_by { |x| x.chr }.values

    grid_coordinates

  end

  def get_coordinate(x,y)
    @canvas
  end

  def plot
    input_array = command.split(' ')
    canvas_object = input_array[0].upcase

    if canvas_object!= 'C'
      raise "Sorry I don't recognize that command. Please try again."
    end

    width = input_array[1].to_i
    canvas_height = input_array[2].to_i

    unless width.integer? && width > 0
      raise "Sorry only positive numbers are accepted. Please try again."
    end

    unless canvas_height.integer? && canvas_height > 0
      raise "Sorry only positive numbers are accepted. Please try again."
    end

    canvas_width = width + 2
    plotted_canvas_width = '-' * canvas_width + "\n"

    plotted_canvas = plotted_canvas_width + ('|'+ (' ' * width) + '|' + "\n") * canvas_height
    plotted_canvas += plotted_canvas_width
  end
end

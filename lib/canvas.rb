class Canvas
  def initialize(canvas)
    @canvas = canvas
  end

  def command
    @canvas
  end

  def plot
    input_array = command.split(' ')
    canvas_object = input_array[0]
    width = input_array[1].to_i
    canvas_height = input_array[2].to_i

    canvas_width = width + 2
    plotted_canvas_width = '-' * canvas_width + "\n"

    plotted_canvas = plotted_canvas_width + ('|'+ (' ' * width) + '|' + "\n") * canvas_height
    plotted_canvas += plotted_canvas_width
  end




end


#create a canvas/make a canvas accessible to plot
#we need to get a command/pass the command to plot
#output the correct grid
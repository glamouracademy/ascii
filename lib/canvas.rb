class Canvas
  def initialize(canvas)
    @canvas = canvas
  end

  def command
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

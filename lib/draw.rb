require_relative 'canvas'

class Draw
  def initialize(line)
    @line = line
  end

  def command
    @line
  end

  def plot
    input_array = command.split(' ')
    canvas_object = input_array[0].upcase
    x1 = input_array[1].to_i
    y1 = input_array[2].to_i
    x2 = input_array[3].to_i
    y2 = input_array[4].to_i

    horizontal = y2 - y1
    vertical = x2 - x1

    plotted_canvas #can I get this from canvas.rb
    
    


    if horizontal == 0
      'x' * vertical + "\n"
    elsif vertical == 0
      ('x' + "\n") * horizontal
    end




  end
end
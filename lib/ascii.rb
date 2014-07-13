require_relative 'canvas'
require_relative 'line'
require_relative 'rectangle'
require_relative 'fill'

puts "Welcome to ASCII fun time draw time."

begin
  puts "Enter command:"
  command = gets
  command = command.chomp
  begin
    case command[0]
    when "C"
      canvas = Canvas.new(command)
      grid = canvas.output
      puts "Awesome!  Here's your canvas!" + "\n" + grid
    when "L"
      raise "You must create a canvas first." unless canvas
      line = Line.new(command)
      plot_line = line.plot(canvas)
      plotted_line = canvas.output
      puts "Fun! Here's your line!" + "\n" + plotted_line
    when "R"
      raise "You must create a canvas first." unless canvas
      rectangle = Rectangle.new(command)
      plot_rectangle = rectangle.plot(canvas)
      plotted_rectangle = canvas.output
      puts "Spectacular! Here's your rectangle!" + "\n" + plotted_rectangle
    when "B"
      raise "You must create a canvas first." unless canvas
      fill = Fill.new(command)
      plot_fill = fill.plot(canvas)
      plotted_fill = canvas.output
      puts "GOAL! Here's your fill!" + "\n" + plotted_fill
    end
  rescue => e
    puts e.message
  end
end until command == 'Q' || command == 'q'



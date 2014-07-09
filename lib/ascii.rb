require_relative 'canvas'
require_relative 'line'
require_relative 'rectangle'

puts "Welcome to ASCII fun time draw time. Please tell me your name."
name = gets
name = name.chomp
puts "Hello #{name}. To start a new canvas, please type the letter 'C' followed by the width and height coordinates.  If you want to quit at any time, type 'Q'. (But why would you want to quit when you're having so much fun?)"

canvas_input = gets
canvas_input = canvas_input.chomp

begin
  canvas = Canvas.new(canvas_input)
  grid = canvas.output
  puts "Awesome!  Here's your canvas!" + "\n" + grid
rescue => e
  puts e.message
end

puts "Now please type the coordinates for a line, starting with the letter 'L' and followed by x1 y1 x2 y2."

line_input = gets
line_input = line_input.chomp

begin
  line = Line.new(line_input)
  plot_line = line.plot(canvas)
  plotted_line = canvas.output
  puts "Here's your line!" + "\n" + plotted_line
rescue => e
  puts e.message
end

puts "Great!  Please type the coordinates for a rectangle, starting with the letter 'R' and followed by x1 y1 x2 y2."

rectangle_input = gets
rectangle_input = rectangle_input.chomp

rectangle = Rectangle.new(rectangle_input)
plot_rectangle = rectangle.plot(canvas)
plotted_rectangle = canvas.output
puts "Here's your rectangle!" + "\n" + plotted_rectangle



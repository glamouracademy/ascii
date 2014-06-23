require_relative 'canvas'

puts "Welcome to ASCII fun time draw time. Please tell me your name."
name = gets
name = name.chomp
puts "Hello #{name}. To start a new canvas, please type the letter 'C' followed by the width and height coordinates.  If you want to quit at any time, type 'Q'. (But why would you want to quit when you're having so much fun?)"

canvas_input = gets
canvas_input = canvas_input.chomp
canvas = Canvas.new(canvas_input)

begin
  grid = canvas.plot
rescue => e
  puts e.message
end

puts "Awesome!  Here's your canvas!" + "\n" + grid


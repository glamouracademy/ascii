puts "Welcome to ASCII fun time draw time. Please tell me your name."
name = gets
name = name.chomp
puts "Hello #{name}. Please type 'C' to start a new canvas and start having some fun. Also, if you want to quit at any time, type 'Q'. (But why would you want to quit when you're having so much fun?)"
canvas = gets
canvas = canvas.chomp

if canvas == 'c' || canvas == 'C'
  puts "Awesome! You created a canvas! Now please enter a width or height to start. Type a 'W' or 'H'."
  size = gets
  size = size.chomp
else
  puts "Oh noes!  Didn't recognise the command.  Please type 'C' to create a canvas."
end



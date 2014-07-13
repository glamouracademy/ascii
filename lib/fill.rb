require_relative 'canvas'
require_relative 'line'
require_relative 'plot'
require_relative 'rectangle'

class Fill < Plot
  attr_reader :x, :y, :colour

  def initialize(fill)
    @fill = fill
    parse_command
  end

  def parse_command
    input_array = @fill.split(" ")
    fill_object = input_array[0]
    @x = input_array[1].to_i
    @y = input_array[2].to_i
    @colour = input_array[3] 
  end

  def get_content(fill_coordinate)
    x = fill_coordinate[0]
    y = fill_coordinate[1]
    fill_content = Canvas.current.get_coordinate(x,y)
    if fill_content == " "
      true
    else 
      false
    end
  end

  def get_coordinates
    target_colour = Canvas.current.get_coordinate(x,y)
    @fill_coordinates = []
    flood_fill(x, y, target_colour, colour)
    @fill_coordinates
  end

  def flood_fill(x, y, target_colour, colour)
    return if target_colour == colour
    return if @fill_coordinates.include? [x,y]
    fill_content = Canvas.current.get_coordinate(x,y)
    return unless fill_content == target_colour
      @fill_coordinates << [x,y]
    
    flood_fill(x-1, y, target_colour, colour)
    flood_fill(x+1, y, target_colour, colour)
    flood_fill(x, y-1, target_colour, colour)
    flood_fill(x, y+1, target_colour, colour) 
  end

  def content
    colour
  end
end

#take fill_coordinate and check if empty XXX
#if not empty check for "colour" (and whether it matches what has been requested)
#if colour does not match or if empty,fill with requested colour
#if there was a "colour", then fill all coordinates with the same content with the replaced colour

#add/move 1 coordinate up and repeat until reach border
#once reach border, move back down to "passing" coordinate and move right 1 coordinate and repeat

#once reach the original fill_coordinate add/move 1 coordinate down and repeat until reach border
#once reach border, move back up to "passing" coordinate and move left 1 coordinate and repeat




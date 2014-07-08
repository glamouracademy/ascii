require 'line'

describe Line do 

  describe "commands" do
    before(:each) do
      canvas = Canvas.new("C 6 6")
    end
    
    it "should return a line command that is passed to it" do
      line = Line.new("L 1 2 6 2")
      expect(line.parse_command).to eq("L 1 2 6 2")
    end

    it "returns the real coordinates for a horizontal line of cells" do
      line = Line.new("L 1 1 3 1")
      line_coordinates_array = line.get_coordinates
      expect(line_coordinates_array).to eq([[1,1],[2,1],[3,1]])  
    end

    it "returns the real coordinates for a vertical line of cells" do
      line = Line.new("L 1 1 1 3")
      line_coordinates_array = line.get_coordinates
      expect(line_coordinates_array).to eq([[1,1],[1,2],[1,3]])  
    end
  end

  it "returns an 'x' for one of the line coordinates" do
    canvas = Canvas.new("C 4 4") #--> canvas w/ grid coordinates by column
    line = Line.new("L 1 1 3 1") #--> line w/ separated objects
    line.plot(canvas)
    plotted_coordinate = canvas.get_coordinate(2,1)
    expect(plotted_coordinate).to eq("x")
  end

  it "should plot a horizontal line within a canvas" do
    canvas = Canvas.new("C 20 4")
    line = Line.new("L 1 2 6 2")
    canvas.plot
    line.plot(canvas)
    plotted_line = canvas.output
    expect(plotted_line).to eq(<<gridline
----------------------
|                    |
|xxxxxx              |
|                    |
|                    |
----------------------
gridline
)
  end

  it "should return an error if the line coordinates are outside the canvas" do
    canvas = Canvas.new("C 4 4")
    expect { Line.new("L 1 1 5 1") }.to raise_error("Sorry that line won't fit on the canvas. Please try again.")
  end

# it "should return an error if a line is requested before a canvas" do
  
# end



# describe Draw do
#   it "should draw a line when given beginning and ending coordinates" do
#   end

#   it "should draw a rectangle when given an upper left corner and lower right corner coordinates" do
#   end

#   it "should draw fill a rectangular area when given coordinates" do
#   end

#   it "should give an error if the incorrect command is given for drawing a line" do
  
#   end

#   it "should give an error if the incorrect command is given for drawing a rectangle" do
  
#   end

#   it "should give an error if the incorrect command is given for filling an area" do
  
#   end
end
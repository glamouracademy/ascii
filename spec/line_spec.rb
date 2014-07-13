require 'line'

describe Line do 

  describe "commands with canvas" do
    before(:each) do
      canvas = Canvas.new("C 6 6")
    end
    
    it "should return a line command that is passed to it" do
      line = Line.new("L 1 2 6 2")
      expect(line.x1).to eq(1)
      expect(line.x2).to eq(6)
      expect(line.y1).to eq(2)
      expect(line.y2).to eq(2)
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

  it "should plot a vertical line within a canvas" do
    canvas = Canvas.new("C 20 4")
    line = Line.new("L 6 1 6 4")
    line.plot(canvas)
    plotted_line = canvas.output
    expect(plotted_line).to eq(<<gridline
----------------------
|     x              |
|     x              |
|     x              |
|     x              |
----------------------
gridline
)
  end

  it "should return an error if the line coordinates are outside the canvas" do
    canvas = Canvas.new("C 4 4")
    expect { Line.new("L 1 1 5 1") }.to raise_error("Sorry that line won't fit on the canvas. Please try again.")
  end
end
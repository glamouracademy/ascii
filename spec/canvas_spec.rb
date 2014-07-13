require 'canvas'

describe Canvas do
  it "should return a canvas command that is passed to it" do
    canvas = Canvas.new("C 20 4")
    expect(canvas.x_coordinates).to eq(20)
    expect(canvas.y_coordinates).to eq(4)
  end

  it "should plot a canvas command" do
    canvas = Canvas.new("C 20 4")
    border = canvas.output 
    expect(border).to eq(<<border
----------------------
|                    |
|                    |
|                    |
|                    |
----------------------
border
)
  end

  it "should return arrays when given a command" do
    canvas = Canvas.new("C 1 1")
    grid_array = canvas.setup_grid
    expect(grid_array).to eq [["0,0", "0,1", "0,2"],["1,0", "1,1", "1,2"],["2,0", "2,1", "2,2"]] 
  end

  it "returns the real coordinate for a cell" do
    canvas = Canvas.new("C 3 3")
    coordinate = canvas.get_coordinate(2,2)
    expect(coordinate).to eq(" ")  
  end

  it "should replace the contents of a canvas coordinate with an 'x' for a line coordinate" do
    canvas = Canvas.new("C 4 4")
    canvas_coordinate = canvas.plot_content(2,1,"x")
    expect(canvas.get_coordinate(2,1)).to eq("x")
  end

  it "should return the most current canvas" do
    canvas = Canvas.new("C 4 4")
    canvas = Canvas.new("C 1 1")
    current_canvas = Canvas.current
    expect(current_canvas).to eq(canvas)
  end

  it "should give an error if the incorrect letter is given for creating a canvas" do
    expect { Canvas.new("D 20 4") }.to raise_error("Sorry I don't recognize that command. Please try again.")
  end

  it "should not give an raise_error if the correct letter is given lower case" do
    expect { Canvas.new("c 20 4") }.not_to raise_error
  end

  it "should give an error if a nonpositive integer is given for the width in creating a canvas" do
    expect { Canvas.new("C -20 4") }.to raise_error("Sorry only positive numbers are accepted for the x coordinate. Please try again.")
  end

  it "should give an error if a nonpositive integer is given for the height in creating a canvas" do
    expect { Canvas.new("C 20 0") }.to raise_error("Sorry only positive numbers are accepted for the y coordinate. Please try again.")
  end
end
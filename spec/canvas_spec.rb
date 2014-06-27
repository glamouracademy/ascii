require 'canvas'

describe Canvas do
  it "should return a canvas command that is passed to it" do
    canvas = Canvas.new("C 20 4")
    expect(canvas.command).to eq("C 20 4")
  end

  it "should plot a canvas command" do
    canvas = Canvas.new("C 20 4")
    border = canvas.plot 
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

  it "should have row coordinates" do
    canvas = Canvas.new("C 20 4")
    canvas_rows = canvas.row_coordinates
    expect(canvas_rows).to eq(4)
  end

  it "should have column coordinates" do
    canvas = Canvas.new("C 20 4")
    canvas_columns = canvas.column_coordinates
    expect(canvas_columns).to eq(20)
  end

  it "should return arrays when given a command" do
    canvas = Canvas.new("C 1 1")
    grid_array = canvas.to_a
    expect(grid_array).to eq [["0,0", "0,1", "0,2"],["1,0", "1,1", "1,2"],["2,0", "2,1", "2,2"]] 
  end

  it "returns ' ' for cells that don't have content" do
    canvas = Canvas.new("C 3 3")
    coordinate = canvas.get_coordinate(2,2)
    expect(coordinate).to eq(" ")  
  end

  it "should give an error if the incorrect letter is given for creating a canvas" do
    canvas = Canvas.new("D 20 4")
    expect { canvas.plot }.to raise_error("Sorry I don't recognize that command. Please try again.")
  end

  it "should not give an error if the correct letter is given lower case" do
    canvas = Canvas.new("c 20 4")
    expect { canvas.plot }.not_to raise_error
  end

  it "should give an error if a nonpositive integer is given for the width in creating a canvas" do
    canvas = Canvas.new("C -20 4")
    expect {canvas.plot }.to raise_error("Sorry only positive numbers are accepted. Please try again.")
  end

  it "should give an error if a nonpositive integer is given for the height in creating a canvas" do
    canvas = Canvas.new("C 20 0")
    expect {canvas.plot }.to raise_error("Sorry only positive numbers are accepted. Please try again.")
  end
end
require 'draw'

describe Line do 
  it "should return a line command that is passed to it" do
    line = Line.new("L 1 2 6 2")
    expect(line.command).to eq("L 1 2 6 2")
  end

  it "should plot a horizontal line command" do
    line = Line.new("L 1 2 6 2")
    line = line.plot
    expect(line).to eq(<<line
xxxxx
line
)
  end

  it "should plot a vertical line command" do
    line = Line.new("L 2 1 2 6")
    line = line.plot
    expect(line).to eq(<<line
x
x
x
x
x
line
)
  end

#   it "should plot a horizontal line within a canvas" do
#     canvas = Canvas.new("C 20 4")
#     line = Line.new("L 1 2 6 2")
#     line = line.plot
#     expect(gridline).to eq(<<gridline
# ----------------------
# |                    |
# |xxxxx               |
# |                    |
# |                    |
# ----------------------
# gridline
# )
#   end

  #it "should return an error if the line coordinates are outside the canvas"
  
end



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

# end
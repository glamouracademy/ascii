require 'canvas'

describe Canvas do
  it "should return a canvas command that is passed to it" do
    canvas = Canvas.new("C 20 4")
    expect(canvas.command).to eq("C 20 4")
  end

  it "should get plot a canvas command" do
    canvas = Canvas.new("C 20 4")
    grid = canvas.plot 
    expect(grid).to eq(<<grid
----------------------
|                    |
|                    |
|                    |
|                    |
----------------------
grid
)
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

# describe Quit do
#   it "should return a quit command that is passed to it" do
    
#   end

#   it "should quit the application when the command is given" do
    
#   end

#   it "should give an error if the incorrect command is given for quitting" do
    
#   end
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

# end
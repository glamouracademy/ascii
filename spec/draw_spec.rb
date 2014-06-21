require 'draw'
require 'canvas'
require 'stringio'

describe Canvas do
  it "should return a canvas command that is passed to it" do
    canvas = Canvas.new("C 20 4")
    expect(canvas.command).to eq("C 20 4")
  end

  it "should get a canvas command" do
    subject.stub!(:gets) {"C 20 4"}
    STDOUT.should_receive(:puts).with(canvas_command)
    expect(canvas_command.).to eq("C 20 4")
  end

  it "should get plot a canvas command" do

  end

  it "should give an error if the incorrect command is given for creating a canvas" do
    
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
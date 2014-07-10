require 'rectangle'

describe Rectangle do
  describe "commands" do
    before(:each) do
      @canvas = Canvas.new("C 20 4")
    end

    it "should return a rectangle command that is passed to it" do
      rectangle = Rectangle.new("R 16 1 20 3")
      expect(rectangle.x1).to eq(16)
      expect(rectangle.y1).to eq(1)
      expect(rectangle.x2).to eq(20)
      expect(rectangle.y2).to eq(3)
    end

    it "returns the real coordinates for the top line of a rectangle" do
      rectangle = Rectangle.new("R 16 1 20 3")
      expect(rectangle.get_top_line).to eq("L 16 1 20 1")
    end

    it "returns the real coordinates for the left line of a rectangle" do
      rectangle = Rectangle.new("R 16 1 20 3")
      expect(rectangle.get_left_line).to eq("L 16 1 16 3")
    end

    it "returns the real coordinates for the bottom line of a rectangle" do
      rectangle = Rectangle.new("R 16 1 20 3")
      expect(rectangle.get_bottom_line).to eq("L 16 3 20 3")
    end

    it "returns the real coordinates for the right line of a rectangle" do
      rectangle = Rectangle.new("R 16 1 20 3")
      expect(rectangle.get_right_line).to eq("L 20 1 20 3")
    end

    it "returns the real coordinates for a rectangle's cells" do
        rectangle = Rectangle.new("R 16 1 20 3")
        rectangle_coordinates_array = rectangle.get_coordinates
        expect(rectangle_coordinates_array).to eq([[16,1],[17,1],[18,1],[19,1],[20,1],[16,2],[16,3],[17,3],[18,3],[19,3],[20,3],[20,2]])  
    end

    it "should plot a rectangle within a canvas" do
      rectangle = Rectangle.new("R 16 1 20 3")
      rectangle.plot(@canvas)
      plotted_rectangle = @canvas.output
      expect(plotted_rectangle).to eq(<<gridline
----------------------
|               xxxxx|
|               x   x|
|               xxxxx|
|                    |
----------------------
gridline
)
    end
  end

  it "should return an error if the rectangle coordinates are outside the canvas" do
    canvas = Canvas.new("C 4 4")
    expect { Rectangle.new("R 1 1 5 1") }.to raise_error("Sorry that rectangle won't fit on the canvas. Please try again.")
  end
end
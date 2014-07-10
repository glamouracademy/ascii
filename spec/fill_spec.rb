require 'fill'

describe Fill do
  describe "commands" do
    before(:each) do
      @canvas = Canvas.new("C 3 3")
    end

    it "should return a fill command that is passed to it" do
      fill_point = Fill.new("B 1 3 o")
      expect(fill_point.x).to eq(1)
      expect(fill_point.y).to eq(3)
      expect(fill_point.colour).to eq("o")
    end

    it "should return the adjacent real coordinates of the given fill point" do
      fill_point = Fill.new("B 2 2 o")
      expect(fill_point.get_coordinates).to include([2,2],[2,1],[3,2],[2,3],[1,2])
    end

    it "should plot x's for the adjacent coordinates of the given fill point" do
      fill_point = Fill.new("B 2 2 x")
      fill_point.plot(@canvas)
      plotted_fill_point = @canvas.output
      expect(plotted_fill_point).to eq(<<gridline
-----
| x |
|xxx|
| x |
-----
gridline
)
    end

    it "should plot the colour for the adjacent coordinates of the given fill point" do
      fill_point = Fill.new("B 2 2 o")
      fill_point.plot(@canvas)
      plotted_fill_point = @canvas.output
      expect(plotted_fill_point).to eq(<<gridline
-----
| o |
|ooo|
| o |
-----
gridline
)
    end

    it "should return only valid fill coordinates" do
      fill_point = Fill.new("B 2 1 y")
      expect(fill_point.get_coordinates).not_to include([2,0])
    end

    it "should not replace the canvas border" do
      fill_point = Fill.new("B 2 1 p")
      fill_point.plot(@canvas)
      plotted_fill_point = @canvas.output
      expect(plotted_fill_point).to eq(<<gridline
-----
|ppp|
| p |
|   |
-----
gridline
)
    end
    
  end


  it "should return an error if the fill point is outside the canvas"
  

  # it "should fill an empty canvas" do
  #   canvas = Canvas.new("C 1 1")
  #   fill = Fill.new("B 1 1 o")
  #   canvas
  #   expect    
  # end
end
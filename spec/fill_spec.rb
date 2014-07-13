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
  end

  it "should fill an area" do
    canvas = Canvas.new("C 5 5")
    fill_point = Fill.new("B 3 3 o")
    fill_point.plot(canvas)
    plotted_fill_point = canvas.output
    expect(plotted_fill_point).to eq(<<gridline
-------
|ooooo|
|ooooo|
|ooooo|
|ooooo|
|ooooo|
-------
gridline
)
  end

  it "should return an error if the fill point is outside the canvas"
    canvas = Canvas.new("C 2 2")
    expect { Fill.new("B 3 3 p") }.to raise_error("Sorry that fill point is outside the canvas. Please try again.")
  end

end
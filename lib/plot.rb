class Plot
  def plot(canvas)
    get_coordinates.each do |line_coordinate|
      x = line_coordinate[0]
      y = line_coordinate[1]
      canvas.plot_line(x,y)
    end
  end    
end
require_relative 'draw'

describe Draw do
  it "should get the name of the user" do
    STDIN = 
    Rocky = Name.new
    expect(STDIN).to_eq "Rocky"
  end

  it "should tell the user to type C to create a canvas" do
    expect(STDOUT).to_eq "Hello #{name}. Please type 'C' to start a new canvas and start having some fun. Also, if you want to quit at any time, type 'Q'. (But why would you want to quit when you're having so much fun?)"
  end

  

end

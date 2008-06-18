require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Player do
  before(:each) do
    @player = Player.new
  end

  it "should be valid" do
    @player.should be_valid
  end
end

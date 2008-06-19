require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Friend do
  before(:each) do
    @friend = Friend.new
  end

  it "should be valid" do
    @friends.should be_valid
  end
end

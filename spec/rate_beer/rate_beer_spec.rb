require 'helper'

describe RateBeer do 
  it "should have version" do
    expect(RateBeer::VERSION).to_not eq(nil)
  end
end

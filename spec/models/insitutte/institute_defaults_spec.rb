require 'spec_helper'

describe Institute do
  
  describe "default value for" do
    before(:each) do
      @attrs = {:name => rand_str }
    end
    
    it "status should be set when not specified" do
      inst = Institute.new(@attrs)
      inst.save
      inst.should be_valid
      inst.status.should eql("Active")
    end
    
    pending "code should be set depends on the request"
    
  end #default value for
  
  
end #End of Institute Specs

require 'spec_helper'

describe Institute do
  
  describe "should fail" do
    
    describe "in case of name is" do
      
      it "not specified" do
        inst = Institute.new
        inst.save
        inst.should_not be_valid
      end
      
      it "is blank" do
        inst = Institute.new({:name => ""})
        inst.save
        inst.should_not be_valid
      end

      it "is greater than 255 char size" do
        name_256 = rand_str 256
        inst = Institute.new({:name => name_256})
        inst.save
        inst.should_not be_valid
      end

      it "not unique" do
        name = rand_str
        Institute.create({:name => name})
        inst = Institute.new({:name => name})
        inst.save
        inst.should_not be_valid
      end
      
    end #in case of name 
          
          
    describe "in case of status is" do
      before(:each) do
        @attrs = { :name => rand_str }
      end
      
      it "not valid" do
        inst = Institute.new(@attrs.merge(:status => "Invalid_Status"))
        inst.save
        inst.should_not be_valid
      end
      
      it "more than 20 chars in size" do
        inst = Institute.new(@attrs.merge(:status => rand_str(22)))
        inst.save
        inst.should_not be_valid
      end
      
    end #in case of status
    
    it "when invalid email is specified" do
    end
    
    it "when no name is specified" do
      
    end
    
    it "when existing name is specified" do
      
    end
    
    
  end #should fail
  
end

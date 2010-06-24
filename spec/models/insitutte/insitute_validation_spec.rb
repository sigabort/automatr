require 'spec_helper'

describe Institute do
  
  describe "should fail" do
    
    describe "in case of name is" do
      
      it "not specified" do
        inst = Institute.new
        inst.save
        inst.should_not be_valid
      end
      
      it "is empty" do
        inst = Institute.new({:name => ""})
        inst.save
        inst.should_not be_valid
      end

      it "is blank" do
        inst = Institute.new({:name => "    "})
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

    describe "in case of display_name" do
      
      before(:each) do
        @attrs = {:name => rand_str}
      end
      
      it "is exceeding more than 1024 characters" do
        @str = rand_str(1025)
        inst = Institute.new(@attrs.merge({:display_name => @str}))
        inst.save
        inst.should_not be_valid
      end
      
    end #in case of display_name

    describe "in case of description" do
      
      before(:each) do
        @attrs = {:name => rand_str}
      end
      
      it "is exceeding more than 2048 characters" do
        @str = rand_str(2049)
        inst = Institute.new(@attrs.merge({:description => @str}))
        inst.save
        inst.should_not be_valid
      end
      
    end #in case of description

  end #should fail


  describe "should pass" do
    
    describe "in case of name" do
      before(:each) do
        @name = rand_str
        @attrs = {:name => @name}
      end
      
      it "is specified" do
        inst = Institute.new(@attrs)
        inst.save
        inst.should be_valid
        inst.name.should eql(@name)
      end
      
      it "contains blanks" do
        inst = Institute.new(@attrs.merge({:name => "blank blank"}))
        inst.save
        inst.should be_valid
      end

      it "is not greater than 255 char size" do
        name_255 = rand_str 255
        inst = Institute.new(@attrs.merge({:name => name_255}))
        inst.save
        inst.should be_valid
      end
      
    end #in case of name 
    
    describe "in case of status is" do
      before(:each) do
        @attrs = { :name => rand_str }
      end
      
      it "valid" do
        %w[Active Deleted Suspended Pending].each do |status|
          inst = Institute.new(@attrs.merge(:status => status, :name => rand_str))
          inst.save
          inst.should be_valid
        end
      end
      
    end #in case of status
    
    
    describe "in case of display_name" do
      before(:each) do
        @attrs = {:name => rand_str}
      end
      it "is passed with quotes in contents" do
        str = "i am going to screw' you"
        inst = Institute.new(@attrs.merge({:display_name => str}))
        inst.save
        inst.display_name.should == str
      end
      
      it "is not exceeding more than 1024 characters" do
        @str = rand_str(1024)
        inst = Institute.new(@attrs.merge({:display_name => @str}))
        inst.save
        inst.should be_valid
      end
      
    end #in case of display_name


    describe "in case of description" do
      before(:each) do
        @attrs = {:name => rand_str}
      end
      it "is passed with quotes in contents" do
        str = "i am going to screw' you"
        inst = Institute.new(@attrs.merge({:description => str}))
        inst.save
        inst.description.should == str
      end
      
      it "is not exceeding more than 2048 characters" do
        @str = rand_str(2048)
        inst = Institute.new(@attrs.merge({:description => @str}))
        inst.save
        inst.should be_valid
      end
      
    end #in case of description
    
  end #should pass
  
end

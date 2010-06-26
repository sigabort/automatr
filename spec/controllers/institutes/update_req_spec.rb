require 'spec_helper'

describe InstitutesController do
  render_views
  
  describe "POST 'update'" do
    before(:each) do
      @name = rand_str
      @email = rand_str
      post 'create', :institute => {:name => @name}
    end
    # 
    # it "should be successful" do
    #   put @name, :email => @email
    #   response.should be_success
    #   response.should redirect_to("/" + controller.controller_name + "/" + @name)
    # end
    
  end #end of GET 'update'
  
end #InstitutesController

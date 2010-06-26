require 'spec_helper'

describe InstitutesController do
  render_views
  
  describe "POST 'create'" do
    it "should be successful" do
      name = rand_str
      post 'create', :institute => {:name => name}
      response.should redirect_to("/" + controller.controller_name + "/" + name)
    end
    
  end #end of POST 'create'
  
end #InstitutesController


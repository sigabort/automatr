require 'spec_helper'

describe InstitutesController do
  render_views
  
  describe "DELETE 'delete'" do
    it "should be successful" do
      name = rand_str
      delete 'destroy', :id => name
      response.should be_success
      response.should render_template("destroy")
    end
    
  end #end of DELETE 'delete'
  
end #InstitutesController


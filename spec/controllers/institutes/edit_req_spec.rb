require 'spec_helper'

describe InstitutesController do
  render_views
  
  describe "GET 'edit'" do
    it "should be successful" do
      name = rand_str
      get 'edit', :id => name
      response.should be_success
      response.should render_template("edit")
    end
    
  end #end of GET 'edit'
  
end #InstitutesController


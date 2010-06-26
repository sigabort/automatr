require 'spec_helper'

describe InstitutesController do
  render_views
  
  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
      response.should render_template("new")
    end
    
  end #end of GET 'new'
  
end #InstitutesController

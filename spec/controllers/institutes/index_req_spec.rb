require 'spec_helper'

describe InstitutesController do
  render_views
  
  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
      response.should render_template("index")
    end
    
  end #end of GET 'index'
  
end #InstitutesController

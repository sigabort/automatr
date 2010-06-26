require 'spec_helper'

describe InstitutesController do

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
      response.should render_template("new")
    end
    
  end

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
      response.should render_template("index")
    end
  end

end

class InstitutesController < ApplicationController
  respond_to :html, :json, :xml

  def new
    @title = "Create Institute"
    @institute = Institute.new
    respond_with(@institute)
  end

  def create
    @institute = Institute.new(params[:institute])
    if @institute.save
      redirect_to(@institute)
    else
      @title = "Create Institute"
      render "new"
    end
  end

  #Send the institute information, if found
  def show
    # No lazy loading here. As, we are going to decide whether to send
    # the object or not
    @institute = Institute.with_name(params[:id]).first
    flash.now[:error] = "Invalid Institute name" if @institute.nil?
    respond_with(@institute)
  end

  def index
    @title = "Institutes"
    @institutes = Institute.browse(0, 20)
    respond_with(@institutes)
  end

  def update
    
  end

  def destroy
    
  end
  
end

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

  def show
    @institute = Institute.find(params[:id])
    respond_with(@institute) unless @institue.nil?
  rescue ActiveRecord::RecordNotFound
    flash.now[:error] = "Invalid Institute ID"
  end

  def index
  end

  def update
  end

end

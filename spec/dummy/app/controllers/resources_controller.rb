class ResourcesController < ApplicationController

  def index
    @expired = Resource.expired
    @uptodated = Resource.uptodated
  end

  def read
    @resource = Resource.find params[:id]
    @resource.read_and_update
    redirect_to resources_path
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new params[:resource]
    if @resource.save
      redirect_to resources_path
    else
      render :new
    end
  end

  def edit
    @resource = Resource.find params[:id]
  end

  def update
    @resource = Resource.find params[:id]
    if @resource.update_attributes(params[:resource])
      redirect_to resources_path
    else
      render :edit
    end
  end

end

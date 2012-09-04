class ResourcesController < ApplicationController

  def index
    @expired = Resource.expired
    @uptodated = Resource.uptodated
  end

end

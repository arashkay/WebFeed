class KeywordsController < ApplicationController

  def index
    @positive = Keyword.includables
    @negative = Keyword.excludables
  end

  def new
    @keyword = Keyword.new
  end

  def create
    @keyword = Keyword.new params[:keyword]
    if @keyword.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @keyword = Keyword.find params[:id]
  end

  def update
    @keyword = Keyword.find params[:id]
    if @keyword.update_attributes(params[:keyword])
      redirect_to root_path
    else
      render :edit
    end
  end

end

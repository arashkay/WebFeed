class PostsController < ApplicationController

  def index
    @news = Post.all 
  end

  def show
    @news = Post.find params[:id]
    render :layout => 'webfeed'
  end

  def publish
    @news = Post.find params[:id]
    @news.update_attributes( :is_published => true )
    redirect_to root_path
  end

  def unpublish
    @news = Post.find params[:id]
    @news.update_attributes( :is_published => false )
    redirect_to root_path
  end

end

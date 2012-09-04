class News < ActiveRecord::Base

  attr_accessible :description, :image, :title, :url

  validates_presence_of :title, :url

end

class Post < ActiveRecord::Base

  require 'digest/md5'
  require "open-uri"

  attr_accessible :description, :image, :image_url, :title, :url, :is_published
  has_attached_file :image, :styles => { :thumb => "100x80>", :url => "/system/:class/:id/:style/:filename" }

  validates_presence_of :title, :url
  validates_uniqueness_of :uuid, :on => :create

  default_scope :order => 'created_at DESC'

  scope :published, where("is_published IS TRUE")
  
  def url=(url)
    write_attribute :url, url
    self.uuid = Digest::MD5.hexdigest(url)
  end

  def image_url=(url)
    write_attribute :image_url, url
    self.image = open(url)
  end

end

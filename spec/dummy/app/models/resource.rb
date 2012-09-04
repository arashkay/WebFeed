class Resource < ActiveRecord::Base
  
  attr_accessible :frequency, :name, :url, :checked_at

  validates_presence_of :url, :frequency

  scope :expired, where("TIMESTAMPDIFF(MINUTE, checked_at, '#{DateTime.now.utc}') > frequency")
  scope :uptodated, where("TIMESTAMPDIFF(MINUTE, checked_at, '#{DateTime.now.utc}') <= frequency")

end

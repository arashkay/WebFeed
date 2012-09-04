class Keywords < ActiveRecord::Base
  
  attr_accessible :is_negative, :phrase

  validates_presence_of :phrase

end

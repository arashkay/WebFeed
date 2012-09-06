class Keyword < ActiveRecord::Base
  attr_accessible :is_negative, :phrase

  validates_presence_of :phrase

  scope :excludables, where( 'is_negative IS TRUE' )
  scope :includables, where( 'is_negative IS NOT TRUE' )

  def self.includables_list
    Keyword.includables.collect{ |i| i=i.phrase }
  end

  def self.excludables_list
    Keyword.excludables.collect{ |i| i=i.phrase }
  end

end

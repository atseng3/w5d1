class Note < ActiveRecord::Base
  attr_accessible :body
  
  validates :body, :track_id, :presence => true
  
  belongs_to :track,
  :primary_key => :id, 
  :foreign_key => :track_id,
  :class_name => 'Track'
end

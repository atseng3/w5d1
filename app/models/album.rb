class Album < ActiveRecord::Base
  self.inheritance_column = nil
  attr_accessible :title, :type, :band_id
  validates :title, :type, :band_id, :presence => true
  
  belongs_to :band,
             :primary_key => :id,
             :foreign_key => :band_id,
             :class_name => 'Band'
             
  has_many :tracks, 
           :primary_key => :id,
           :foreign_key => :album_id,
           :class_name => 'Track',
           :dependent => :destroy
end

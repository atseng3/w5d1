class Track < ActiveRecord::Base
  self.inheritance_column = nil  
  attr_accessible :name, :type, :lyrics, :album_id
  validates :name, :type, :lyrics, :album_id, :presence => true
  
  belongs_to :album,
             :primary_key => :id,
             :foreign_key => :album_id,
             :class_name => 'Album'
             
  has_many :notes, 
           :primary_key => :id, 
           :foreign_key => :track_id, 
           :class_name => 'Note',
           :dependent => :destroy
end

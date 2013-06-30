class Attachment < ActiveRecord::Base
  attr_accessible :image
  belongs_to :attachable, polymorphic: true
  has_attached_file :image, :styles => { :large => "600x600>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

end
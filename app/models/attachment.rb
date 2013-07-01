class Attachment < ActiveRecord::Base
  attr_accessible :image, :default, :attachable_type, :attachable_id
  belongs_to :attachable, polymorphic: true
  has_attached_file :image,
                    :styles => { :large => "800x800>", :medium => "300x300>", :thumb => "100x100>" },
                    :storage => :s3,
                    :s3_credentials => { :access_key_id => ENV['access_key_id'], :secret_access_key => ENV['secret_access_key'], :bucket => "acm_pictures"},
                    :path => ":attachment/:id/:style.:extension",
                    :bucket => 'acm_pictures'

end
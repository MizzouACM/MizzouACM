class Project < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :link, :title, :user_id, :photo, :photo_file_name, :photo_content_type, :photo_file_size, :photo_updated_at
  has_attached_file :photo,
					:styles => {
						:thumb  => "400x300",
						:large => "700x500"
					},
					:storage => :s3,
					:s3_credentials => { :access_key_id => ENV['access_key_id'], :secret_access_key => ENV['secret_access_key'], :bucket => "acm_pictures"},
					:path => ":attachment/:id/:style.:extension",
					:bucket => 'acm_pictures'
end
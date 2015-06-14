class Pin < ActiveRecord::Base
	belongs_to :user

	has_attached_file :image, 
	:styles => { :medium => "600x600>", :thumb => "100x100>" },
  :s3_credentials => {
    :bucket => ENV['AWS_BUCKET'],
    :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
  }

  validates_attachment_content_type :image,
  :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end

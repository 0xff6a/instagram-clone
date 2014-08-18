class Post < ActiveRecord::Base

	validates :title, presence: { message: 'Your post must have a title' }

	has_attached_file :picture, 
		styles: { medium: "300x300>"},
		storage: :s3,
		s3_credentials: {
			bucket: 'instagram-clone-june',
			access_key_id: Rails.application.secrets.aws_s3_access_key_id,
			secret_access_key: Rails.application.secrets.aws_s3_secret_access_key
		}

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/

end

class Tag < ActiveRecord::Base

	has_and_belongs_to_many :posts
	belongs_to :user


	# validates :user_id, presence: { message: 'A tag must be created by a user' }
	validates :text, presence: { message: 'A tag must have text' }
	validates :text, format: { with: /#\w+/, message:'A tag must start with a hash symbol' }
	validates :text, length: { maximum: 50, message: 'A tag cannot be longer than 50 characters' }

	def to_param
		text.delete('#')
	end

end

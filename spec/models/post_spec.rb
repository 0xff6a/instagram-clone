require 'rails_helper'

RSpec.describe Post, :type => :model do

	context 'validations' do

		it 'must have a title' do
			invalid_post = Post.create()
			expect(invalid_post).not_to be_valid
		end
	
	end

end

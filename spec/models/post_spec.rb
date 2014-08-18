require 'rails_helper'

RSpec.describe Post, :type => :model do

	context 'validations' do
		
		let(:pic) { _create_example_pic }

		it 'must have a title' do
			invalid_post = Post.new(picture: pic)
			expect(invalid_post).not_to be_valid
			expect(invalid_post.errors.messages[:title]).to include('Your post must have a title')
		end

		it 'must have a picture' do
			invalid_post = Post.new(title: 'New post')
			expect(invalid_post).not_to be_valid
			expect(invalid_post.errors.messages[:picture]).to include('You must attach a photo')
		end

		it 'is valid with a title and picture' do
			valid_post = Post.new(title: 'New post', picture: pic)
			expect(valid_post).to be_valid
			expect(valid_post).to have_attached_file(:picture)
		end
	
	end

end

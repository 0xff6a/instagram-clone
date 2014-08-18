require 'rails_helper'

RSpec.describe Post, :type => :model do

	context 'validations' do
		
		let(:pic) 	{ _create_example_pic }
		let(:user) 	{ _create_test_user_object }

		it 'must have a title' do
			invalid_post = Post.new(picture: pic, user_id: user.id)
			expect(invalid_post).not_to be_valid
			expect(invalid_post.errors.messages[:title]).to include('Your post must have a title')
		end

		it 'must have a picture' do
			invalid_post = Post.new(title: 'New post', user_id: user.id)
			expect(invalid_post).not_to be_valid
			expect(invalid_post.errors.messages[:picture]).to include('You must attach a photo')
		end

		it 'must belong to a user' do
			invalid_post = Post.new(title: 'New post', picture: pic)
			expect(invalid_post).not_to be_valid
			expect(invalid_post.errors.messages[:user_id]).to include('You must be signed in to post')
		end

		it 'is valid with a title, picture and user' do
			valid_post = Post.new(title: 'New post', picture: pic, user_id: user.id)
			expect(valid_post).to be_valid
			expect(valid_post).to have_attached_file(:picture)
		end
	
	end

end

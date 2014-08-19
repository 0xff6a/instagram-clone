require 'rails_helper'

RSpec.describe Post, :type => :model do

	let(:pic) 	{ _create_example_pic }
	let(:user) 	{ _create_test_user_object }

	context 'validations' do
		
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

	context '#tag_list=' do

		let(:post) { Post.create(title: 'New post', picture: pic, user_id: user.id) }

		context 'no tags provided do' do

			it 'gives 0 tags to the post' do
				post.tag_list = ''
				expect(Tag.all).to be_empty
			end
		
		end

		context 'single tag provided' do

			it 'gives 1 tag to the post' do
				post.tag_list = '#baam'
				expect(Tag.count).to eq(1)
				expect(Tag.first.text).to eq('#baam')
			end

		end

		context 'multiple tags provided' do

			it 'gives multiple tags to the post' do
				post.tag_list = '#baam, #h8fruit'
				expect(Tag.count).to eq(2)
			end

		end

		context 'with existing tags' do

			before(:each) { Tag.create(text: '#baam') }

			it 'reuses them' do
				post.tag_list = '#baam, #h8fruit'
				expect(Tag.count).to eq(2)
			end

		end

		context 'with duplicate tags' do

			it 'deduplicates them' do
				post.tag_list = '#baam, #h8fruit, #baam'
				expect(post.tags.count).to eq(2)
			end

		end
	
	end

end

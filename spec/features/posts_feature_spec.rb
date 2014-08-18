require 'rails_helper'

describe 'Posting' do

	context 'when there are no posts' do

		it 'should display a message' do
			visit posts_path
			expect(page).to have_content('No posts yet')
		end

	end

	context 'when there are posts' do

		before(:each) do
			Post.create(title: 'test post')
		end

		it 'should list the posts on the homepage' do
			visit posts_path
			expect(page).to have_content('test post')
		end

	end

	context 'creating posts' do

		it 'should allow a user to create posts from a form' do
			visit posts_path
			click_link 'New Post'
			fill_in 'Title', with: 'test post'
			click_button 'Post'
			expect(page).to have_content('Thank you for posting...')
		end

		it 'allows a user to add an image to a post' do
			visit posts_path
			click_link 'New Post'
			fill_in 'Title', with: 'Another post'
			attach_file 'Picture', Rails.root.join('spec/images/example.jpg')
			click_button 'Post'
			expect(page).to have_css 'img.uploaded-pic'
		end

	end

end
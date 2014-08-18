require 'rails_helper'

describe 'Posting' do

	context 'when there are no posts' do

		it 'should display a message' do
			visit '/posts'
			expect(page).to have_content('No posts yet')
		end

		it 'should allow a user to create posts' do
			visit '/posts'
			click_link 'New Post'
			fill_in 'Title', with: 'test post'
			click_on 'Post'
			expect(page).to have_content('Thank you for posting...')
		end

	end

	context 'when there are posts' do

		before(:each) do
			Post.create(title: 'test post')
		end

		it 'should list the posts on the homepage' do
			visit '/posts'
			expect(page).to have_content('test post')
		end

	end

end
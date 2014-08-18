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
			Post.create(title: 'test post', picture: _create_example_pic)
		end

		it 'should list the posts on the homepage' do
			visit posts_path
			expect(page).to have_content('test post')
		end

	end

	context 'creating posts' do

		it 'should allow a user to create posts from a form' do
			_create_post('test post', 'spec/images/example.jpg')
			expect(page).to have_content('Thank you for posting...')
			expect(page).to have_content('test post')
		end

		it 'should display an error if the title is left out' do
			_create_post('', 'spec/images/example.jpg')
			expect(page).to have_content('Your post must have a title')
		end

		it 'allows a user to add an image to a post' do
			_create_post('Another post', 'spec/images/example.jpg')
			expect(page).to have_css 'img.uploaded-pic'
		end

	end

end
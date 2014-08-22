require 'rails_helper'

describe 'Tagging posts:' do

	before(:each) { _create_and_login_test_user }

	context 'adding tags' do

		it 'lists tags as link under their posts' do
			_create_tagged_post('New Post', '#baam, #h8fruit', 'spec/images/example.jpeg')
			expect(page).to have_link '#baam'
			expect(page).to have_link '#h8fruit'
		end

	end

	context 'filtering by tags' do

		before(:each) do
			_create_tagged_post('New Post', '#baam, #h8fruit', 'spec/images/example.jpeg')
			_create_tagged_post('Unrelated Post', '#boom, #lovefruit', 'spec/images/example.jpeg')
		end

		it 'lists all posts sharing a certain tag' do
			click_link '#baam'
			expect(page).to have_content('Posts tagged with #baam')
			expect(page).to have_content('New Post')
			expect(page).not_to have_content('Unrelated Post')
		end

		it 'let users filter using pretty urls' do
			visit '/tags/baam'
			expect(page).to have_content('Posts tagged with #baam')
			expect(page).to have_content('New Post')
		end

	end

end
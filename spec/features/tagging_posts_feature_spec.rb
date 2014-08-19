require 'rails_helper'

describe 'Tagging posts:' do

	before(:each) { _create_and_login_test_user }

	context 'adding tags' do

		it 'lists tags as link under their posts' do
			visit posts_path
			click_link 'New Post'
			fill_in 'Title', with: 'Post'
			fill_in 'Tags', with: '#baam, #h8fruit'
			attach_file 'Picture', Rails.root.join('spec/images/example.jpg')
			click_button 'Post'
			expect(page).to have_link '#baam'
			expect(page).to have_link '#h8fruit'
		end

	end

	context 'filtering by tags' do

		it 'lists all posts sharing a certain tag' do
			visit posts_path
			click_link 'New Post'
			fill_in 'Title', with: 'New Post'
			fill_in 'Tags', with: '#baam, #h8fruit'
			attach_file 'Picture', Rails.root.join('spec/images/example.jpg')
			click_button 'Post'
			visit posts_path
			click_link 'New Post'
			fill_in 'Title', with: 'Unrelated Post'
			fill_in 'Tags', with: '#boom, #lovefruit'
			attach_file 'Picture', Rails.root.join('spec/images/example.jpg')
			click_button 'Post'
			click_link '#baam'
			expect(page).to have_content('Posts tagged with #baam')
			expect(page).to have_content('New Post')
			expect(page).not_to have_content('Unrelated Post')
		end

	end

end
require 'rails_helper'

describe 'Tagging posts:' do

	before(:each) { _create_and_login_test_user }

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
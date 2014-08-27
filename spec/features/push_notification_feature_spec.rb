require 'rails_helper'

describe 'Notifications' do
	
	context 'when a new photo is uploaded' do

		it 'all users receive a notification' do
			visit posts_path
			_create_test_user_object
			_create_test_post_object
			sleep 5
			expect(page).to have_content("New content has been added")
		end

	end

end
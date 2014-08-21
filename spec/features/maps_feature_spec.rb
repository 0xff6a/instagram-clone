require 'rails_helper'

describe 'Maps' do
	
	before(:each) { _create_and_login_test_user }

	context 'when a post has been given a location' do

		it 'should display the location on a map when the link is clicked' do
			_create_post('Post with location', 'spec/images/example.jpg', 'London, UK')
			click_link 'London, UK'
			expect(page).to have_content('Map of London, UK')
			expect(page).to have_css '#map'
		end

	end


end
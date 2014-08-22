require 'rails_helper'

describe 'Maps' do
	
	before(:each) do
		_create_and_login_test_user 
		_create_post('Sample Post', 'spec/images/example.jpeg', 'London, UK')
	end

	context 'when a post has been given a location', js: true do

		it 'should display the location on a map when the link is clicked' do
			visit posts_path
			click_link 'London, UK'
			expect(page).to have_content('Map of London, UK')
			expect(page).to have_css '.gm-style'
		end

	end

	context 'when viewing the map associated with a particular post', js: true do

		xit 'should have a marker centred on the location' do
		end

		xit 'should display the picture and title if the marker is clicked' do
			visit posts_path
			click_link 'London, UK'
			sleep 2
			save_screenshot('spec/images/test.png')
			page.execute_script("google.maps.event.trigger(window.map.markers[2], 'click');")
			# sleep 2
			expect(page).to have_content('Sample Post')
		end 

	end

	context 'when creating a new post' do

		xit 'should allow the user to set a location by clicking on the map' do

		end

	end

end
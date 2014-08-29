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

		it 'should have a marker centred on the location' do
			visit posts_path
			click_link 'London, UK'
			sleep 2
			expect(page.evaluate_script("map.getCenter().lat();")).to be_within(0.05).of 51.507350899999985
    	expect(page.evaluate_script("map.getCenter().lng();")).to be_within(0.05).of -0.12775829999994492
		end

		it 'should display the picture and title if the marker is clicked' do
			visit posts_path
			click_link 'London, UK'
			sleep 2
			page.execute_script("google.maps.event.trigger(window.map.markers[0], 'click');")
			expect(page).to have_content('Sample Post')
		end 

	end

end
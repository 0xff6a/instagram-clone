require 'rails_helper'

describe 'Notifications' do

	before(:each) { _create_and_login_test_user }
	
	context 'when a new photo is uploaded' do

		it 'all users receive a notification' do
			expect(PostNotifier).to receive(:trigger_with).with('New content has been added')
			_create_post('test post', 'spec/images/example.jpeg')
		end

	end

end
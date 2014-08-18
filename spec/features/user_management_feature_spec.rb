require 'rails_helper'

describe 'User management:' do
	
	context 'when signed out' do

		it 'a user can sign up' do
			visit posts_path
			click_link 'Sign Up'
			fill_in 'user_email', with: 'test@test.com'
			fill_in 'user_password', with: '12345678'
			fill_in 'user_password_confirmation', with: '12345678'
			click_on 'Sign up'
			expect(page).to have_content('Welcome! You have signed up successfully')
			expect(page).to have_content('test@test.com')
		end

		it 'a user can sign in' do
			_create_test_user_object
			visit posts_path
			click_link 'Sign In'
			fill_in 'user_email', with: 'test@test.com'
			fill_in 'user_password', with: '12345678'
			click_on 'Sign in'
			expect(page).to have_content('Signed in successfully')
			expect(page).to have_content('test@test.com')
		end

	end

	context 'when signed in' do

		before(:each) do
			test_user = _create_test_user_object
			login_as test_user
		end

		it 'a user can sign out' do
			visit posts_path
			click_link 'Sign Out'
			expect(page).to have_content('Signed out successfully')
			expect(page).not_to have_content('test@test.com')
		end

	end

	context 'content access rights' do

		it 'a user must be signed in to post' do
			
		end

	end

end
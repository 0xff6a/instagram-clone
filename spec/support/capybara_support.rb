def _create_post(title, filepath, location='')
	visit posts_path
	click_link 'New Post'
	fill_in 'Title', with: title
	fill_in 'Location', with: location
	attach_file 'Picture', Rails.root.join(filepath)
	click_button 'Post'
end

def _create_tagged_post(title, tags, filepath)
	visit posts_path
	click_link 'New Post'
	fill_in 'Title', with: title
	fill_in 'Tags', with: tags
	attach_file 'Picture', Rails.root.join(filepath)
	click_button 'Post'
end

def _sign_up_test_user
	visit posts_path
	click_link 'Sign Up'
	fill_in 'user_email', with: 'test@test.com'
	fill_in 'user_password', with: '12345678'
	fill_in 'user_password_confirmation', with: '12345678'
	click_on 'Sign up'
end

def _sign_in_test_user
	visit posts_path
	click_link 'Sign In'
	fill_in 'user_email', with: 'test@test.com'
	fill_in 'user_password', with: '12345678'
	click_on 'Sign in'
end

def _sign_out
	visit posts_path
	click_link 'Sign Out'
end

def _submit_stripe_transaction(email, card, expiry, cvc)
	click_on 'Pay with Card'
	within_frame('stripe_checkout_app') do
		fill_in 'Email', with: email
		fill_in 'Card number', with: card
		fill_in 'MM / YY', with: expiry
		fill_in 'CVC', with: cvc
		click_on 'Pay'
	end
end


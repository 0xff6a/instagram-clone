require 'rails_helper'

describe 'Marketplace:' do

	let(:email) 	{ 'test@test.com' 			}
	let(:card)  	{ '4242 4242 4242 4242'	}
	let(:cvc)   	{ '123'									}
	let(:expiry) 	{ '05/16'								}

	before(:each) do
		_create_and_login_test_user 
		_create_post('Sample Post', 'spec/images/example.jpeg', 'London, UK')
	end
	
	context 'when signed in' do

		it 'users have an option to purchase photos' do
			visit posts_path
			expect(page).to have_content('Starting at just £5.00')
			expect(page).to have_css('a', text: 'Purchase')
		end

		it 'clicking the purchase link should send the user to a stripe checkout form', js: true do
			visit posts_path
			click_link 'Purchase'
			expect(page).to have_content('Please confirm your purchase')
			expect(page).to have_css('.stripe-button-el')
		end	

		it 'filling in the stripe checkout form should confirm the purchase', js: true do
			visit posts_path
			click_link 'Purchase'
			click_on 'Pay with Card'
			within_frame('stripe_checkout_app') do
				fill_in 'Email', with: email
				fill_in 'Card number', with: card
				fill_in 'MM / YY', with: expiry
				fill_in 'CVC', with: cvc
				click_on 'Pay'
			end
			expect(page).to have_content('Thank you for your payment')
		end

	end

end
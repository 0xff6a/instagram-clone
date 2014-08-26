class Payment

	def self.generate_transaction(amount, description, ccy, transaction_data = {})
		customer = Stripe::Customer.create(
	    :email => transaction_data[:stripeEmail],
	    :card  => transaction_data[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => amount,
	    :description => description,
	    :currency    => ccy
	  )
	end

end
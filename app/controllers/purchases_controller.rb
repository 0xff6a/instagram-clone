class PurchasesController < ApplicationController

	def new
		@post = Post.find(params[:post_id])
	end

	def create

	  @amount = 500
	  @post = Post.find(params[:post_id])

	  customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :card  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Rails Stripe customer',
	    :currency    => 'usd'
	  )

	  flash[:notice] = "Thank you for your payment"
	  redirect_to posts_path

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  new_post_picture_purchase_path(@post)
	end

end

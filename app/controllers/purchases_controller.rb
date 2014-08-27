class PurchasesController < ApplicationController

	def new
		@post = Post.find(params[:post_id])
	end

	def create
	  @amount = 500
	  @post = Post.find(params[:post_id])
	  Payment.generate_transaction(	@amount, 
	  															'Rails Stripe customer', 
	  															'usd', 
	  															params )
	  _process_payment

		rescue Stripe::CardError => e
	  	flash[:error] = e.message
	  	new_post_picture_purchase_path(@post)
	end

	def _process_payment
		flash[:notice] = "Thank you for your payment"
		redirect_to posts_path
	end

end

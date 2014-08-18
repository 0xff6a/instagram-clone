class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def new 
		@post = Post.new
	end

	def create
		@post = Post.new(params[:post].permit(:title))
		@post.save
		redirect_to posts_path
		flash[:notice] = 'Thank you for posting...'
	end

end

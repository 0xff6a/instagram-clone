class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def new 
		@post = Post.new
	end

	def create
		@post = Post.new(params[:post].permit(:title, :picture))
		@post.user_id = current_user.id
		@post.save ? _process_post_save : _post_save_error(@post)
	end

	def _process_post_save
		redirect_to posts_path
		flash[:notice] = 'Thank you for posting...'
	end

	def _post_save_error(bad_post)
		flash[:errors] = bad_post.errors.messages
		redirect_to new_post_path
	end

end

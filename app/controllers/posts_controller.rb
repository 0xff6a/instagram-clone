class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def new 
		@post = Post.new
		render layout: false if request.xhr?
	end

	def create
		@post = _create_post(params[:post])
		@post.save ? _process_post_save : _post_save_error(@post)
	end

	def _process_post_save
		flash[:notice] = 'Thank you for posting...'
		redirect_to posts_path
	end

	def _post_save_error(bad_post)
		flash[:errors] = bad_post.errors.messages
		render 'new'
	end

	private

	def _create_post(data_hash)
		post = Post.new(data_hash.permit(:title, :picture, :location, :tag_list))
		post.user_id = current_user.id
		post
	end

end

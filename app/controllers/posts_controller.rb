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
		@post.save ? _process_post_save(@post) : _post_save_error(@post)
	end

	def _process_post_save(post)
		PostNotifier.trigger_with('New content has been added', post.picture.url(:thumb) )
		flash[:notice] = 'Thank you for posting...'
		redirect_to posts_path
	end

	def _post_save_error(bad_post)
		flash[:errors] = bad_post.errors.messages
		redirect_to posts_path
	end

	def show
		@post = Post.find(params[:id])
	end

	private

	def _create_post(data_hash)
		post = Post.new(data_hash.permit(:title, :picture, :location, :tag_list))
		post.user_id = current_user.id
		post
	end

end

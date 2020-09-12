class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
		@posts = Post.paginate(page: params[:page], per_page: 2).order('created_at DESC')
		respond_to do |format|
			format.html
			format.js
    	end
	end

	def show
	end

	def new
		@post = Post.new
	end

	def edit
	end

	def create
		@post = Post.create(post_params)
		if @post.save
			redirect_to root_path, notice: "Post successfully created!"
		else
			render :new
		end
	end

	def update
		if @post.update(post_params)
			redirect_to root_path, notice: "Post successfully edited!"
		else
			render :edit
		redirect_to root_path
		end
	end

	def destroy
		@post.destroy
		redirect_to posts_path, notice: "Post deleted successfully!"
	end

	private

	def set_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit({images: []}, :caption)
	end

end

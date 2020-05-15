class PostsController < ApplicationController
	
	def index
		@posts = Post.all
		@q = Post.ransack(params[:q])
		@posts = @q.result(distinct: true)	

	end

	def show
		#grabs id from the url
		@post = Post.find(params[:id])
		@user = AdminUser.all
		@post_comment = PostComment.new(:post => @post)
	end

	def new
		@post = Post.new
		@category = Category.all
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			#redirect to main page
			redirect_to posts_path, :notice => "Your post has been saved" 
		else
			#reload the page
			render "new"
		end
	end

	def post_params
    	params.require(:post).permit(:name, :body, :category_id, :admin_user_id)
  	end

	def edit
		#grabs id from the url
		@post = Post.find(params[:id])
	end

	def update
		#grabs id from the url
		@post = Post.find(params[:id])
		if @post.update_attributes(post_params)
			#redirect to main page
			redirect_to post_path, :notice => "Your post has been updated" 
		else
			#reload the page
			render "edit"
		end

	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path, :notice => "Your post has been Deleted" 
	end
end

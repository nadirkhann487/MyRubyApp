class HomeController < ApplicationController
  def index
  	@post = Post.all #grab all posts
  end
end

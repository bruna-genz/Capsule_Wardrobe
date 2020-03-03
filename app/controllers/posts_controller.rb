class PostsController < ApplicationController  
  def index
  end

  def new
    @post = Post.new
    @categories = Category.all.map{ |cat| [cat.name, cat.id] }
  end
end

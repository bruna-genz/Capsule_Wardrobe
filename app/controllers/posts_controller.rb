class PostsController < ApplicationController  
  def index
    @posts = current_user.posts
  end

  def new
    @post = Post.new
    @categories ||= Category.all.map{ |cat| [cat.name, cat.id] }
  end

  def create
    @post = current_user.posts.build(posts_params)
    if @post.valid?
      @post.save
      redirect_to posts_path
    else
      flash[:error] = "Something is wrong. Have you selected a picture and a category?"
      redirect_to new_post_path
    end
  end

  private

  def posts_params
    params.require(:post).permit(:category_id, :picture)
  end
end

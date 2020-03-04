class PostsController < ApplicationController  
  def index
    @posts = params[:category_id] ? current_user.posts.where("category_id = ?", params[:category_id]) : Post.all 
    if @posts.empty?
      flash.now[:notice] = "No items in this category."
    end
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

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def posts_params
    params.require(:post).permit(:category_id, :picture)
  end
end

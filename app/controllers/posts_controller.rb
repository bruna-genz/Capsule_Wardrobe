class PostsController < ApplicationController  
  before_action :get_categories, only: [:new, :edit]
  def index
    @posts = params[:category_id] ? current_user.posts.where("category_id = ?", params[:category_id]) : current_user.posts.all 
    if @posts.empty?
      flash.now[:notice] = "No items in this category."
    end
  end

  def new
    @post = Post.new
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

  def edit
    @post = Post.find(params[:id])
  end 

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(posts_params)
      redirect_to posts_path
    else
      render 'edit'
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

  def get_categories
    @categories = Category.all.map{ |cat| [cat.name, cat.id] }
  end
end

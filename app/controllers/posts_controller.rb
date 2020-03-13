class PostsController < ApplicationController  
  before_action :get_post_by_id, only: [:show, :edit, :update, :destroy]
  before_action :get_categories, only: [:new, :edit]
  before_action  :login_user 

  def show
  end

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
      maximum_alert
      redirect_to posts_path
    else
      flash[:error] = "Something is wrong. Have you selected a picture and a category?"
      redirect_to new_post_path
    end
  end

  def edit
  end 

  def update
    if @post.update_attributes(posts_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def posts_params
    params.require(:post).permit(:category_id, :picture)
  end

  def get_post_by_id
    @post = Post.find(params[:id])
  end

  def get_categories
    @categories = Category.all.map{ |cat| [cat.name, cat.id] }
  end

  def maximum_alert
    [45, 50, 55, 60, 65, 70].each do |limit|
      flash[:pop_up] = "too many clothes!!!" if current_user.posts.count == limit
    end    
  end

  def login_user
    unless user_signed_in?
      redirect_to login_path
      flash[:error] = "You must login first."
    end
  end
end

class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    posts_path
  end

  def get_categories 
    @categories = Category.all
  end
end

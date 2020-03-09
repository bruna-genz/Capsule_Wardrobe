require "navigation_helper.rb"

module ApplicationHelper
  include NavigationHelper

  def get_category_count(category)
    Category.find_by(name: category.name).posts.where("user_id = ?", current_user.id).count
  end

  def render_sidebar
    return true unless !user_signed_in? || current_page?(root_path)
  end
end

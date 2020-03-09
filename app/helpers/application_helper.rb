require "navigation_helper.rb"

module ApplicationHelper
  include NavigationHelper

  def get_category_count(category)
    Category.find_by(name: category.name).posts.where("user_id = ?", current_user.id).count
  end
end

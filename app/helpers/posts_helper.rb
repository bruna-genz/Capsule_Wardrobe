module PostsHelper
  def get_category_name(cat_id = nil)
    cat_id ? Category.find(cat_id).name : "All"
  end

  def get_category_count(category)
    Category.find_by(name: category.name).posts.where("user_id = ?", current_user.id).count
  end
end

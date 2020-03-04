module PostsHelper
   def get_category_name(cat_id)
    Category.find(cat_id).name
   end
end

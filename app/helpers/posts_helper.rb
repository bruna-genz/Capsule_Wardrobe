module PostsHelper
  def get_category_name(cat_id = nil)
    cat_id ? Category.find(cat_id).name : "All clothes"
  end

  def delete_category(category_id = nil)
    if category_id
      link_to "Delete category", category_path(category_id), method: :delete,  
                                                            class:"btn btn-secondary btn-sm",  
                                                            data: { confirm: 'Are you sure?' }
    end
  end
end

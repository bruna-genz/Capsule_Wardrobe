module NavigationHelper
  def collapsible_links_partial_path
    if user_signed_in?
      "layouts/navigation/sign_in_links"
    else
      "layouts/navigation/non_signed_in_links"
    end
  end
end

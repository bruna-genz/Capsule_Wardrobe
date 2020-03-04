module NavigationHelper
  def collapsible_links_partial_path
    if user_signed_in?
      "layouts/navigation/signed_in_links"
    else
      "layouts/navigation/non_signed_in_links"
    end
  end

  def home_link_path
    if user_signed_in?
      "layouts/navigation/signed_in_home_link"
    else
      "layouts/navigation/non_signed_in_home_link"
    end
  end
end

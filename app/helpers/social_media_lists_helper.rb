module SocialMediaListsHelper

  def image_src(post)
    return post.image_link.present? ? post.image_link : "http://placehold.it/300x200?text=not+found"
  end

  def post_content(post)
    post.content.gsub("\\n", "</br>").html_safe
  end

  def social_media_button(post)
    return "<i class='#{post.social_media_account.network.icon}'></i>".html_safe
  end

  def network_checked?(network)
    return (!params[:networks].present? || params[:networks].include?(network.id.to_s)) ? true : false
  end

  def list_checked?(list)
    return (params[:lists].present? && params[:lists].include?(list.id.to_s)) ? true : false
  end

end

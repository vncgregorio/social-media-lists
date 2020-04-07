class SocialMediaListsController < ApplicationController
  def index
    @networks = Network.all
    @lists = List.all
    @unpaginated_posts = Post.filter(params.slice(:networks, :lists, :content, :initial_date, :final_date))
    @posts = @unpaginated_posts.paginate(:page => params[:page], :per_page => params[:per_page].present? ? params[:per_page] : 10)
  end
end

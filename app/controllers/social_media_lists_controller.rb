class SocialMediaListsController < ApplicationController
  def index
    @posts = Post.all
  end
end

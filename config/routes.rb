Rails.application.routes.draw do
  get 'social_media_lists/index'

  root :to => 'social_media_lists#index'  
end

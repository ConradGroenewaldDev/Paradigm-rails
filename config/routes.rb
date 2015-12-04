Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: "registrations"}
  resources :posts do
    member do
      get "like", to: "posts#upvote"
      get "dislike", to: "posts#downvote"
    end
    resources :comments
  end

  root 'posts#index'

#get resources from users controller
  resources :users, only: [:show, :index]
end

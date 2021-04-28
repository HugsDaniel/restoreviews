Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get "/restaurants/top", to: "restaurants#top", as: :top_restaurants
  # get "/restaurants/:id/chef", to: "restaurants#chef", as: :restaurant_chef


  # get "/restaurants/:id/reviews/new", to: "reviews#new", as: :new_review
  # post "/restaurants/:id/reviews", to: "reviews#create"

  namespace :admin do
    resources :restaurants, only: :index
  end

  resources :reviews, only: [:destroy] do
    resources :comments
  end

  resources :restaurants do
    resources :reviews, only: [:new, :create]

    collection do
      get :top
    end

    member do
      get :chef

      # patch :mark_as_done
    end
  end
end


# patch "/tasks/:id/mark_as_done", to: "tasks#mark_as_done"

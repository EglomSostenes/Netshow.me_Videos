Rails.application.routes.draw do
  devise_for :users
  resources :videos do
    collection do
      get :my_videos
    end

    member do
      get :play
    end
  end

  root to: 'videos#my_videos'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

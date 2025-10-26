Rails.application.routes.draw do
  devise_for :users

  resources :movies do
    resources :comments, only: :create
    resources :reviews, only: :create
    collection do
      post :import
    end
  end

  root "movies#index"
end
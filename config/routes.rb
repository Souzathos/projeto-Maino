Rails.application.routes.draw do
  get "categories/index"
  get "categories/new"
  get "categories/create"
  get "categories/edit"
  get "categories/update"
  get "categories/destroy"
  devise_for :users

  resources :movies do
    resources :comments, only: :create
  end

  # Rota da página inicial
  root "movies#index"

  # Letter Opener Web — apenas em ambiente de desenvolvimento
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end

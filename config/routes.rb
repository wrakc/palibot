Rails.application.routes.draw do
  devise_for :users
  resources :articles, except: [:show, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'articles#index'
  resources :articles do
    resources :votes, only: [:create]
  end
  resources :category, only: [:show]
end

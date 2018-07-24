Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#top'
  get '/about', to: 'static_pages#about'

  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get :following, :followers
    end
  end
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy] do
  	resources :book_comments, only: [:create, :destroy]

  end
  resources :likes, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
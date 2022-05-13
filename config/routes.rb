Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "homes/about" => "homes#about", as: "about"
  resources :books, only: [:new, :create, :index, :edit, :update, :show, :destroy]
    resources :users, only: [:show, :index, :edit, :update]

end

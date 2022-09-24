Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "homes/about" => "homes#about", as: "about"
  resources :books, only: [:create, :edit, :index, :show, :destroy, :update]
  resources :users, only: [:index, :show, :edit, :update, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

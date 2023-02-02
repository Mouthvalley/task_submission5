Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root :to =>"homes#top"
  get '/home/about', to: 'homes#about', as: 'about'

  resources :books
  resources :users, only: [:index,:show,:edit,:update] do
  resources :book_comments, only: [:create, :destroy]
  end

end
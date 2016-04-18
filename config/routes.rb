Rails.application.routes.draw do
  devise_for :users
  resources :pages
  resources :customers
  resources :projects

  get 'about', to: 'pages#about'
  get 'home', to: 'pages#home'


  root to: "pages#home"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end

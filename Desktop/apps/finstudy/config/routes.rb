Rails.application.routes.draw do
  get 'exps/index'
  get 'exps/new'
  devise_for :users
  resources :users
  resources :studys

  resources :steps

  resources :pages

  resources :relationships, only: [:create, :destroy]

  root 'pages#index'
end

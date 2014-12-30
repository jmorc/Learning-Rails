Rails.application.routes.draw do


  get 'comments/create'

  get 'comments/new'

  get 'comments/destroy'

  resource :session, only: [:new, :create, :destroy]
  resources :users
  resources :subs
  resources :posts, except: :index
  resources :comments, only: [:new, :create]
end

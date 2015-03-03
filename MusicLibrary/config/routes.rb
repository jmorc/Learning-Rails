Rails.application.routes.draw do
  
  resources :notes

  resources :tracks, except: [:new, :index]

  resources :albums, except: [:new, :index] do
    resources :tracks, only: :new
  end

  resources :bands do 
    resources :albums, only: :new
  end

  root "bands#index"
  resources :users, only: [:create, :new, :show]
  resource :session, only: [:create, :new, :destroy] 
end

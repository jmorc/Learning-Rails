Rails.application.routes.draw do
  resources :users, only: [:index, :show, :update, :destroy, :create] do
    resources :contacts, only: [:index]
    resources :comments
  end
  resources :contacts, only: [:show, :update, :destroy, :create] do
    resources :comments
    patch 'favorite', on: :member
  end
  
  resources :contact_shares, only: [:destroy, :create] do
    resources :comments
    patch 'favorite', on: :member
  end
  
  # get 'users' => 'users#index', :as => 'users_index'
  # get 'users/new' => 'users#new', :as => 'new_users'
  # get 'users/:id/edit' => 'users#edit', :as => 'edit_users'
  # get 'users/:id' => 'users#show', :as => 'users'
  # post 'users' => 'users#create'
  # patch 'users/:id' => 'users#update'
  # put 'users/:id' => 'users#update'
  # delete 'users/:id' => 'users#destroy'
end

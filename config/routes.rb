Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get 'users/profile', to: 'users/registrations#profile_edit', as: 'profile_edit'
    patch 'users/profile', to: 'users/registrations#profile_update', as: 'profile_update'  
  end
  root to: "home#index"
  get 'users/account'
  get 'rooms/posts'
  resources :rooms do
    collection do
      get 'search'
    end
  end
  post 'reservations/new'
  post 'reservations/create'
  get 'reservations/show'
end

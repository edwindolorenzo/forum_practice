Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # devise_for :users, path: '', path_names: { sign_in: 'login' , sign_out: 'logout' , sign_up: 'register' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "dashboard/forums#index"

  # resources :admins

  namespace :dashboard do
    resources :forums do
      resources :chats
    end
  end

  namespace :admins do
    root to: "dashboard/forums#index"
    resources :users
  end



  resources :users
end

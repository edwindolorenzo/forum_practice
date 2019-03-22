Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login' , sign_out: 'logout' , sign_up: 'register' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "forums#index", as: "home"
  # get 'forums/:id' => "forums#show", as: "show" 

  resources :forums do
    resources :chats
  end
end

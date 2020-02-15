Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
    passwords: "users/passwords"
  }

  resources :users
  root to: "users#root"
  get 'home/about' , to: "homes#about"

  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

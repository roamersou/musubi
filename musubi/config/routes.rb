Rails.application.routes.draw do
  get 'home/index'

  # root 'application#hello'
  root "home#index"
  resources :users
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end

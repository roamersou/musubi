Rails.application.routes.draw do
  root "home#index"
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"
  # root 'application#hello'
  resources :users
  resources :payforwards
  resources :events
  resources :thanksletters, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end

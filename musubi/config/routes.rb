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

  namespace :private do
    resources :conversations
    resources :messages, only: [:create, :destroy]
  end

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

end

Rails.application.routes.draw do

  root "home#index"
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"
  # root 'application#hello'
  resources :users
  resources :payforwards do
    resources :gy_comments
  end
  resources :give_mes do
    resources :comments
  end
  resources :pub_thanksletters
  resources :events
  resources :thanksletters do
    resources :tl_comments
  end
  namespace :private do
    resources :conversations
    resources :messages, only: [:create, :destroy]
  end

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

end

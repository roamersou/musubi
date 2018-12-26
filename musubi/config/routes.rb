Rails.application.routes.draw do

  get 'pub_thanksletters' => "pub_thanksletters#index"

  root "home#index"
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"
  # root 'application#hello'
  resources :users
  resources :payforwards
  resources :give_mes do
    resources :comments
  end
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

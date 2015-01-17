Flashcards::Application.routes.draw do

  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback"
  get "oauth/:provider" => "oauths#oauth", as: :auth_at_provider
  get 'login' => 'user_sessions#new', as: :login
  get 'logout' => 'user_sessions#destroy', as: :logout
  root 'home#index'
  resources :cards
  resources :users
  resources :user_sessions
  post 'check_translation', to: "home#check_translation"
end

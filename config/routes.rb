Flashcards::Application.routes.draw do

  get 'login' => 'user_sessions#new', as: :login
  get 'logout' => 'user_sessions#destroy', as: :logout
  root 'home#index'
  resources :cards
  resources :users
  resources :user_sessions
  post 'check_translation', to: "home#check_translation"
end

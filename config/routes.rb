Flashcards::Application.routes.draw do
  get "user_sessions/new"
  get "user_sessions/create"
  get "user_sessions/destroy"
  root 'home#index'
  resources :cards
  resources :users
  post 'check_translation', to: "home#check_translation"
end

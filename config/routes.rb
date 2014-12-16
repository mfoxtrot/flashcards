Flashcards::Application.routes.draw do
  root 'home#index'
  resources :cards
  get '/check_translation', to: "home#check_translation"
end

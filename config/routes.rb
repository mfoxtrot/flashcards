Flashcards::Application.routes.draw do
  root 'home#index'
  resources :cards
  post 'check_translation', to: "home#check_translation"
end

Flashcards::Application.routes.draw do
  root 'home#index'
  resources :cards
end

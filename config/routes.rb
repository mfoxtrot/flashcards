Flashcards::Application.routes.draw do
  root 'home#index'
  resources :cards
  get '/test', to: "home#test", as: :test_page
end

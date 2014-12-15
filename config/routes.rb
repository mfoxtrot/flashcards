Flashcards::Application.routes.draw do
  root 'home#index'
  resources :cards
  get '/checktranslation', to: "home#checktranslation", as: :checktranslation_page
end

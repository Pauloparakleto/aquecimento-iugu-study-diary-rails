Rails.application.routes.draw do
  devise_for :users
  root to: 'home#welcome'
  get '/lists/', to: "lists#index"
  get "/lists/:id", to: "lists#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

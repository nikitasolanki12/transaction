Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post '/auth/login', to: 'authentication#login'
  get '/api/check_balance', to: 'wallets#show'
  get '/api/transaction', to: 'transactions#create'

  resources :users, only: [:new, :create]

  # namespace :api do
  #   resources :transactions
  #   get 'balances/:user_type/:user_id', to: 'balances#show'
  # end
end

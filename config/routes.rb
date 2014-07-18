Rails.application.routes.draw do
  root to: 'urls#index'
  # get 'urls/new', to: 'urls#new'
  # post 'urls/create', to: 'urls#create'
  resources :urls
  get 'go/:random_string', to: 'urls#go'
end

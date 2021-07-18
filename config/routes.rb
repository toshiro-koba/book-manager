Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end
  root to: 'books#index'
  resources :books
end

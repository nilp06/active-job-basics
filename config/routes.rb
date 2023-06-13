require 'sidekiq/web'
require 'sidekiq/cron/web'
Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
  resources :events, only: [:index] do
    get 'enroll', to: 'events#enroll', as: 'enroll', on: :member
  end

  mount Sidekiq::Web => '/sidekiq'
end

# frozen_string_literal: true

Rails.application.routes.draw do
  resources :roles, only: [:index, :show, :create, :update, :destroy]
  resources :officials, only: [:index, :show, :create, :update, :destroy]
  resources :admins, only: [:index, :show, :create, :update, :destroy]
  resources :workers, only: [:index, :show, :create, :update, :destroy]
  resources :clerks, only: [:index, :show, :create, :update, :destroy]
  resources :companies, only: [:index, :show, :create, :update, :destroy]

  post '/login', to: 'officials#login'
  get '/auto_login', to: 'officials#auto_login'

end

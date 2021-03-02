Rails.application.routes.draw do
    resources :roles, only: [:index, :show, :create, :update, :destroy]
end

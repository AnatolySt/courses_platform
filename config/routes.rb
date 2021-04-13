Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'courses#index'

  resources :courses, only: [:index, :show]
  resources :students, only: [:create]
  resource :session, only: [:new, :create, :destroy]
end

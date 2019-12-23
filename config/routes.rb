# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.htm
  root to: 'products#index'
  resources :products
  resources :users
  resources :sessions

  scope :admin do
    resources :categories, controller: 'backoffice/categories'
    resources :products, controller: 'backoffice/products'
  end

  get 'registration', to: 'users#new', as: 'registration'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end

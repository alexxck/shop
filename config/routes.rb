# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.htm
  root to: 'products#index'
  resources :products

  scope :admin do
    resources :categories, controller: 'backoffice/categories'
    resources :products, controller: 'backoffice/products'
  end
end

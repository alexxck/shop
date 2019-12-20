Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.htm
  root to: 'products#index'
  resources :products
#  scope :admin as: :admin do
#  resources :categories, controller:
#      resources :products, controller:
end
#end

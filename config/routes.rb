Rails.application.routes.draw do





  get 'profiles/show'

	root 'items#index'

  resources :charges, only: [:new, :create]
  resources :items
  resources :carts
  get 'orders/index' => 'orders#index'
  get 'orders/new' => 'orders#create'
  post 'items/show/:id', to: 'carts#add_item', as: :add_item
	post 'root/:id', to: 'carts#add_item', as: :add_item_from_index
  delete 'carts/show/:id', to: 'carts#remove_item', as: :remove_item
  get 'items/index'
  get 'items/show'


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  resources :categories do
    resources :products
  end
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users do
    resources :carts do
      resources :cart_items do
        get "/update_quantity", to: "items#update_quantity"
      end
    end
    resources :orders
  end
  post '/auth/login', to: 'authentication#login'
end
 
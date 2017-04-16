Rails.application.routes.draw do
  resources :regions
  get "/route", to: "payments#route"
  delete "/route", to: "payments#destroy"
  get "/buys", to: "payments#buys"	
  get "payments/express"
  get "transactions/checkout"
  resources :payments
  resources :deals
  resources :categories
  devise_for :users
  resources :destinations
 get 'welcome/index'
 root 'destinations#index'

 get "/dashboard", to: "welcome#dashboard"

 put "/destinations/:id/publish", to: "destinations#publish"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

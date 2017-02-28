Rails.application.routes.draw do
  resources :categories
  devise_for :users
  resources :destinations
 get 'welcome/index'
 root 'welcome#index'

 get "/dashboard", to: "welcome#dashboard"

 put "/destinations/:id/publish", to: "destinations#publish"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  resources :post_comments
  get 'pages/about'
  get 'pages/contact'
  get 'pages/resources'
  get 'posts/index'
  get 'posts/show'
  get 'categories/index'
  get 'categories/show'
  get 'home/index'

	resources :posts
  	resources :categories
  	match '/about', :to => 'pages#about', :via => [:get, :post]
  	match '/contact', :to => 'pages#contact', :via => [:get, :post]
  	match '/resources', :to => 'pages#resources', :via => [:get, :post]
 
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  root :to => 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

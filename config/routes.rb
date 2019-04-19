Rails.application.routes.draw do

  devise_for :users
  get 'welcome/index'

  resources :reviews
  resources :categories
  resources :articles 
  root 'welcome#index'
  #get 'categories/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

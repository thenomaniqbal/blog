Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  get 'home/index'

  get 'welcome/index'
  resources :books
  resources :articles do
  resources :comments
end
  root 'home#index'
  end

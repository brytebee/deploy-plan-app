# frozen_string_literal: true

Rails.application.routes.draw do
  resources :categories
  resources :transactions
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root to: 'categories#index', as: :authenticated_root
      get '/users/sign_out' => 'devise/sessions#destroy'
    end
    unauthenticated :user do
      root to: 'splash_screen#home', as: :unauthenticated_root
    end
  end
  root 'splash_screen#home'
end

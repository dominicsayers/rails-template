# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :accounts

  resources :users do
    get 'public', on: :member
  end
end

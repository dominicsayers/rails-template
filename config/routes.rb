# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: 'pages#home'

  authenticate :user do
    resources :accounts
  end

  resources :users do
    get 'public', on: :member
  end
end

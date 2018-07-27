# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  authenticate :user do
    resources :accounts
  end

  resources :users do
    get 'public', on: :member
  end
end

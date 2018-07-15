# frozen_string_literal: true

Rails.application.routes.draw do
  constraints SubdomainConstraints::NotAccount do
    root to: 'pages#home'

    devise_for :users

    resources :users, only: :show do
      get 'public', on: :member
    end

    authenticate :user do
      resources :accounts
    end
  end

  constraints SubdomainConstraints::Account do
    root to: 'accounts#home'
  end
end

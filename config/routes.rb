# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  constraints SubdomainConstraints::NotAccount do
    root to: 'pages#home', as: :no_account_root

    devise_for :users

    resources :users, only: :show do
      get 'public', on: :member
    end

    authenticate :user do
      resources :accounts
    end
  end

  constraints SubdomainConstraints::Account do
    root to: 'accounts#home', as: :account_root
  end
end

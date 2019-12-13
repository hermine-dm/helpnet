# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[show edit update destroy]
  resource :admin, only: [:show]
  resource :allevents, only: [:show]
  resources :organizations, param: :slug do
    patch :validate # only for the admin of the website
    resources :follows, only: %i[create destroy]
    resources :events, param: :slug do
      resources :participations, only: %i[create destroy]
    end
  end
  resources :articles, param: :slug do
    resources :article_likes, only: %i[create destroy]
    resources :article_comments
  end
  root to: 'home#index'
  get '/static/:page' => 'static#show'
  mount Thredded::Engine => '/forum'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

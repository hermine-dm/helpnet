Rails.application.routes.draw do
  get 'static/show'
  devise_for :users
  resources :users, only: [:show, :edit, :update, :destroy]
  get "admin/show"
  get "/static/:page" => "static#show"
  resources :organizations do
    patch :validate #uniquement pour les admin
    resources :follows, only: [:create, :destroy]
    resources :events do
      resources :participations, only: [:create, :destroy]
    end
  end
  resources :articles do
    resources :article_likes, only: [:create, :destroy]
    resources :article_comments
  end
  root to: 'home#index'
  mount Thredded::Engine => '/forum'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

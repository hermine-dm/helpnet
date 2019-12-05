Rails.application.routes.draw do
  get 'static/show'
  devise_for :users
  resources :users, only: [:show, :edit, :update, :destroy]
  get "admin/show"
  get "/static/:page" => "static#show"
  resources :organizations do
    resources :follow, only: [:create, :destroy]
  end
  root to: 'home#index'
  mount Thredded::Engine => '/forum'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

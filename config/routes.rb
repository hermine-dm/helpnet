Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update, :destroy] do
  	resources :avatars, only: [:create]
  end
  get "admin/show"
  resources :associations
  root to: 'home#index'
  mount Thredded::Engine => '/forum'
  get "layout"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

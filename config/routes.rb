Rails.application.routes.draw do
  get 'admin/show'
  devise_for :users
  resources :users, only: [:show, :edit, :update, :destroy] do
  	resources :avatars, only: [:create]
  end
  resources :associations do
  	resources :logos, only: [:create]
  end
  root to: 'home#index'
  mount Thredded::Engine => '/forum'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

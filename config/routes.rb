Rails.application.routes.draw do
  resources :subjects, only: [:index, :show] do
    resources :comments, module: :subjects
  end
  resources :profiles do
    resources :subjects, module: :profiles
    resources :locations, module: :profiles
    resources :comments, module: :profiles
  end
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  root "home#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

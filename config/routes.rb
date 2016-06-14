Rails.application.routes.draw do
  resources :locations, only: [:show, :destroy, :edit, :update]
  resources :comments, only: [:show, :edit, :update, :destroy]

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

end

Rails.application.routes.draw do
  get '/all_subjects', to: 'subjects#all_subjects'
  resources :profiles do
    resources :subjects, module: :profiles
    resources :locations, module: :profiles
  end
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  root "home#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

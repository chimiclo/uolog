Rails.application.routes.draw do
  devise_for :users
  get "home/index"
  root 'home#index'

  resource :profile, only: %i[show edit update]
  resources :catches do
    collection do
      get :map
    end
  end
end

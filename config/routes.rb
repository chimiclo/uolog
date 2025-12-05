Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get "/users/sign_out", to: "devise/sessions#destroy"
  end
  root "catches#index"

  resource :profile, only: %i[show edit update]
  resources :catches do
    collection { get :map }
  end
end

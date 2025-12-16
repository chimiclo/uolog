Rails.application.routes.draw do
  devise_for :users, skip: [:passwords, :confirmations]
  devise_scope :user do
    get "/users/sign_out", to: "devise/sessions#destroy"
  end

  root "catches#index"

  resource :profile, only: %i[show edit update]

  resources :users, only: [] do
    resource :profile, only: :show
  end

  resources :catches do
    collection { get :map }
  end
end

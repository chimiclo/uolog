Rails.application.routes.draw do
  root 'home#index'

  resource :profile, only: %i[show edit update]
  resource :catches do
    collection do
      get :map
    end
  end
end

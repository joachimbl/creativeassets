Rails.application.routes.draw do
  scope module: :frontend do
    root 'frontpage#show'
    devise_for :users, controllers: {
      omniauth_callbacks: 'frontend/users/omniauth_callbacks'
    }

    resources :links, only: [:show, :new, :create]
  end

  scope module: :api, namespace: :api, path: :api do
    resources :links, only: [:index, :create]
  end
end

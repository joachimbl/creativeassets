Rails.application.routes.draw do
  scope module: :frontend do
    root 'frontpage#show'
    devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

    resources :links, only: [:show]
  end

  scope module: :api, namespace: :api, path: :api do
    resources :links, only: [:index]
  end

end

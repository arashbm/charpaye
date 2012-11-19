Charpaye::Application.routes.draw do
  resources :posts do
    resources :revisions, only: [ :index, :show ]
    resources :reviews, except: [ :new, :edit ]
  end

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :users, only: [ :index, :show, :edit, :update ]

  root to: "posts#index"
end

Charpaye::Application.routes.draw do
  resources :posts do
    resources :revisions, only: [ :index, :show ]
  end
  root to: "posts#index"

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
end

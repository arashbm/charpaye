Charpaye::Application.routes.draw do
  get "auditions/index"

  get "auditions/show"

  resources :posts do
    resources :auditions, only: [ :index, :show ]
  end
  root to: "posts#index"

  devise_for :users
end

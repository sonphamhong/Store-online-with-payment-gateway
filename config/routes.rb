Rails.application.routes.draw do
  resources :categories
  get 'orders/create'

  devise_for :users

  resources :products
  
  resource :cart do
    post "add", path: "add/:id"
    get "checkout"
  end

  resources :orders, only: [ :index, :show, :create, :update ] do
    member do
      get :new_payment
      post :pay
    end
  end
  root 'products#index'

end

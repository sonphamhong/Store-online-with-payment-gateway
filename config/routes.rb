Rails.application.routes.draw do
  resources :products
  resource :cart do
    post "add", path: "add/:id"
  end
  root 'products#index'

end

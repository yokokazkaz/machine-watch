Rails.application.routes.draw do
  devise_for :users
  root to: "machines#index"
  resources :machines
  get 'mashines/:id', to: 'mashines#checked'
end

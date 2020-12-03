Rails.application.routes.draw do
  devise_for :users
  root to: "machines#index"
  get 'machines/:id', to: 'machines#checked'
  resources :machines
end

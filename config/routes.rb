Rails.application.routes.draw do
  devise_for :users
  root to: "machines#index"
  get 'machine/:id', to: 'machines#checked'
  resources :machines
end

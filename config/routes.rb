Rails.application.routes.draw do
  root "info#index"

  resources :users
end

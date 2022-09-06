Rails.application.routes.draw do
  root "info#index"

  resources :users, except: :index
  resources :events, only: %i[new create destroy]
  resource :session, only: %i[new create destroy]

  get 'users/:id/events', to: 'users#events'


end

Rails.application.routes.draw do
  root "info#index"

  resources :events, only: %i[new create show destroy]
  resources :relations, only: %i[new create]
  resources :users, except: :index
  resources :messages, only: :create
  resource :session, only: %i[new create destroy]

  get 'users/:id/events', to: 'users#events'
  get 'events/:id/start', to: 'events#start'
  get 'events/:id/chat_for_santa', to: 'events#chat_for_santa'
  get 'events/:id/chat_with_santa', to: 'events#chat_with_santa'
end

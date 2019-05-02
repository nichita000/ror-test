Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  post 'connect_session', to: 'customer#connect_session'
  post 'reconnect_session/:connection_id', to: 'customer#reconnect_session'
  post 'refresh_session/:connection_id', to: 'customer#refresh_session'
  post 'destroy_session/:connection_secret', to: 'customer#destroy_session'

  get 'accounts/:connection_id', to: 'customer#accounts', as: 'accounts'
  get 'transactions/:connection_id/:account_id', to: 'customer#transactions', as: 'transactions'

  root 'customer#index'
end

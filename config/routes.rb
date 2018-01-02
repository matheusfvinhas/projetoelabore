# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  post 'create_user' => 'users#create', as: :create_user   

  get 'register' => 'users#new', as: :register_user
  get 'usuarios' => 'users#index', as: :show_all_users
  delete 'delete_user/:id' => 'users#destroy', as: :delete_user
  post 'enviar_pedido_parceria' => 'partners#send_partner_apply', as: :send_partner_apply
  get 'confirmar_parceria/:id' => 'partners#confirm_partner_apply', as: :confirm_partner_apply
  resources :partners, only: %i[new index show]
  root to: 'index#index'
  resources :events
  resources :notices
end

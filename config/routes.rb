# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  root to: 'index#index'
  
  post 'enviar_pedido_parceria' => 'partners#send_partner_apply', as: :send_partner_apply
  get 'confirmar_parceria/:id' => 'partners#confirm_partner_apply', as: :confirm_partner_apply  

  resources :partners, only: %i[new index show]
  resources :events
  resources :notices
  resources :courses, shallow: true do
    resources :grades, shallow: true do
      resources :comments
    end
  end
  resources :users, only: %i[new show index destroy]
  post 'create_user' => 'users#create', as: :create_user  
end

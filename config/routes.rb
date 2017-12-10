Rails.application.routes.draw do
  devise_for :users , :controllers => { registrations: 'registrations' }
  post 'create_user' => 'users#create', as: :create_user   
  get 'register' => 'users#new', as: :register_user
  get 'usuarios' => 'users#show', as: :show_all_users   
  delete 'delete_user/:id' => 'users#destroy', as: :delete_user     
  post 'enviar_pedido_parceria' => 'parceiros#send_partner_apply', as: :send_partner_apply
  post 'confirmar_parceria/:id' => 'parceiros#confirm_partner_apply', as: :confirm_partner_apply
  resources :parceiros, only: [:new, :index]
  root to: 'index#index'
  resources :eventos
  resources :editais
end

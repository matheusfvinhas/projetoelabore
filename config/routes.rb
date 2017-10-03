Rails.application.routes.draw do
  devise_for :users , :controllers => { registrations: 'registrations' }
  post 'create_user' => 'users#create', as: :create_user   
  get 'register' => 'users#new', as: :register_user
  get 'usuarios' => 'users#show', as: :show_all_users   
  delete 'delete_user/:id' => 'users#destroy', as: :delete_user   
  get 'seja_nosso_parceiro' => 'parceiros#new', as: :new_parceiro 
  post 'enviar_pedido_parceria' => 'parceiros#enviar_pedido_parceria', as: :enviar_pedido_parceria
  root to: 'index#index'
  resources :eventos
  resources :editais
end

Rails.application.routes.draw do
  devise_for :users , :controllers => { registrations: 'registrations' }
  post 'create_user' => 'users#create', as: :create_user   
  get 'register' => 'users#new', as: :register_user   
  root to: 'index#index'
end

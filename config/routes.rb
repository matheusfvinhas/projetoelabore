# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  root to: 'index#index'

  post 'send_partner_apply' => 'partners#send_partner_apply', as: :send_partner_apply
  get 'confirm_partner_apply/:id' => 'partners#confirm_partner_apply', as: :confirm_partner_apply

  resources :partners, only: %i[new index show]
  resources :events
  resources :notices
  resources :courses, shallow: true do
    resources :grades
  end
  resources :enrollments, only: %i[index create destroy show]
  resources :institutions

  get 'enrollment/:id/grades/:grade_id' => 'enrollments#show', as: :enrollment_show

  get 'ask_question/:enrollment_id/grade/:grade_id' => 'questions#ask_question', as: :ask_question
  post 'send_question' => 'questions#send_question', as: :send_question

  delete 'destroy_image/:id' => 'events#destroy_image', as: :destroy_image

  resources :users, only: %i[new show index destroy]
  post 'create_user' => 'users#create', as: :create_user
end

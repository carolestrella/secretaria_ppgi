# frozen_string_literal: true

Rails.application.routes.draw do
  resources :bookings
  resources :request_deadlines, only: [:new, :index, :create]
  resources :tickets
  resources :budgets, only: [:new, :index, :create]
  resources :requirements, only: [:new, :index, :create]
  get 'admin/panel'
  get 'admin/index'
  resources :requests
  resources :request_types
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end

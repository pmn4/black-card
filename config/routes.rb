RESOURCE_ROUTES = %i(index create show update destroy).freeze

Rails.application.routes.draw do
  resources :actions, only: :create

  resources :users, only: :show do
    resources :alias, only: :create

    resources :rewards, only: %i(index show), controller: 'user_rewards'
  end

  # admin

  resources :applications, only: RESOURCE_ROUTES
  resources :rewards, only: RESOURCE_ROUTES
  resources :rules, only: RESOURCE_ROUTES
end

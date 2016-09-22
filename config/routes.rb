RESOURCE_ROUTES = %i(index create show update destroy).freeze

Rails.application.routes.draw do
  resources :users, only: :show do
    resources :actions, only: :create, controller: 'user_actions'

    resources :aliases, only: :create, controller: 'user_aliases'

    resources :rewards, only: %i(index show), controller: 'user_rewards'
  end

  # admin

  resources :applications, only: RESOURCE_ROUTES

  resources :rewards, only: RESOURCE_ROUTES do
    resources :rules, only: RESOURCE_ROUTES, controller: 'reward_rules'
  end
end

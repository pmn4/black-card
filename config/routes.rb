RESOURCE_ROUTES = %i(index create show update destroy).freeze

Rails.application.routes.draw do
  resources :actions, only: :create

  resources :user, only: :none do
    resources :rewards, only: %i(index show)
  end

  # namespace :admin do
  #   resources :rules, only: RESOURCE_ROUTES
  # end
end

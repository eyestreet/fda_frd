#
Rails.application.routes.draw do
  root 'recall_events#index'

  resources :locations
  resources :recall_events
end

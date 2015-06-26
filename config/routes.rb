#
Rails.application.routes.draw do
  root 'recall_events#index'

  resources :recall_events
end

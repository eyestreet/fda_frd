#
Rails.application.routes.draw do
  root 'recall_events#index'

  resources :locations
  resources :recall_events

  get '/:year/:month/:day' => 'recall_events#index',
      constraints: { year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/ },
      as: :recall_event_report_date
end

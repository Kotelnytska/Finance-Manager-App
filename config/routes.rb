Rails.application.routes.draw do
  get 'reports/index'
  get 'reports/report'
  get 'reports/report_by_category'
  get 'reports/report_by_dates'
  get 'main/index'
  # get 'operations', to: 'operations#show_operations', prm: 'the_prm'
  # get 'reports/the_action/:some_param', to: 'reports#report_by_category', prm: 'the_prm'
  resources :operations
  # resources :categories
  resources :categories do
    resources :operations
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "main#index"
end

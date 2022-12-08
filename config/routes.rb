Rails.application.routes.draw do
  resources :task_lists do
    resources :task_items
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "task_lists#index"
end

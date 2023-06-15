Rails.application.routes.draw do
  resources :todo_lists do
    resources :list_items #, shallow: true
  end

  root to: "todo_lists#index"
end

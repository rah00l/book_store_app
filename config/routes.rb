Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :books, only: [:index, :show] do
    get 'search_by_publisher', on: :collection
    post 'buy', on: :member
  end
end

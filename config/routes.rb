Rails.application.routes.draw do
  resources :vehicles, only: [:index, :create, :update] do
    collection do
      get 'search(/:license_plate)', action: 'search'
    end
  end
  post 'auth/login', to: 'authentication#authenticate'
end

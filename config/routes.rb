Rails.application.routes.draw do
  resources :vehicles do
    collection do
      get 'search(/:license_plate)', action: 'search'
    end
  end
  post 'auth/login', to: 'authentication#authenticate'
end

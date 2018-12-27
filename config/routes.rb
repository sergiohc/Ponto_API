Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :teams
      resources :offices
      resources :employees
      resources :clock_in_out
    end
  end
end
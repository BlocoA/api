Rails.application.routes.draw do
  root to: proc { [200, {}, ['ok']] }

  namespace :v1 do
    resources :condominiums, only: %i[show create update destroy]
    resources :users, only: %i[create]
    post 'users/access_token', to: 'users#access_token'
  end
end

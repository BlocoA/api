Rails.application.routes.draw do
  root to: proc { [200, {}, ['ok']] }

  namespace :v1 do
    resources :condominiums, only: %i[show create update destroy]
    resources :users, only: %i[create]
  end
end

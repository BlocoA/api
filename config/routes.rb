Rails.application.routes.draw do
  root to: proc { [200, {}, ['ok']] }

  namespace :v1 do
    resources :condominiums, only: %i[index show create update destroy]
    resources :documents, only: %i[index show create destroy]
    resources :expenses, only: %i[index show create update destroy]
    resources :residents, only: %i[index show create update destroy]
    get 'units/with_resident_info', to: 'units#units_with_residents'
    resources :units, only: %i[index show create update destroy]
    resources :users, only: %i[create]
    post 'users/access_token', to: 'users#access_token'
  end
end

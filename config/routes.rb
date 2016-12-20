Rails.application.routes.draw do
  resources :notes do
    member do
      post 'done'
    end
  end
  mount_devise_token_auth_for 'User', at: 'auth'
end

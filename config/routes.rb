Rails.application.routes.draw do
  root to: 'articles#index'

  resources :articles

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
end

Rails.application.routes.draw do
  root to: 'articles#index'

  resources :articles, only: %i[index show]

  namespace :admin do
    get '/', to: 'dashboard#index'
    resources :articles
    resources :users
  end

  devise_for :users, path: '',
                     skip: %i[passwords registrations],
                     path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
end

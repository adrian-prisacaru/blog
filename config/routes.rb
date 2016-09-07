Rails.application.routes.draw do
  devise_for :users
  
  resources :articles, only: [:index, :show]
  
  namespace :admin do
    resources :articles
  end
  
  get '/admin', to: redirect('/admin/articles')
  
  root to: 'articles#index'
end

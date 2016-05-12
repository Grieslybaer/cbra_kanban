Rails.application.routes.draw do

  get 'welcome/index'
  root to: 'welcome#index'
  # Mount AccountAuth::Engine to given path
  mount AccountAuth::Engine, at: '/account', as: 'account_auth'
end

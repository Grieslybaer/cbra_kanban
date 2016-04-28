Rails.application.routes.draw do          
  get 'welcome/index'

  mount AccountAuth::Engine => "/account_auth"

  root to: 'welcome#index'
end

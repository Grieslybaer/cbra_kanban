Rails.application.routes.draw do

  mount AccountAuth::Engine => "/account_auth"
end

Rails.application.routes.draw do

  mount AccountAuthentication::Engine => "/account_authentication"
end

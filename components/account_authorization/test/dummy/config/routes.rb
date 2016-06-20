Rails.application.routes.draw do

  mount AccountAuthorization::Engine => "/account_authorization"
end

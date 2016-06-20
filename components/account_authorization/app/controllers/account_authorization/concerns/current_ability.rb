require "active_support/concern"

module AccountAuthorization
	module Concerns
  	module CurrentAbility
  		extend ActiveSupport::Concern

			included do
				def current_ability
					@current_ability ||= AccountAuthorization::Ability.new(current_user)
				end

				# permission denied, redirect to root path
		    rescue_from CanCan::AccessDenied do |exception|
		      redirect_to root_url, alert: exception.message
		    end
			end
  	end
  end
end
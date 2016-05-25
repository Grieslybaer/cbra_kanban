require "active_support/concern"

module KanbanAuthorization
	module Concerns
  	module CurrentAbility
  		extend ActiveSupport::Concern

			included do
				def current_ability
					@current_ability ||= KanbanAuthorization::Ability.new(current_user)
				end

				# permission denied, redirect to root path
		    rescue_from CanCan::AccessDenied do |exception|
		      redirect_to root_url, alert: exception.message
		    end
			end
  	end
  end
end
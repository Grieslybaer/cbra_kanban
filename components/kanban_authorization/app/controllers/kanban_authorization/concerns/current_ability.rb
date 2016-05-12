require "active_support/concern"

module KanbanAuthorization
	module Concerns
  	module CurrentAbility
  		extend ActiveSupport::Concern

			included do
				def current_ability
					@current_ability ||= KanbanAuthorization::Ability.new(current_user)
				end
			end
  	end
  end
end
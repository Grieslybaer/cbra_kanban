require "cancancan"

module KanbanUserProfile
	class AbilityDecorator
		include CanCan::Ability

		def initialize(user)
			can :manage, KanbanUser::User, id: user.id
		end
	end
end

# add to abilities attribute
KanbanAuthorization::Ability.register_ability(KanbanUserProfile::AbilityDecorator)
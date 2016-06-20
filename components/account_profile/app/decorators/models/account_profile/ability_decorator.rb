require "cancancan"

module AccountProfile
	class AbilityDecorator
		include CanCan::Ability

		def initialize(user)
			can :manage, Account::User, id: user.id
      can :read, Account::User
		end
	end
end

# add to abilities attribute
AccountAuthorization::Ability.register_ability(AccountProfile::AbilityDecorator)
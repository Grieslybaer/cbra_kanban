require "cancancan"

module KanbanBoardUi
  class AbilityDecorator
    include CanCan::Ability

    def initialize(user)
      can :manage, KanbanBoard::Project, members: { user_role: 'admin', user_id: user.id }
      can :read, KanbanBoard::Project, users: { id: user.id }
      can :manage, KanbanBoard::Member, user_role: 'admin', user_id: user.id
      can :manage, KanbanBoard::Assignment, project: { members: { user_role: 'admin', user_id: user.id } }
      can :update, KanbanBoard::Assignment, user_id: user.id

      can :manage, KanbanCard::Task, project: { members: { user_role: 'admin', user_id: user.id } }
    end
  end
end

# add to abilities attribute
KanbanAuthorization::Ability.register_ability(KanbanBoardUi::AbilityDecorator)
require "cancancan"

module KanbanBoardUi
  class AbilityDecorator
    include CanCan::Ability

    def initialize(user)
      can :manage, KanbanBoard::Project, owners: { id: user.id }
      can :read, KanbanBoard::Project, users: { id: user.id }
      can :manage, KanbanBoard::Member, project: { owners: { id: user.id } }
      # can :manage, KanbanBoard::Member do |member|
      #   member.project.owners.map(&:id).include? user.id
      # end
      can :read, KanbanBoard::Member
      can :manage, KanbanBoard::Assignment, project: { owners: { id: user.id } }
      can :update, KanbanBoard::Assignment, user_id: user.id

      can :manage, KanbanCard::Task, project: { owners: { id: user.id } }
    end
  end
end

# add to abilities attribute
KanbanAuthorization::Ability.register_ability(KanbanBoardUi::AbilityDecorator)
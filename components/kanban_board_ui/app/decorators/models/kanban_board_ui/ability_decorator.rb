require "cancancan"

module KanbanBoardUi
  class AbilityDecorator
    include CanCan::Ability

    def initialize(user)
      # abilities for project
      can :manage, KanbanBoard::Project, owners: { id: user.id }
      can :read, KanbanBoard::Project, users: { id: user.id }
      
      # abilities for members
      # can :manage, KanbanBoard::Member do |member|
      #   member.project.owners.map(&:id).include? user.id
      # end
      can :manage, KanbanBoard::Member, project: { owners: { id: user.id } }
      can :read, KanbanBoard::Member, project: { users: { id: user.id } }

      # abilities for assignments (project task user)
      can :manage, KanbanBoard::Assignment, project: { owners: { id: user.id } }
      can :update, KanbanBoard::Assignment, user_id: user.id

      # abilities for tasks
      can :manage, KanbanBoard.card_class, project: { owners: { id: user.id } }
      can :read, KanbanBoard.card_class, project: { users: { id: user.id } }
    end
  end
end

# add to abilities attribute
KanbanAuthorization::Ability.register_ability(KanbanBoardUi::AbilityDecorator)
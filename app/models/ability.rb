class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    case user.role
    when 'admin'
      can :manage, :all
    when 'moderator'
      can :read, :all
      can :manage, ErrorReport
      can :manage, Option
      can :manage, Question
    when 'user'
      can :read, :all
      can :create, ErrorReport
      cannot :manage, User
    end
  end
end 
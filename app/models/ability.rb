class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new # guest user (not logged in)
      if user.teacher?
        can :manage, :all
      else
        can :manage, Submission, :user_id => user.id
        can :read, Exercise
        can :read, Category
      end
  end
end

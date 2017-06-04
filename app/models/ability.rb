class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.admin?
      can :read, :all
      cannot [:create, :update], Feedback
      can :create, [CommentProduct, Likeship, Relationship, Category]
      can :update, [CommentProduct, Feedback, User, Category]
      can :destroy, :all
    end
    unless user.admin?
      can :manage, [CommentProduct, Product]
      can :create, Feedback
      cannot :manage, User
      cannot :manage, Category
      can [:read, :create, :destroy], Relationship
      can [:create, :destroy], Likeship
    end
  end
end

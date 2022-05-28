class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can :read, Category, author_id: user.id
      can :update, Category, author_id: user.id
      can :destroy, Category, author_id: user.id
      can :read, Transaction, author_id: user.id
      can :update, Transaction, author_id: user.id
      can :destroy, Transaction, author_id: user.id
      can :create, Category
      can :create, Transaction
    end
  end
end

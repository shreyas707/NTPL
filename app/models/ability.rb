class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role.name == "admin"
        can :manage, :all
    elsif user.role.name == "employee"
        can :read, [Sauda, Customer, Category, Product]
    end
  end
end

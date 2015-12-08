class Ability
  include CanCan::Ability

  def initialize(user)

    can :manage, :all if user.user_role == nil #We did this just because someone needs to be signed up as an admin for full premission of the system
    can :manage, :all if user.user_role == "Director"
    can :manage, :all if user.user_role == "Secretary"
    cannot :manage, User if user.user_role == "Secretary"
    can :read, Product if user.user_role == "Technician"
    can :read, Appointment if user.user_role == "Technician"
      else
        can :read, Product
  end
end

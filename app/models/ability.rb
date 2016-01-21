class Ability
  include CanCan::Ability
  def initialize(user)
    if user && user.has_role?(:admin)
      can :access, :rails_admin       # only allow admin users to access Rails Admin
      can :dashboard                  # allow access to dashboard
      if user.has_role? :admin
        can :manage, :all
      end
    end
  end
end

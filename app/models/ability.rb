class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    else
      cannot :manage, :all
    end
  end
end

# class ApplicationController < ActionController::Base
#   # overriding CanCan::ControllerAdditions
#   def current_ability
#     if current_account.kind_of?(Admin)
#       @current_ability ||= AdminAbility.new(current_account)
#     else
#       @current_ability ||= UserAbility.new(current_account)
#     end
#   end
# end

# class UserAbility
#   include CanCan::Ability

#   def initialize(user)
#     can :read, :all
#   end
# end

# class AdminAbility
#   include CanCan::Ability

#   def initialize(admin)
#     can :manage, :all
#   end
# end

class AdminAbility
  include CanCan::Ability

  def initialize(admin)
  	if admin.role == "admin"
    	can :manage, :all
    else
    	can :read, :all
    	# cannot :manage, Score
    	# can :manage, User
    	cannot :manage, Country
    	cannot :manage, Landing
    	cannot :manage, Schedule
    	cannot :manage, ToIndonesia
    	can :read, :filters
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
#   end
# end

# class AdminAbility
#   include CanCan::Ability

#   def initialize(admin)
#     can :manage, :all
#   end
# end

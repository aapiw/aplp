class AdminAbility
  include CanCan::Ability

  def initialize(opts={})
    admin      = opts[:admin]
    user_id    = opts[:user]
  	admin ||= Admin.new

    if admin#.class == Admin
        #Admin
      if admin.role == "admin"
        can :manage, :all
      else 
        #consulate
      	can :read, :all
        can :edit, :score
        can :update, :score
        
        cannot :manage, :country
        cannot :manage, :landing
        cannot :manage, :schedule
        cannot :manage, :to_indonesia
        cannot :manage, :bipa_course

        cannot :show, :dashboard unless admin.users.pluck(:id).include? user_id.to_i
        can :update_user, :dashboard if admin.users.pluck(:id).include? user_id.to_i
        can :destroy, :dashboard if admin.users.pluck(:id).include? user_id.to_i
        
    	end
    else
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

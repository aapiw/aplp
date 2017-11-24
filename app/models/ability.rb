class Ability
  include CanCan::Ability

  # def current_auth_resource
  #   if admin_signed_in?
  #     current_admin
  #   else
  #     current_user
  #   end
  # end

  # def current_ability
  #     @current_ability or @current_ability = Ability.new(current_auth_resource)
  # end
  
  # def initialize(user)
  #   debugger
  #   # can :read, :all . # permissions for every user, even if not logged in    
  #   # if user.present?  # additional permissions for logged in users (they can manage their posts)
  #   #   can :manage, Post, user_id: user.id 
  #   #   if user.admin?  # additional permissions for administrators
  #   #     can :manage, :all
  #   #   end
  #   # end
  # end

  # def initialize(model)
  #    case model
  #    when User
  #        can [:read, :edit] , :all
  #    when Admin
  #        can :manage, :all
  #    else
  #        can :read, :all
  #    end
  # end

  # def initialize(model)
  #   # Define abilities for the passed in user here. For example:

  #   # debugger
  #   # case model
    

  #   # when Admin
  #   #   can :manage, :all
  #   # when User
  #   #   # can :create, Comment
  #   #   can :read, :all
  #   # else
  #   #   can :read, :all
  #   # end
  #   #   user ||= User.new # guest user (not logged in)
  #   #   if user.admin?
  #   #     can :manage, :all
  #   #   else
  #   #     can :read, :all
  #   #   end
  #   cannot :manage, :all
  #   #
  #   # The first argument to `can` is the action you are giving the user
  #   # permission to do.
  #   # If you pass :manage it will apply to every action. Other common actions
  #   # here are :read, :create, :update and :destroy.
  #   #
  #   # The second argument is the resource the user can perform the action on.
  #   # If you pass :all it will apply to every resource. Otherwise pass a Ruby
  #   # class of the resource.
  #   #
  #   # The third argument is an optional hash of conditions to further filter the
  #   # objects.
  #   # For example, here the user can only update published articles.
  #   #
  #   #   can :update, Article, :published => true
  #   #
  #   # See the wiki for details:
  #   # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  # end
end

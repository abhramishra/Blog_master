# frozen_string_literal: true

class Ability
  include CanCan::Ability

  #create, Read, Update, Destroy
=begin
    
    :create = new, create
    :read = index, show
    :update = edit,update
    :destroy = destroy
    :manage = new, create, index, show, esit, update, destroy
       
  
=end

  def initialize(user)
    if user.nil?
        can :read, [Category, Article]
    elsif user.role? "admin"
    # user.roles.pluck(:name).include? "admin"
        can :manage, [Category,Article,Review]

    elsif user.role? "moderator"
        can :read, [Category,Article,Review]
        can :create, Review
        can :update, [Category, Article]
        can :destroy, Review
    
    elsif user.role? "customer"
    # user.roles.pluck(:name).include? "customer"

        can :read, [Category,Article]
        can [:read, :create], Review 
        can [:update, :destroy], Review do |review|
            review.user_id == user.id
        end

    end

  end
end

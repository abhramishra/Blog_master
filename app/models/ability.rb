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
        can :read, [Category, Product]
    elsif user.role? "admin"
    # user.roles.pluck(:name).include? "admin"
        can :manage, [Category,Article]
    
    elsif user.role? "customer"
    # user.roles.pluck(:name).include? "customer"

        can :read, [Category,Article]

    end

  end
end

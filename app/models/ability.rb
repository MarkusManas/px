# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    '''
    if user.role == "super_admin"
      can :access, :rails_admin
      can :create, User
      cannot :read, User
    elsif user.role == "admin"
      can :create, User
      cannot :read, User
    else
      can :read, User
    end
    '''
  end
end

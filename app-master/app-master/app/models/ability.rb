# frozen_string_literal: true
class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    if user.role == "admin"
      can :edit, Client
	  can :read, Client
    elsif user.role == "support"
      can :create, Message
	  can :read, Client
    end
  end
end

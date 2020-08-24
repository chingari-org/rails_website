# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    alias_action :create, :read, :update, :destroy, to: :crud

    if user.role == 10?
      can :manage, :all
    end

    can(:crud, Resource) do |resource|
      resource.user.role == 8 && resource.user == user 
    end

  end
end

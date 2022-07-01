class PlayerPolicy < ApplicationPolicy
    attr_reader :current_user, :player
  
    def initialize(current_user, player)
      raise Pundit::NotAuthorizedError, "must be logged in" unless current_user
      @current_user = current_user
      @player = player
    end
  
    def create?
      current_user.coordinator?
    end
  
    def update?
      current_user.coordinator?
    end
  
    def destroy?
      current_user.coordinator?
    end
  end
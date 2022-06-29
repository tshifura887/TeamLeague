class PlayerPolicy < ApplicationPolicy
    attr_reader :current_user, :player
  
    def initialize(current_user, team)
      raise Pundit::NotAuthorizedError, "must be logged in" unless current_user
      @current_user = current_user
      @player = player
    end
  
    def create?
      current_user.manager?
    end
  
    def update?
      current_user.manager?
    end
  
    def destroy?
      current_user.manager?
    end
  end
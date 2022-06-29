class GamePolicy < ApplicationPolicy
    attr_reader :current_user, :game
  
    def initialize(current_user, game)
      raise Pundit::NotAuthorizedError, "must be logged in" unless current_user
      @current_user = current_user
      @game = game
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
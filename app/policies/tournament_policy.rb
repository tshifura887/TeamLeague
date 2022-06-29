class TournamentPolicy < ApplicationPolicy
    attr_reader :current_user, :tournament
  
    def initialize(current_user, tournament)
      raise Pundit::NotAuthorizedError, "must be logged in" unless current_user
      @current_user = current_user
      @tournament = tournament
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
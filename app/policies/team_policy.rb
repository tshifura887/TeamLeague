class TeamPolicy < ApplicationPolicy
  attr_reader :current_user, :team

  def initialize(current_user, team)
    raise Pundit::NotAuthorizedError, "must be logged in" unless current_user
    @current_user = current_user
    @team = team
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

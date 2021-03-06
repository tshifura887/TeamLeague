class Game < ApplicationRecord
  belongs_to :team_1,class_name: 'Team', foreign_key: 'team_1_id'
  belongs_to :team_2,class_name: 'Team', foreign_key: 'team_2_id'
  belongs_to :tournament, optional: true

  before_create :assign_points
  before_update :assign_points

  validates :team_1, presence: true
  validates :team_2, presence: true
  
  private
  def assign_points
    self.team_1_points = 0
    self.team_2_points = 0
    return if team_1_score.blank? && team_2_score.blank?

    if team_1_score > team_2_score
      self.team_1_points = 3
      self.team_2_points = 0
    elsif team_1_score == team_2_score
      self.team_1_points = 1
      self.team_2_points = 1
    else
      self.team_2_points = 3
      self.team_1_points = 0
    end 
  end
end

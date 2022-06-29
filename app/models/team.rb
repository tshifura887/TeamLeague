class Team < ApplicationRecord
    has_many :players,  dependent: :destroy
    has_many :team_1_games, class_name: 'Game', foreign_key: :team_1_id
    has_many :team_2_games, class_name: 'Game', foreign_key: :team_2_id

    belongs_to :tournament
    
    def total_points 
        team_1_games.pluck(:team_1_points).compact.sum + team_2_games.pluck(:team_2_points).compact.sum
    end
end

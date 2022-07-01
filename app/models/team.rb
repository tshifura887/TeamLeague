class Team < ApplicationRecord
    has_many :players,  dependent: :destroy
    has_many :team_1_games, class_name: 'Game', foreign_key: :team_1_id
    has_many :team_2_games, class_name: 'Game', foreign_key: :team_2_id
    has_many :games
    validates :team_name, presence: true
end

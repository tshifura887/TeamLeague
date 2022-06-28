class Team < ApplicationRecord
    has_many :players,  dependent: :destroy
    has_many :games

    belongs_to :coordinator, foreign_key: :coordinator_id, class_name: 'User'
end

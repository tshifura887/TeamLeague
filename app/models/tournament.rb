class Tournament < ApplicationRecord
    has_many :games, dependent: :destroy

    validates :number_of_teams, presence:true, numericality: {greater_than_or_equal_to: 0, allow_nil:false, even:true}
    validates :title, presence:true
end

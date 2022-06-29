class Tournament < ApplicationRecord
    has_many :teams, dependent: :destroy
end

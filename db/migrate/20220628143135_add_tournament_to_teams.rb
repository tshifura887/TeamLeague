class AddTournamentToTeams < ActiveRecord::Migration[6.1]
  def change
    add_reference :teams, :tournament, null: true, foreign_key: true
  end
end

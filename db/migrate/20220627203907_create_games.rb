class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.integer :team_1_score
      t.integer :team_2_score
      t.integer :team_1_points
      t.integer :team_2_points
      t.references :team_1, foreign_key: {to_table: :teams}
      t.references :team_2, foreign_key: {to_table: :teams}

      t.timestamps
    end
  end
end

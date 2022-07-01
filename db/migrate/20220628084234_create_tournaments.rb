class CreateTournaments < ActiveRecord::Migration[6.1]
  def change
    create_table :tournaments do |t|
      t.string :title
      t.integer :number_of_teams

      t.timestamps
    end
  end
end

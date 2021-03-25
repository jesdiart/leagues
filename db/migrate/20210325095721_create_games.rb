class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.references :league, null: false, foreign_key: true
      t.datetime :date_and_time
      t.integer :local_team_id
      t.integer :local_score
      t.integer :away_team_id
      t.integer :away_score

      t.timestamps
    end
  end
end

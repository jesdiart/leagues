class CreateTeamPlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :team_players do |t|
      t.references :team
      t.references :player
      t.timestamps
    end
  end
end

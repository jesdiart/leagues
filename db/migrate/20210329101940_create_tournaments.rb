class CreateTournaments < ActiveRecord::Migration[6.1]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.references :league, null: false, foreign_key: true

      t.timestamps
    end
  end
end

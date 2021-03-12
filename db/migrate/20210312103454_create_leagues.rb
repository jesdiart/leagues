class CreateLeagues < ActiveRecord::Migration[6.1]
  def change
    create_table :leagues do |t|
      t.string :name
      t.string :sport
      t.references :manager, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end

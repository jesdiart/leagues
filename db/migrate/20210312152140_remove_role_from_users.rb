class RemoveRoleFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :role, :text
  end
end

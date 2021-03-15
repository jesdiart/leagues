class RenameTeamUserIdToTeamCoordinatorId < ActiveRecord::Migration[6.1]
  change_table :teams do |t|
    t.rename :user_id, :coordinator_id
  end
end

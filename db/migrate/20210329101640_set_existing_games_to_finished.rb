class SetExistingGamesToFinished < ActiveRecord::Migration[6.1]
  def change
    Game.update_all status: 1
  end
end

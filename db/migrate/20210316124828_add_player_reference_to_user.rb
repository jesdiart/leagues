class AddPlayerReferenceToUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :player
  end
end

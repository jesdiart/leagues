class MoveUsersDataToPlayers < ActiveRecord::Migration[6.1]
  def change
    ActiveRecord::Base.transaction do
      User.find_each do |user|
        player = Player.create!(first_name: user.first_name, last_name: user.last_name, email: user.email)
        user.update!(player_id: player.id)
      end
    end
  end
end

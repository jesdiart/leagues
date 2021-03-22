class Team < ApplicationRecord
  belongs_to :user, :foreign_key => 'coordinator_id'
  belongs_to :league
  has_many :team_players
  has_many :players, through: :team_players

  validates :name, presence: true
  validates :coordinator_id, presence: true
end

class Team < ApplicationRecord
  belongs_to :user, :foreign_key => 'coordinator_id'
  belongs_to :league

  validates :name, presence: true
  validates :coordinator_id, presence: true
end

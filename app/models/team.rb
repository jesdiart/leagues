class Team < ApplicationRecord
  belongs_to :user
  belongs_to :league

  validates :name, presence: true
  validates :user_id, presence: true
end

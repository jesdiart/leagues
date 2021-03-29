class League < ApplicationRecord
  belongs_to :user, :foreign_key => 'manager_id'
  has_many :teams, dependent: :destroy
  has_many :games, dependent: :destroy
  has_many :tournaments, dependent: :destroy

  validates :name, presence: true
  validates :sport, presence: true
  validates :manager_id, presence: true
end

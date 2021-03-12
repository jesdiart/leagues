class League < ApplicationRecord
  belongs_to :user, :foreign_key => 'manager_id'
  has_many :team, dependent: :destroy

  validates :name, presence: true
  validates :sport, presence: true
  validates :manager_id, presence: true
end

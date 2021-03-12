class League < ApplicationRecord
  belongs_to :user, :foreign_key => 'manager_id'

  validates :name, presence: true
  validates :sport, presence: true
  validates :manager_id, presence: true
end

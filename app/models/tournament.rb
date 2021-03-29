class Tournament < ApplicationRecord
  belongs_to :league
  has_many :games

  validates :name, presence: true
end

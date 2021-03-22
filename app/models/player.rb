class Player < ApplicationRecord
  has_many :team_players
  has_many :teams, through: :team_players
  
  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    first_name + " " + last_name
  end 

end

class Game < ApplicationRecord
  belongs_to :league
  belongs_to :local_team, class_name: "Team"
  belongs_to :away_team, class_name: "Team"

  validates :league, presence: true
  validates :date_and_time, presence: true
  validates :local_team, presence: true
  validates :local_score, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :away_team, presence: true
  validates :away_score, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validate :teams_are_different

  def teams_are_different
    if (local_team_id == away_team_id) 
      errors.add("Teams must be different")
    end
  end

  def result
    local_score <=> away_score
  end

  def winner
    case result
    when 1
      local_team
    when -1
      away_team
    end
  end 

  def looser
    case result
    when 1
      away_team
    when -1
      local_team
    end
  end

end

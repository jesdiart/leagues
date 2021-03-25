class Game < ApplicationRecord
  belongs_to :league
  belongs_to :local_team, class_name: "Team"
  belongs_to :away_team, class_name: "Team"

  validates :league, presence: true
  validates :date_and_time, presence: true
  validates :local_team, presence: true
  validates :local_score, presence: true
  validates :away_team, presence: true
  validates :away_score, presence: true

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

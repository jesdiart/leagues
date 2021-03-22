class TeamPlayer < ApplicationRecord
  # use a normal table instead of a join table https://andycroll.com/ruby/be-suspicious-of-join-tables/
  belongs_to :team
  belongs_to :player
end

class User < ApplicationRecord
    belongs_to :player
    has_many :leagues, :foreign_key => 'manager_id'
    has_many :teams, :foreign_key => 'coordinator_id'

    validates :username, presence: true
    validates :password, presence: true
    validates :password, confirmation: { case_sensitive: true }
end

class User < ApplicationRecord
    belongs_to :player
    has_many :leagues, :foreign_key => 'manager_id'
    has_many :teams, :foreign_key => 'coordinator_id'

    validates :username, presence: true
    validates :password, presence: true
    validates :password, confirmation: { case_sensitive: true }

    def first_name
        player.first_name
      end
  
    def last_name
      player.last_name
    end
    
    def email
        player.email
    end    
      
end

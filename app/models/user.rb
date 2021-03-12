class User < ApplicationRecord

    validates :username, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :password, presence: true
    validates :password, confirmation: { case_sensitive: true }
end

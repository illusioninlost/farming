class Farmer < ApplicationRecord
    has_secure_password
    validates :username, presence: true, length: 3..20, uniqueness: true
    validates :password, presence: true
    validates :name, presence: true
    has_many :items
end

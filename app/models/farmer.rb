class Farmer < ApplicationRecord
    has_secure_password
    validates :username, presence: true, length: 3..20, uniqueness: true
    validates :password, length: 3..20, presence: true
    validates :name, presence: true, uniqueness: true
    
end

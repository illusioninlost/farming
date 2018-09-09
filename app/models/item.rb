class Item < ApplicationRecord
    validates :name, presence: true, length: { maximum: 30 }
    validates :value, presence: true, numericality: true, length: { in: 1..20 }
    validates :weight, presence: true, numericality: true, length: { in: 1..20 }
    validates :location, presence: true, length: { maximum: 30 }, uniqueness: true
    belongs_to :farmer


end

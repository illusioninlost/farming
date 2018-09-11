class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :value, :weight, :location, :comments

  belongs_to :farmer
  has_many :comments
end

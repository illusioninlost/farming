class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :value, :weight, :location

  belongs_to :farmer
end

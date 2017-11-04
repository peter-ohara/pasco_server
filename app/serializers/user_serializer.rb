class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :pasco_gold

  has_many(:courses)
end

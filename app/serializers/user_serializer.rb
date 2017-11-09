class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :programme, :pasco_gold

  has_many(:courses)
end

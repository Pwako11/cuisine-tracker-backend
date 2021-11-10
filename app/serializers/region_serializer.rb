class RegionSerializer
  include JSONAPI::Serializer
  attributes :continent, :country, :state

  has_many :dishes, serializer: DishSerializer
  has_many :users, serializer: UserSerializer
end

class UserSerializer
  include JSONAPI::Serializer
  
  attributes :name, :username

  has_many :dishes, serializer: DishSerializer
  has_many :regions, serializer: RegionSerializer

end

class DishSerializer
  include JSONAPI::Serializer
  attributes :name, :ingredients

  belongs_to :user, serializer: UserSerializer
  belongs_to :region, serializer: RegionSerializer

end

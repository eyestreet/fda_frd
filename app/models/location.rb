#
class Location
  include Mongoid::Document

  field :long_name, type: String

  field :short_name, type: String

  field :coordinates, type: Array

  # NOTE: Made this polymorphic just in case we need locations for other models in the future
  embedded_in :locatable, polymorphic: true
end

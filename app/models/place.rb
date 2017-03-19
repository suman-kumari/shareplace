class Place < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, if: -> (obj) { obj.address.present? and obj.address_changed? }

  scope :are_public, -> { where(is_public: true) }
end

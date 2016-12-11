module Organizational
  class Entity < ApplicationRecord
    has_many :descriptions, as: :describable, class_name: 'Descriptive::Description', dependent: :destroy
    has_one :location, as: :locatable, class_name: 'Geo::Location', dependent: :destroy
    has_many :contacts, as: :accessible, class_name: 'Contact::Contact', dependent: :destroy
    has_many :categories, class_name: 'Ontological::Category'

    validates :name, presence: true,
                     length: { within: 2..80 }
    validates :url, presence: true
    validates_associated :descriptions
    validates_associated :location
    validates_associated :contacts
    validates_associated :categories
  end
end

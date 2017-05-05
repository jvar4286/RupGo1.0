class Region < ApplicationRecord
	validates :name, presence: true
	has_many :destinations, through: :has_regions

	has_many :has_regions
	has_many :deals, through: :has_regions
end

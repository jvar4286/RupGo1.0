class Destination < ApplicationRecord
	include AASM

	belongs_to :user
	has_many :has_categories
	has_many :categories, through: :has_categories

	validates :place, presence: true, uniqueness: true
	validates :why_go, presence: true

	after_create :save_categories
	has_attached_file :cover, styles: { medium: "1280x720", thumb: "800x600"}
	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/

	scope :publicados, ->{ where(state: "published") }

	scope :ultimos, ->{ order("created_at DESC") }

	def categories=(value)
		@categories = value
	end

	aasm column: "state" do
		state :in_draft, initial: true
		state :published

		event :publish do
			transitions from: :in_draft, to: :published
		end

		event :unpublish do
			transitions from: :published, to: :in_draft
		end
	end

	private

	def save_categories
		@categories.each do |category_id|
			HasCategory.create(category_id: category_id,destination_id: self.id)
		end
	end
end

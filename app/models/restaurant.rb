class Restaurant < ApplicationRecord
    geocoded_by :address
    after_validation :geocode, if: :will_save_change_to_address?

    belongs_to :user
    has_one_attached :photo

    validates :name, presence: true
    validates :address, presence: true
end

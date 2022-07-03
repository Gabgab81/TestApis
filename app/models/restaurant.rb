class Restaurant < ApplicationRecord
    geocoded_by :address
    after_validation :geocode, if: :will_save_change_to_address?

    validates :name, presence: true
    validates :address, presence: true
end

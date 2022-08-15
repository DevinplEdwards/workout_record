class Exercise < ApplicationRecord
    has_one :entry, dependent: :destroy
    accepts_nested_attributes_for :entry
    belongs_to :user
end

class Exercise < ApplicationRecord
    has_many :entries, dependent: :destroy
    accepts_nested_attributes_for :entries
end

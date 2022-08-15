class Entry < ApplicationRecord
    validates :weight, presence: true
    belongs_to :exercise
    accepts_nested_attributes_for :exercise
end

class Exercise < ApplicationRecord
    has_one :entry, dependent: :destroy
    accepts_nested_attributes_for :entry
    belongs_to :user
    after_create :create_default_entry
    
    private

    def create_default_entry
        entry = build_entry(weight: 0)
        entry.save
    end

end

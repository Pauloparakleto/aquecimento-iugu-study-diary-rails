class List < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true, length: { minimum: 5, maximum: 100 }
    before_validation :normalize_params, on: :create

    private
    def normalize_params
        normalize_name
        normalize_category
    end
    def normalize_name
      self.name = name.downcase
    end

    def normalize_category
        self.category = category.downcase
      end
end
